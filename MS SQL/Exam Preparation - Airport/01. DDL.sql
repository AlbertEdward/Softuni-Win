CREATE TABLE Planes (
Id int PRIMARY KEY IDENTITY,
Name varchar(30) NOT NULL,
Seats int NOT NULL,
Range int NOT NULL)

CREATE TABLE Flights (
Id int PRIMARY KEY IDENTITY,
DepartureTime Datetime,
ArrivalTime Datetime,
Origin varchar(50) NOT NULL,
Destination varchar(50) NOT NULL,
PlaneId int FOREIGN KEY REFERENCES Planes(Id) NOT NULL
)

CREATE TABLE Passengers (
Id int PRIMARY KEY IDENTITY,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
Age int NOT NULL,
Address varchar(30) NOT NULL,
PassportId varchar(11) NOT NULL)


CREATE TABLE LuggageTypes (
Id int PRIMARY KEY IDENTITY,
Type varchar(30) NOT NULL)

CREATE TABLE Luggage (
Id int PRIMARY KEY IDENTITY,
LuggageTypeId int FOREIGN KEY REFERENCES LuggageTypes(Id) NOT NULL,
PassengerId int FOREIGN KEY REFERENCES Passengers(Id) NOT NULL)

CREATE TABLE Tickets (
Id int PRIMARY KEY IDENTITY,
PassengerId int FOREIGN KEY REFERENCES Passengers(Id) NOT NULL,
FlightId int FOREIGN KEY REFERENCES Flights(Id) NOT NULL,
LuggageId int FOREIGN KEY REFERENCES Luggage(Id) NOT NULL,
Price decimal NOT NULL
)