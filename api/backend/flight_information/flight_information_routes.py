########################################################
# Flight Information blueprint of endpoints
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
flight_information = Blueprint('flight_information', __name__)

#------------------------------------------------------------
# Returns information about gate changes, delays, or cancellations for the given flight 
@flight_information.route('/flightChanges/<flight_id>', methods=['GET'])
def get_changes(flight_id):

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT s.Cancelled
                      FROM Status s
                      JOIN Flight f ON f.Status = s.Id
                      JOIN Booked b ON b.FlightNumber = f.FlightNumber
                      JOIN Passenger p ON p.Id = b.PassengerId
                      WHERE f.FlightNumber = %s''', (flight_id))
    cancelled_data = cursor.fetchall()

    # Second query
    cursor.execute('''SELECT s.DelayedAdminIssues, s.DelayedCascading, s.DelayedOperational, 
                             s.DelayedOther, s.DelayedTechnicalIssues, s.DelayedWeather
                      FROM Status s
                      JOIN Flight f ON f.Status = s.Id
                      JOIN Booked b ON b.FlightNumber = f.FlightNumber
                      JOIN Passenger p ON p.Id = b.PassengerId
                      WHERE f.FlightNumber = %s''', (flight_id,))
    delay_data = cursor.fetchall()

    # Combine into one response
    response_data = {
        "cancelled": cancelled_data,
        "delays": delay_data
    }
    the_response = make_response(jsonify(response_data))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Changes the passenger's seat on the given flight to a seat of the given class
@flight_information.route('/seatChange/<seat_id>/<flight_id>/<class_name>', methods=['PUT'])
def update_seat(seat_id, flight_id, class_name):
    current_app.logger.info('PUT /update seat route')

    query = '''UPDATE Seat
                SET Class = %s
                WHERE FlightNumber = %s
                AND SeatNumber = %s '''

    data = (class_name, flight_id, seat_id)

    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'Seat Updated!'

#------------------------------------------------------------
# Deletes the given flight from the system
@flight_information.route('/delete_flight/<flight_id>', methods=['DELETE'])
def delete_flight(flight_id):
    current_app.logger.info('DELETE /delete flight')

    query = '''DELETE FROM Flight
            WHERE FlightNumber = %s; '''

    data = (flight_id,)

    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'Flight Deleted!'

#------------------------------------------------------------
# Returns if the given flight’s time differs from the provided one.
@flight_information.route('/flight_time/<flight_id>', methods=['GET'])
def flight_time_change(flight_id):

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT f.FlightNumber, s.OnTime, f.Status
                    FROM Flight f
                    JOIN Status s ON f.Status = s.Id
                    WHERE f.FlightNumber = %s;''', (flight_id))
    flight_data = cursor.fetchall()

    # Combine into one response
    the_response = make_response(jsonify(flight_data))
    the_response.status_code = 200
    return the_response

#------------------------------------------------------------
# Adds a new flight to the system 
@flight_information.route('/addFlight', methods=['POST'])
def add_flight():
    current_app.logger.info('POST /add flight')

    flight_data = request.get_json()

    query = '''
        INSERT INTO Flight (
            FlightNumber, ArrivalTime, DepartureTime, 
            DepartureDate, Terminal, Gate, Occupancy, 
            Price, FlightTime, AirlineManagerId, 
            ArrivalAirportCode, DepartureAirportCode, 
            Status, AirlineId
        ) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    '''

    data = (
        flight_data.get('flight_id'),
        flight_data.get('arrival_time'),
        flight_data.get('departure_time'),
        flight_data.get('departure_date'),
        flight_data.get('terminal'),
        flight_data.get('gate'),
        flight_data.get('occupancy'),
        flight_data.get('price'),
        flight_data.get('flight_time'),
        flight_data.get('airline_manager_id'),
        flight_data.get('arrival_airport_code'),
        flight_data.get('departure_airport_code'),
        flight_data.get('status'),
        flight_data.get('airline_id')
    )

    cursor = db.get_db().cursor()
    r = cursor.execute(query, data)
    db.get_db().commit()
    return 'Flight Added!'

#------------------------------------------------------------
# Returns the flights destination and arrival airport
@flight_information.route('/flight_route/<flight_id>', methods=['GET'])
def flight_route(flight_id):

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT f.ArrivalAirportCode, f.DepartureAirportCode
                    FROM Flight f
                    WHERE f.FlightNumber = %s;''', (flight_id))
    flight_data = cursor.fetchall()

    # Combine into one response
    the_response = make_response(jsonify(flight_data))
    the_response.status_code = 200
    return the_response
