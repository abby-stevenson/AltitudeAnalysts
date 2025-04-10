DROP DATABASE IF EXISTS AltitudeAnalysts;
CREATE DATABASE IF NOT EXISTS AltitudeAnalysts;

USE AltitudeAnalysts;

CREATE TABLE TravelAgent (
  Id        int PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName  varchar(50) NOT NULL,
  Company   varchar(50) NOT NULL,
  Email     varchar(50) NOT NULL
);

CREATE TABLE Airline(
    Id int PRIMARY KEY,
    Name varchar(50) NOT NULL
);

CREATE TABLE AirlineManager(
  Id int PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  AirlineId int NOT NULL,
  CONSTRAINT fk_16
      FOREIGN KEY (AirlineId) REFERENCES Airline(Id)
      ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE Airport (
  Code varchar(15) PRIMARY KEY,
  Disrupted TINYINT(1) NOT NULL,
  SecurityWaitTime int
);

CREATE TABLE Status(
   Id int PRIMARY KEY,
   Cancelled TINYINT(1) default FALSE,
   OnTime TINYINT(1) default TRUE,
   DelayedCascading TINYINT(1) default FALSE,
   DelayedTechnicalIssues TINYINT(1) default FALSE,
   DelayedAdminIssues TINYINT(1) default FALSE,
   DelayedOther TINYINT(1) default FALSE,
   DelayedWeather TINYINT(1) default FALSE,
   DelayedOperational TINYINT(1) default FALSE
);

CREATE TABLE Flight(
  FlightNumber int PRIMARY KEY,
  ArrivalTime  TIME NOT NULL,
  DepartureTime TIME NOT NULL,
  DepartureDate DATE NOT NULL,
  Terminal     varchar(15) NOT NULL,
  Gate         varchar(5) NOT NULL,
  Occupancy    int NOT NULL,
  Price        int NOT NULL,
  FlightTime   int NOT NULL,
  AirlineManagerId int NOT NULL,
  ArrivalAirportCode varchar(15) NOT NULL,
  DepartureAirportCode varchar(15) NOT NULL,
  Status int NOT NULL,
  AirlineId int NOT NULL,
  CONSTRAINT fk_1
      FOREIGN KEY (AirlineManagerId) REFERENCES AirlineManager(Id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_2
      FOREIGN KEY (ArrivalAirportCode) REFERENCES Airport(Code)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_3
      FOREIGN KEY (DepartureAirportCode) REFERENCES Airport(Code)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_4
      FOREIGN KEY (Status) REFERENCES Status(Id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_15
      FOREIGN KEY (AirlineId) REFERENCES Airline(Id)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE AirportManager(
   Id int PRIMARY KEY NOT NULL,
   FirstName varchar(50) NOT NULL,
   LastName varchar(50) NOT NULL,
   AirportCode varchar(15) NOT NULL,
   CONSTRAINT fk_13
       FOREIGN KEY (AirportCode) REFERENCES Airport (Code)
       ON UPDATE CASCADE ON DELETE RESTRICT
);

Create TABLE Tracks (
  FlightNumber int,
  AirportManagerID int,
  PRIMARY KEY (FlightNumber, AirportManagerID),
  CONSTRAINT fk_8 FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber)
                    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_9 FOREIGN KEY (AirportManagerID) REFERENCES AirportManager(Id)
                    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Seat (
  FlightNumber int,
  SeatNumber int,
  PRIMARY KEY (FlightNumber, SeatNumber),
  Available TINYINT(1) NOT NULL,
  Class varchar(20) NOT NULL,
  CONSTRAINT fk_5 FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber)
                  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Passenger (
  Id int PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  DOB date NOT NULL,
  Email varchar(50) NOT NULL
);

CREATE TABLE Booked (
  FlightNumber int,
  PassengerId int,
  PRIMARY KEY (FlightNumber, PassengerId),
  BoardingPass varchar(100) NOT NULL,
  Amenities TINYINT(1) NOT NULL,
  Luggage int NOT NUll,

  CONSTRAINT fk_6 FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber)
                    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_7 FOREIGN KEY (PassengerId) REFERENCES Passenger(Id)
                     ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Business(
   Id int PRIMARY KEY,
   Name varchar(100) NOT NULL,
   Type varchar(100) NOT NULL,
   AirportCode varchar(15) NOT NULL,
   OpenOrClose TINYINT DEFAULT 0 NOT NULL,
   CONSTRAINT fk_14
       FOREIGN KEY (AirportCode) REFERENCES Airport (Code)
       ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PassengerTravelAgent(
  PassengerId int,
  TravelAgentId int,
  PRIMARY KEY (PassengerId, TravelAgentId),
  CONSTRAINT fk_10
      FOREIGN KEY (PassengerId) REFERENCES Passenger (Id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_11
      FOREIGN KEY (TravelAgentId) REFERENCES TravelAgent (Id)
      ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO TravelAgent (Id, FirstName, LastName, Company, Email)
VALUES
(1, 'Alice', 'Johnson', 'Boston Travel Inc.', 'alice.johnson@bostontravel.com'),
(2, 'David', 'Williams', 'Heathrow Travel Co.', 'david.williams@heathrowtravel.com'),
(3, 'Sophia', 'Miller', 'Luton Getaways', 'sophia.miller@lutongetaways.com');

INSERT INTO Airline (Name, Id)
VALUES
('Spirit', 1),
('RyanAir', 2),
('United', 3);

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
(2, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 1, 1, 1, 1, 1, 1, 0),
(5, 0, 0, 0, 1, 0, 0, 1, 0);

INSERT INTO Flight (FlightNumber, ArrivalTime, DepartureTime, DepartureDate, Terminal, Gate, Occupancy, Price, FlightTime, AirlineManagerId, ArrivalAirportCode, DepartureAirportCode, Status, AirlineId)
VALUES
(1, '14:30:00', '11:00:00', '2025-03-30', 'A', 'A1', 150, 300, 180, 1, 'BOS', 'LHR', 1, 1),
(2, '16:45:00', '13:30:00', '2025-03-30', 'B', 'B3', 180, 350, 210, 2, 'LHR', 'LTN', 2, 2),
(3, '09:00:00', '06:30:00', '2025-03-30', 'C', 'C5', 120, 250, 120, 3, 'LTN', 'BOS', 5, 1),
(4, '11:00:00', '09:00:00', '2025-04-20', 'E', 'E7', 100, 250, 120, 3, 'LHR', 'BOS', 3, 1),
(5, '10:00:00', '07:00:00', '2025-04-20', 'F', 'F7', 120, 250, 120, 3, 'BOS', 'LHR', 4, 3),
(6, '03:00:00', '00:00:00', '2025-04-20', 'G', 'G7', 180, 250, 120, 3, 'BOS', 'LTN', 4, 1),
(7, '12:00:00', '09:00:00', '2025-04-20', 'H', 'H7', 200, 250, 120, 3, 'BOS', 'BOS', 4, 2),
(8, '07:00:00', '04:00:00', '2025-04-25', 'I', 'I7', 150, 250, 120, 3, 'LHR', 'BOS', 4, 1),
(9, '21:00:00', '18:00:00', '2025-04-25', 'J', 'J7', 120, 450, 120, 3, 'LTN', 'BOS', 4, 3);

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
(1, 'Economy', 1, 3),
(1, 'Business', 1, 4);

INSERT INTO Passenger (FirstName, LastName, DOB, Email, Id)
VALUES
('John', 'Doe', '1985-06-15', 'john.doe@example.com', 1),
('Jane', 'Smith', '1990-02-20', 'jane.smith@example.com', 2),
('Emily', 'Johnson', '1992-11-11', 'emily.johnson@example.com', 3);

INSERT INTO Booked (BoardingPass, Amenities, Luggage, FlightNumber, PassengerId)
VALUES
('https://example.com/boarding-pass/101-JD', 1, 2, 1, 1),
('https://example.com/boarding-pass/102-JS', 0, 1, 2, 2),
('https://example.com/boarding-pass/103-EJ', 1, 3, 3, 3),
('https://example.com/boarding-pass/104-XD', 0, 2, 3, 1),
('https://example.com/boarding-pass/105-TS', 1, 1, 3, 2);

INSERT INTO Business (Id, Name, Type, AirportCode, OpenOrClose)
VALUES
(1, 'LoganEats', 'Dining', 'BOS', 1),
(2, 'HeathrowShops', 'GiftShop', 'LHR', 0),
(3, 'LutonMedicates', 'Pharmacy', 'LTN', 1);

INSERT INTO PassengerTravelAgent (PassengerId, TravelAgentId)
VALUES
(1, 1),
(2, 1),
(3, 3);