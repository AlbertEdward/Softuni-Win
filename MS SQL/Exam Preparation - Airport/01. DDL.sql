--01. DDL
CREATE TABLE Planes (
Id int PRIMARY KEY IDENTITY,
[Name] varchar(30) NOT NULL,
Seats int NOT NULL,
[Range] int NOT NULL)

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
[Address] varchar(30) NOT NULL,
PassportId char(11) NOT NULL)


CREATE TABLE LuggageTypes (
Id int PRIMARY KEY IDENTITY,
[Type] varchar(30) NOT NULL)

CREATE TABLE Luggages (
Id int PRIMARY KEY IDENTITY,
LuggageTypeId int FOREIGN KEY REFERENCES LuggageTypes(Id) NOT NULL,
PassengerId int FOREIGN KEY REFERENCES Passengers(Id) NOT NULL)

CREATE TABLE Tickets (
Id int PRIMARY KEY IDENTITY,
PassengerId int FOREIGN KEY REFERENCES Passengers(Id) NOT NULL,
FlightId int FOREIGN KEY REFERENCES Flights(Id) NOT NULL,
LuggageId int FOREIGN KEY REFERENCES Luggages(Id) NOT NULL,
Price decimal(10,2) NOT NULL
)

--02. Insert
INSERT INTO Planes (Name, Seats, Range)
VALUES 
('Airbus 336', 112, 5132),
('Airbus 330' , 432, 5325),
('Boeing 369', 231, 2355),
('Stelt 297', 254, 2143),
('Boeing 338', 165, 5111),
('Airbus 558', 387, 1342),
('Boeing 128', 345, 5541)

INSERT INTO LuggageTypes(Type)
VALUES ('Crossbody Bag'), ('School Backpack'), ('Shoulder Bag')

--03. Update
UPDATE Tickets
SET Price = Price * 1.13
WHERE FlightId IN (SELECT Id FROM Flights WHERE Destination = 'Carlsbad')

--04. Delete
DELETE FROM Tickets
WHERE FlightId IN (SELECT Id FROM Flights WHERE Destination = 'Ayn Halagim')
DELETE FROM Flights
WHERE Destination = 'Ayn Halagim'

--05. The "Tr" Planes
SELECT Id, Name, Seats, Range
FROM Planes
WHERE Name LIKE '%tr%'

--06. Flight Profits
SELECT FlightId, SUM(Price) AS Price
FROM Tickets
GROUP BY FlightId
ORDER BY Price DESC, FlightId 

--07. Passenger Trips
SELECT (FirstName + ' ' + LastName) AS [Full Name], f.Origin, f.Destination
FROM Passengers AS p
JOIN Tickets AS t ON p.Id = t.PassengerId
JOIN Flights AS f ON f.Id = t.FlightId
ORDER BY [Full Name], Origin, Destination 

--08. Non Adventures People
SELECT p.FirstName, p.LastName, p.Age
FROM Passengers AS p
LEFT JOIN Tickets AS t ON t.PassengerId = p.Id
LEFT JOIN Flights AS f ON f.Id = t.FlightId
WHERE t.FlightId IS NULL
ORDER BY Age DESC, FirstName, LastName

--09. Full Info
SELECT [Full Name], [Plane Name], Trip, [Luggage Type]
FROM (
	SELECT
		CONCAT(p.FirstName,' ',p.LastName) AS [Full Name],
		pl.Name AS [Plane Name],
		CONCAT(f.Origin,' - ',f.Destination) AS Trip,
		lt.Type AS [Luggage Type]
	FROM
		Passengers AS p
		JOIN Tickets AS t ON t.PassengerId = p.Id
		JOIN Flights AS f ON f.Id = t.FlightId
		JOIN Planes AS pl ON pl.Id = f.PlaneId
		JOIN Luggages AS l ON l.Id = t.LuggageId
		JOIN LuggageTypes AS lt ON lt.Id = l.LuggageTypeId
		GROUP BY
				CONCAT(p.FirstName, ' ', p.LastName),
				pl.Name,
				CONCAT(f.Origin, ' - ', f.Destination),
				lt.Type
	) as baaa
ORDER BY [Full Name], [Plane Name], Trip, [Luggage Type]


SELECT
	[Full Name],[Plane Name],Trip,[Luggage Type]
FROM(
	SELECT
		CONCAT(p.FirstName,' ',p.LastName)  AS [Full Name],
		pl.[Name] AS [Plane Name],
		CONCAT(f.Origin,' - ',f.Destination) AS [Trip],
		lt.[Type] AS [Luggage Type]
	FROM
		Passengers AS p
	JOIN Tickets AS t ON t.PassengerId=p.Id
	JOIN Flights AS f ON f.Id=t.FlightId
	JOIN Planes AS pl ON pl.Id=f.PlaneId
	JOIN Luggages AS l ON l.Id=t.LuggageId
	JOIN LuggageTypes AS lt ON lt.Id=l.LuggageTypeId
	GROUP BY
		CONCAT(p.FirstName,' ',p.LastName), pl.[Name], CONCAT(f.Origin,' - ',f.Destination),
	lt.[Type] ) AS [da]
ORDER BY [Full Name],[Plane Name],Trip,[Luggage Type]
