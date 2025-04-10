USE AltitudeAnalysts;

INSERT INTO TravelAgent (Id, FirstName, LastName, Company, Email)
VALUES
(1, 'Alice', 'Johnson', 'Boston Travel Inc.', 'alice.johnson@bostontravel.com'),
(2, 'David', 'Williams', 'Heathrow Travel Co.', 'david.williams@heathrowtravel.com'),
(3, 'Sophia', 'Miller', 'Luton Getaways', 'sophia.miller@lutongetaways.com');

INSERT INTO Airline (Name, Id)
VALUES
('Spirit', 1),
('RyanAir', 2);

INSERT INTO AirlineManager (Id, FirstName, LastName, Email, AirlineId)
VALUES
(1, 'John', 'Smith', 'john.smith@loganairport.com', 1),
(2, 'Emma', 'Johnson', 'emma.johnson@heathrow.com', 2),
(3, 'James', 'Brown', 'james.brown@lutonairport.com', 1);



INSERT INTO Airport (Code, Disrupted, SecurityWaitTime)
VALUES
('BOS', 1, 30),
('LHR', 0, 15),
('LTN', 1, 50);

INSERT INTO Status (Id, Cancelled, OnTime, DelayedCascading, DelayedTechnicalIssues, DelayedAdminIssues, DelayedOther, DelayedWeather, DelayedOperational)
VALUES
(1, 0, 1, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 0, 0),
(3, 0, 1, 0, 0, 0, 0, 0, 0);

INSERT INTO Flight (FlightNumber, ArrivalTime, DepartureTime, DepartureDate, Terminal, Gate, Occupancy, Price, FlightTime, AirlineManagerId, ArrivalAirportCode, DepartureAirportCode, Status, AirlineId)
VALUES
(1, '14:30:00', '11:00:00', '2025-03-30', 'A', 'A1', 150, 300, 180, 1, 'BOS', 'LHR', 1, 2),
(2, '16:45:00', '13:30:00', '2025-03-30', 'B', 'B3', 180, 350, 210, 2, 'LHR', 'LTN', 2, 1),
(3, '09:00:00', '06:30:00', '2025-03-30', 'C', 'C5', 120, 250, 120, 3, 'LTN', 'BOS', 1, 2);

INSERT INTO AirportManager (Id, FirstName, LastName, AirportCode)
VALUES
(1, 'Lena', 'Marshall', 'BOS'),
(2, 'Damien', 'Cruz', 'LHR'),
(3, 'Avery', 'Thornton', 'LTN');

INSERT INTO Tracks (FlightNumber, AirportManagerID)
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Seat (Available, Class, FlightNumber, SeatNumber)
VALUES
(0, 'Economy', 1, 1),
(1, 'Business', 2, 2),
(1, 'Economy', 1, 3);

INSERT INTO Passenger (FirstName, LastName, DOB, Email, Id)
VALUES
('John', 'Doe', '1985-06-15', 'john.doe@example.com', 1),
('Jane', 'Smith', '1990-02-20', 'jane.smith@example.com', 2),
('Emily', 'Johnson', '1992-11-11', 'emily.johnson@example.com', 3);

INSERT INTO Booked (BoardingPass, Amenities, Luggage, FlightNumber, PassengerId)
VALUES
('https://example.com/boarding-pass/101-JD', 1, 2, 1, 1),
('https://example.com/boarding-pass/102-JS', 0, 1, 2, 2),
('https://example.com/boarding-pass/103-EJ', 1, 3, 3, 3);

INSERT INTO Business (Id, Name, Type, AirportCode)
VALUES
(1, 'LoganEats', 'Dining', 'BOS'),
(2, 'HeathrowShops', 'GiftShop', 'LHR'),
(3, 'LutonMedicates', 'Pharmacy', 'LTN');

INSERT INTO PassengerTravelAgent (PassengerId, TravelAgentId)
VALUES
(1, 1),
(2, 1),
(3, 3);
