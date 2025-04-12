########################################################
# airports blueprint
########################################################
from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
from backend.ml_models.model01 import predict

#-----------------------------------------------------------
# create a new blueprint object
airports = Blueprint('airports', __name__)

#-----------------------------------------------------------
# get airport metrics for a specificied airport
@airports.route('/airports/<airport_id>/airport-metrics', methods=['GET'])
def get_airport_metrics(airport_id):
    current_app.logger.info('GET /airports/<airport_id> route')
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT a.Disrupted, a.SecurityWaitTime
                    From Airport a
                        JOIN Flight f ON f.DepartureAirportCode = a.Code
                        JOIN Booked b ON b.FlightNumber = f.FlightNumber
                        JOIN Passenger p ON p.Id = b.PassengerId
                    WHERE p.Id = %s
    ''', (airport_id))
    data = cursor.fetchall()

    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#-----------------------------------------------------------
# get the percentage of flights departed on time in the past month for a given airport
@airports.route('/flights/<airport_id>/on-time-percentage', methods=['GET'])
def get_on_time_percentage(airport_id):
    current_app.logger.info('GET /flights/<airport_id> route')
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT (COUNT(f.FlightNumber) / 
                   (SELECT COUNT(*) 
                    FROM Flight 
                    WHERE DepartureDate >= CURDATE() - INTERVAL 1 MONTH
                    AND DepartureAirportCode = %s)) * 100 AS OnTimePercentageLastMonth
                FROM Flight f
                JOIN Status s ON f.Status = s.Id
                WHERE s.OnTime = 1 AND f.DepartureDate >= CURDATE() - INTERVAL 1 MONTH
                AND f.DepartureAirportCode = %s
            ''', (airport_id, airport_id))
    
    data = cursor.fetchall()

    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#-----------------------------------------------------------
# get on-time departure rates across airlines operating at a given airport
@airports.route('/flights/<airport_id>/on-time-rates-airlines', methods=['GET'])
def get_on_time_rates_airlines(airport_id):
    current_app.logger.info('GET /flights/<airport_id> route')
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT a.Name AS AirlineName,
                        (COUNT(IF(s.OnTime = 1, 1, NULL)) / COUNT(f.FlightNumber)) * 100 AS OnTime
                    FROM Flight f
                    JOIN Airline a ON f.AirlineID = a.Id
                    JOIN Status s ON f.status = s.ID
                    WHERE f.DepartureAirportCode = %s
                    GROUP BY a.Name
                    ORDER BY OnTime DESC
    ''', (airport_id))

    data = cursor.fetchall()
    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#-----------------------------------------------------------
# get the peak days of flight activity for a given airport
@airports.route('flights/<airport_id>/peak-days', methods=['GET'])
def get_peak_days(airport_id):
    current_app.logger.info('GET /flights/<airport_id> route')
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT DepartureDate, COUNT(*) AS FlightsPerDay
                        FROM Flight
                        WHERE DepartureAirportCode = %s
                        GROUP BY DepartureDate
                        ORDER BY FlightsPerDay DESC
    ''', (airport_id))

    data = cursor.fetchall()

    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#-----------------------------------------------------------
# get the disruption status of a given airport
@airports.route('flights/<airport_id>/disrupted', methods=['GET'])
def get_disruption_status(airport_id):
    current_app.logger.info('GET /flights/<airport_id> route')
    cursor = db.get_db().cursor()
    cursor.execute('''SELECT Code, Disrupted
                        FROM Airport
                        WHERE Code = %s
    ''', (airport_id))
    data = cursor.fetchall()

    response = make_response(jsonify(data))
    response.status_code = 200
    return response

#-----------------------------------------------------------
# update the gate number for a given flight to a given gate
@airports.route('/flights/<flight_id>/<gate_id>', methods=['PUT'])
def update_gate_number(flight_id, gate_id):
    current_app.logger.info('PUT /flights/<flight_id>/<gate_id> route')

    cursor = db.get_db().cursor()

    cursor.execute('''UPDATE Flight
                        SET Gate = %s
                        WHERE FlightNumber = %s
                        AND Status IN (
                            SELECT Id FROM Status WHERE OnTime != 1)
    ''', (gate_id, flight_id))

    db.get_db().commit()
    return 'gate updated'
    
#-----------------------------------------------------------
# delete closed businesses from the airport system
@airports.route('/airport/delete-closed-businesses', methods=['DELETE'])
def delete_business():
    current_app.logger.info('DELETE /airport/<businesses> route')
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Business WHERE OpenOrClose = 0')
    
    db.get_db().commit()
    
    return  'all closed businesses deleted!'