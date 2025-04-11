########################################################
# Flight Stats blueprint
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
flight_stats = Blueprint('flight stats', __name__)


#------------------------------------------------------------
# Returns the percentage of flights 
# that departed on time on that day [Bob-1]
# works

@flight_stats.route('/flights/<date>', methods=['GET'])
def get_flights(date):
    current_app.logger.info('GET /flights/<date> route')
    cursor = db.get_db().cursor()
    cursor.execute('SELECT f.DepartureDate, (SUM(s.OnTime) / COUNT(*) * 100) AS OnTimePercentage FROM Flight f JOIN Status s ON f.Status = s.Id WHERE AirlineId = 1 GROUP BY f.DepartureDate ORDER BY f. DepartureDate;') 
    
    theData = cursor.fetchall()
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


#------------------------------------------------------------
# Returns the average on-time rate of the given airline [Bob-2]
# works

@flight_stats.route('/flights/<airlineID>/onTimeRate', methods=['GET'])
def get_on_time_rate(airlineID):
    current_app.logger.info('GET /flights/<airlineID>/onTimeRate route')
    cursor = db.get_db().cursor()
    cursor.execute('SELECT f.AirlineId, a.Name AS AirlineName, (SUM(s.OnTime) / COUNT(s.OnTime) * 100) AS OnTimePercentage FROM Flight f JOIN Status s ON f.Status = s.Id JOIN Airline a ON f.AirlineId = a.Id GROUP BY f.AirlineId, a.Name ORDER BY OnTimePercentage DESC;')

    theData = cursor.fetchall()
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


#------------------------------------------------------------
# Returns the average occupancy rate for all flights for a given airline [Bob-3]
# works

@flight_stats.route('/flights/<airlineID>/occupancyRate', methods=['GET'])
def get_avg_occupancy(airlineID):
    current_app.logger.info('GET /flights/<airlineID>/occupancyRate route')
    cursor = db.get_db().cursor()
    cursor.execute('SELECT f.DepartureDate, '
                        '(COUNT(b.PassengerId) / f.Occupancy * 100) AS OccupancyPercentage ' \
                        'FROM Flight f LEFT JOIN Booked b ON f.FlightNumber = b.FlightNumber ' \
                        'GROUP BY f.DepartureDate, f.Occupancy ' \
                        'ORDER BY f.DepartureDate DESC;')
    
    theData = cursor.fetchall()
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


#------------------------------------------------------------
# Returns common reasons for flight delays [Bob-4]
# IndexError: Replacement index 1 out of range for positional args tuple

@flight_stats.route('/flights/<airlineID>', methods=['GET'])
def reasons_flight_delays(airlineID):
    current_app.logger.info('GET /flights/<airlineID> route')
    cursor = db.get_db().cursor()
    cursor.execute('SELECT SUM(s.DelayedCascading) AS DelayedCascading, ' \
                        'SUM(s.DelayedTechnicalIssues) AS DelayedTechnicalIssues, ' \
                        'SUM(s.DelayedAdminIssues) AS DelayedAdminIssues, ' \
                        'SUM(s.DelayedOther) AS DelayedOther, ' \
                        'SUM(s.DelayedWeather) AS DelayedWeather, ' \
                        'SUM(s.DelayedOperational) AS DelayedOperational ' \
                        'FROM Flight f ' \
                        'JOIN Status s ON f.Status = s.Id ' \
                        'WHERE  f.AirlineId = 1;') 
    
    theData = cursor.fetchall()
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


#------------------------------------------------------------
# Returns the most and least popular times for flights [Bob-5]
# works

@flight_stats.route('/flights', methods=['GET'])
def get_flight_times():
    current_app.logger.info('GET /flights route')
    cursor = db.get_db().cursor()
    cursor.execute('SELECT DepartureDate, COUNT(*) AS FlightCount ' \
                        'FROM Flight ' \
                        'GROUP BY DepartureDate ' \
                        'ORDER BY FlightCount DESC;')
    
    theData = cursor.fetchall()
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response

