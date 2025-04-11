from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict
import datetime


#------------------------------------------------------------
# Create a new Blueprint object, which is a collection of 
# routes.
flight_searching = Blueprint('flight_searching', __name__)


#------------------------------------------------------------
# Returns all flights between these two dates [Stacy-1] -- COMPLETE WITHOUT DATES 

@flight_searching.route('/flight_searching/<Date1>/<Date2>', methods=['GET'])

def get_flightdates(Date1 ,Date2):
    cursor = db.get_db().cursor()
    query = '''SELECT f.FlightNumber, f.ArrivalAirportCode,  DepartureTime, DepartureDate, f.Price, f.AirlineId
                FROM Flight f
                WHERE f.DepartureDate BETWEEN %s AND %s ;
                '''
    
    data = (Date1, Date2)
    cursor.execute(query, data)    
    theData = cursor.fetchall()
    results = []

    # Groups the date and time so that it is in a jsonifiable format
    for row in theData:
        departure_date = row['DepartureDate']

        time = row['DepartureTime']
        #If the time is in a format that isnt jsonifable change the format to the standard time format
        if isinstance(time, datetime.timedelta):
            jsonifiable_time = (datetime.datetime.min + time).time()
        else:
            jsonifiable_time = time

        departure_datetime = datetime.datetime.combine(departure_date, jsonifiable_time)

        result = {
            "FlightNumber": row["FlightNumber"],
            "ArrivalAirportCode": row["ArrivalAirportCode"],
            "DepartureDateTime": departure_datetime.isoformat(),
            "AirlineId": row["AirlineId"],
            "Price": row["Price"]
        }

        results.append(result)

    the_response = make_response(jsonify(results))
    the_response.status_code = 200
    return the_response





#------------------------------------------------------------
# Returns all the flights with their prices for a specific airline [Stacy-3] COMPLETE
@flight_searching.route('/flight_searching/<Id>', methods=['GET']) 

def get_prices(Id):
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT f.FlightNumber, f.Price, a.Name AS Airline
FROM Flight f
JOIN Airline a ON f.AirlineId = a.Id
WHERE a.Id = {0};
    '''.format(Id))
    
    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


#------------------------------------------------------------
# Returns seat location and price information for the given flight [Stacy-5] COMPLETE

@flight_searching.route('/flight_searching/<FlightNumber>/flightinfo', methods=['GET'])

def get_flightinfo(FlightNumber): 
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT s.SeatNumber, s.Class
FROM Seat s
JOIN Flight f ON s.FlightNumber = f.FlightNumber
WHERE f.FlightNumber = {0}; 
    '''.format(FlightNumber))

    theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response



#------------------------------------------------------------ 
# Returns all the flights leaving from the given airport [Liam-5] -COMPLETE

@flight_searching.route('/flight_searching/<DepartureAirportCode>/location', methods=['GET'])

def get_flightlocationAirport(DepartureAirportCode):
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT FlightNumber, Terminal, Gate, ArrivalAirportCode, DepartureDate, DepartureTime, Status
                    FROM Flight
                    WHERE  DepartureAirportCode = '{}';'''.format(DepartureAirportCode))
    
    theData = cursor.fetchall()

    results = []

    # Groups the date and time so that it is in a jsonifiable format
    for row in theData:
        departure_date = row['DepartureDate']

        time = row['DepartureTime']
        #If the time is in a format that isnt jsonifable change the format to the standard time format
        if isinstance(time, datetime.timedelta):
            jsonifiable_time = (datetime.datetime.min + time).time()
        else:
            jsonifiable_time = time

        departure_datetime = datetime.datetime.combine(departure_date, jsonifiable_time)

        result = {
            "FlightNumber": row["FlightNumber"],
            "Terminal": row["Terminal"],
            "Gate": row["Gate"],
            "ArrivalAirportCode": row["ArrivalAirportCode"],
            "DepartureDateTime": departure_datetime.isoformat(),
            "Status": row["Status"]
        }

        results.append(result)

    the_response = make_response(jsonify(results))
    the_response.status_code = 200
    return the_response


 

#------------------------------------------------------------
# Returns all flights leaving from a given terminal at a given airport [Liam-7]

@flight_searching.route('/flight_searching/<DepartureAirportCode>/<Terminal>', methods=['GET'])
def get_flightlocation(DepartureAirportCode, Terminal): 
    cursor = db.get_db().cursor()

    query = '''SELECT FlightNumber, DepartureTime, DepartureDate, Terminal, Gate, ArrivalAirportCode, Status
               FROM Flight
               WHERE Terminal = %s AND DepartureAirportCode = %s;'''
    
    data = (Terminal, DepartureAirportCode)
    cursor.execute(query, data)    
    theData = cursor.fetchall()

    results = []

    # Groups the date and time so that it is in a jsonifiable format
    for row in theData:
        departure_date = row['DepartureDate']

        time = row['DepartureTime']
        #If the time is in a format that isnt jsonifable change the format to the standard time format
        if isinstance(time, datetime.timedelta):
            jsonifiable_time = (datetime.datetime.min + time).time()
        else:
            jsonifiable_time = time

        departure_datetime = datetime.datetime.combine(departure_date, jsonifiable_time)

        result = {
            "FlightNumber": row["FlightNumber"],
            "Terminal": row["Terminal"],
            "Gate": row["Gate"],
            "ArrivalAirportCode": row["ArrivalAirportCode"],
            "DepartureDateTime": departure_datetime.isoformat(),
            "Status": row["Status"]
        }

        results.append(result)

    the_response = make_response(jsonify(results))
    the_response.status_code = 200
    return the_response

