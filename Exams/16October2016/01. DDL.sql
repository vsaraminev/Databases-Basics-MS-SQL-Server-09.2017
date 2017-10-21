CREATE TABLE Flights
(
FlightID INT PRIMARY KEY,
DepartureTime DATETIME NOT NULL,
ArrivalTime DATETIME NOT NULL,
Status VARCHAR(9) 
CHECK(Status IN ('Departing', 'Delayed', 'Arrived', 'Cancelled')) NOT NULL,
OriginAirportID INT FOREIGN KEY REFERENCES Airports(AirportID) NOT NULL,
DestinationAirportID INT FOREIGN KEY REFERENCES Airports(AirportID) NOT NULL,
AirlineID INT FOREIGN KEY REFERENCES Airlines(AirlineID) NOT NULL
)

CREATE TABLE Tickets
(
TicketID INT PRIMARY KEY,
Price DECIMAL(8, 2) NOT NULL,
Class VARCHAR(6) CHECK(Class IN ('First', 'Second', 'Third')) NOT NULL,
Seat VARCHAR(5) NOT NULL,
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID) NOT NULL,
FlightID INT FOREIGN KEY REFERENCES Flights(FlightID) NOT NULL
)