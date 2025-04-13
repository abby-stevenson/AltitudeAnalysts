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
