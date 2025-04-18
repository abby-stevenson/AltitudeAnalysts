########################################################
# Passenger metrics blueprint of endpoints
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
import datetime

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
passenger_metrics = Blueprint('passenger_metrics', __name__)

#------------------------------------
# Gets information for all the flights that the given customer is booked onto
@passenger_metrics.route('/flight_information/<passenger_id>', methods=['GET'])
def passenger_flights_info(passenger_id):


    cursor = db.get_db().cursor()
    cursor.execute("""SELECT f.FlightNumber, f.DepartureDate, f.ArrivalAirportCode, 
                   f.DepartureAirportCode 
                   FROM Flight f JOIN Booked b ON f.FlightNumber = b.FlightNumber 
                   JOIN Passenger p ON b.PassengerId = p.Id WHERE p.Id = {0}""".format(passenger_id))
    
    data = cursor.fetchall()
    
    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Gets information about all flight schedule changes or 
# cancellations for all of a travel agent's passengers 
@passenger_metrics.route('/client_schedule_changes/<travel_agent_id>', methods=['GET'])
def passenger_flight_changes(travel_agent_id):
    
    cursor = db.get_db().cursor()
    cursor.execute("""SELECT s.Cancelled, s.OnTime, s.DelayedCascading, s.DelayedTechnicalIssues, 
                   s.DelayedAdminIssues, s.DelayedOther, s.DelayedWeather, s.DelayedOperational
                    FROM Status s
                        JOIN Flight f ON s.id = f.Status
                        JOIN Booked b ON b.FlightNumber = f.FlightNumber
                        JOIN Passenger p ON p.id = b.PassengerId
                        JOIN PassengerTravelAgent pta ON pta.PassengerId = p.Id
                        JOIN TravelAgent ta ON ta.id = pta.TravelAgentId
                    WHERE pta.TravelAgentId = {0}""".format(travel_agent_id))
    
    data = cursor.fetchall()
    
    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Gets all booked flights for the given passenger
@passenger_metrics.route('/flight_numbers/<passenger_id>', methods=['GET'])
def passenger_flights(passenger_id):
    cursor = db.get_db().cursor()
    cursor.execute("""SELECT b.FlightNumber
                        FROM Booked b
                            JOIN Passenger p ON b.PassengerId = p.Id
                        WHERE p.Id = {0}""".format(passenger_id))
    
    data = cursor.fetchall()
    
    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Gets the status of a given flight
@passenger_metrics.route('/flight_statuses/<flight_number>', methods=['GET'])
def passenger_flights_status(flight_number):
    cursor = db.get_db().cursor()
    cursor.execute("""SELECT f.FlightNumber, s.Cancelled, s.OnTime, s.DelayedCascading, 
                   s.DelayedTechnicalIssues, s.DelayedAdminIssues,
                    s.DelayedOther, s.DelayedWeather, s.DelayedOperational
                        FROM Status s
                            JOIN Flight f ON f.Status = s.Id
                        WHERE f.FlightNumber = %s""", (flight_number))
    
    data = cursor.fetchall()
    
    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Gets url of boarding pass for the given passenger for the given flight
@passenger_metrics.route('/boarding_pass/<passenger_id>/<flight_id>/<seat_id>', methods=['GET'])
def passenger_boarding_pass(passenger_id, flight_id, seat_id):
    cursor = db.get_db().cursor()
    cursor.execute("""SELECT BoardingPass, SeatNumber, ArrivalTime, DepartureTime, s.Class
                        FROM Booked b
                            JOIN Passenger p ON p.Id = b.PassengerId
                            JOIN Flight f ON f.FlightNumber = b.FlightNumber
                            JOIN Seat s ON s.FlightNumber = f.flightNumber
                        WHERE p.Id = %s AND b.FlightNumber = %s AND s.SeatNumber = %s""", (passenger_id, flight_id, seat_id))
    
    data = cursor.fetchall()

    results = []

    # Groups the date and time so that it is in a jsonifiable format
    for row in data:
        d_time = row['DepartureTime']
        a_time = row['ArrivalTime']
        
        # Convert timedelta to standard time format if needed
        if isinstance(d_time, datetime.timedelta):
            jsonifiable_d_time = (datetime.datetime.min + d_time).time()
        else:
            jsonifiable_d_time = d_time

        if isinstance(a_time, datetime.timedelta):
            jsonifiable_a_time = (datetime.datetime.min + a_time).time()
        else:
            jsonifiable_a_time = d_time

        result = {
            "BoardingPass": row["BoardingPass"],
            "SeatNumber": row["SeatNumber"],
            "FlightNumber": int(flight_id),
            "DepartureTime": jsonifiable_d_time.isoformat(),
            "ArrivalTime": jsonifiable_a_time.isoformat(),
            "Class": row['Class']
        }

    results.append(result)

    response = make_response(jsonify(results))
    response.status_code = 200
    return response

#------------------------------------------------------------
# Adds a new passenger to the system with the given passengerID 
# under the given agentID
@passenger_metrics.route('/add_passenger/<agentID>/passenger', methods=['POST'])
def add_passenger(agentID):
    current_app.logger.info('POST /add passenger')
    passenger_data = request.get_json()
    passenger_id = passenger_data.get('Id')

    query1 = '''
        INSERT INTO Passenger (FirstName, LastName, DOB, Email, Id)
        VALUES (%s, %s, %s, %s, %s);
    '''
    data1 = (
        passenger_data.get('FirstName'),
        passenger_data.get('LastName'),
        passenger_data.get('DOB'),
        passenger_data.get('Email'),
        passenger_id
    )

    query2 = '''
        INSERT INTO PassengerTravelAgent (PassengerId, TravelAgentId)
        VALUES (%s, %s);
    '''
    data2 = (
        passenger_id,
        agentID
    )

    cursor = db.get_db().cursor()
    cursor.execute(query1, data1)
    cursor.execute(query2, data2)
    db.get_db().commit()

    return 'Passenger added to the given travel agent!'
    
#------------------------------------------------------------
# Updates the booking for the given passenger from the first flight to the second
@passenger_metrics.route('/update_passenger_flight/<flightID1>/<flightID2>/<passengerID>', methods=['PUT'])
def update_passenger(flightID1, passengerID, flightID2):
    current_app.logger.info('PUT /update booking')
    
    query = """UPDATE Booked
       SET FlightNumber = %s
       WHERE PassengerId = %s AND FlightNumber = %s
        """

    data = (flightID1, passengerID, flightID2)

    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    
    return 'Passenger updated!'

#------------------------------------------------------------
# Removes the booking for the given passenger on the given flight 
@passenger_metrics.route('/delete_booking/<flightID>/<passengerID>', methods=['DELETE'])
def delete_booking(flightID, passengerID):
    current_app.logger.info('DELETE /delete booking')
    
    query = """DELETE FROM Booked
       WHERE FlightNumber = %s AND PassengerId = %s"""

    data = (flightID, passengerID,)

    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'Booking Deleted!'


#-------------------------------------------------------------------------
# Returns passenger if it is the system
@passenger_metrics.route('/checkpassenger/<PassengerId>/exists', methods=['GET'])
def get_passengerTest(PassengerId): 
    cursor = db.get_db().cursor()
    cursor.execute('''
        SELECT p.Id AS PassengerId, ta.Id AS TravelAgentId
        FROM Passenger p
        JOIN PassengerTravelAgent pta ON pta.PassengerId = p.Id
        JOIN TravelAgent ta ON ta.Id = pta.TravelAgentId
        WHERE p.Id = {0}; 
    '''.format(PassengerId))

    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


#-------------------------------------------------------------------------
# Returns booking if it is the system
@passenger_metrics.route('/checkpassenger/<FlightNumber>/<PassengerId>/exists', methods=['GET'])
def get_bookingTest(FlightNumber, PassengerId): 
    cursor = db.get_db().cursor()
    cursor.execute('''
        SELECT FlightNumber, PassengerId
        FROM Booked
        WHERE FlightNumber = {0} AND PassengerId = {0}; 
    '''.format(FlightNumber, PassengerId))

    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

#-------------------------------------------------------------------------
# Given a seat ID checks its class
@passenger_metrics.route('/checkseat/<FlightNumber>/<SeatNumber>', methods=['GET'])
def get_seatTest(FlightNumber, SeatNumber): 
    cursor = db.get_db().cursor()
    cursor.execute('''
        SELECT SeatNumber, FlightNumber, Class
        FROM Seat
        WHERE SeatNumber = %s AND FlightNumber = %s    
        ''', (SeatNumber, FlightNumber))

    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


