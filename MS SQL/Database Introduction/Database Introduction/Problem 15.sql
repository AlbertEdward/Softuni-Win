CREATE DATABASE Hotel

CREATE TABLE Employees
(
	id INT PRIMARY KEY IDENTITY,
	FirstName varchar(MAX),
	LastName varchar(MAX),
	Title varchar(MAX),
	Notes varchar(MAX),
)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES ('Ivan', 'Siderov', 'Kaval', 'Golqm e kaval');

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES ('Ivan', 'Ivanov', 'Provadiq', 'Golqm e Provadiq');

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES ('Albert', 'Khurshudyan', 'Armenec', 'Golqm e armenec');

CREATE TABLE Customers
(
	AccountNumber INT PRIMARY KEY IDENTITY,
	FirstName varchar(MAX),
	LastName varchar(MAX),
	PhoneNumber BIGINT,
	EmergencyName varchar(MAX),
	EmergencyNumber BIGINT,
	Notes varchar(MAX),
)

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES ('Ivan', 'Siderov', 0878888888, 'Bolnica', 807498347398, 'zarazeni');

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES ('Abert', 'asds', 0878888888, 'Bolnica', 807498347398, 'zarazeni');

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES ('Ivan', 'sad', 0878888888, 'Bolnica', 807498347398, 'zarazeni');

CREATE TABLE RoomStatus
(
	RoomStatus BIT,
	Notes varchar(MAX)
)

INSERT INTO RoomStatus (RoomStatus,Notes)
Values (1, 'Free')

INSERT INTO RoomStatus (RoomStatus,Notes)
Values (0, 'Busy')

INSERT INTO RoomStatus (RoomStatus,Notes)
Values (1, 'Free')

CREATE TABLE RoomTypes
(
	RoomType varchar(MAX),
	Notes varchar(MAX)
)

INSERT INTO RoomTypes(RoomType,Notes)
Values ('Dvustaen', 'Mnogo skup')

INSERT INTO RoomTypes(RoomType,Notes)
Values ('Ednostaen', 'Mnogo evtin')

INSERT INTO RoomTypes(RoomType,Notes)
Values ('Apartament', 'Mnogo LUX')

CREATE TABLE BedTypes
(
	BedTypes varchar(MAX),
	Notes varchar(MAX)
)

INSERT INTO BedTypes(BedTypes,Notes)
Values ('dvoino', 'Mnogo LUX')

INSERT INTO RoomTypes(RoomType,Notes)
Values ('troino', 'Mnogo LUX')

INSERT INTO RoomTypes(RoomType,Notes)
Values ('chetvorno', 'Mnogo LUX')

CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY,
	RoomType varchar(MAX),
	BedType varchar(MAX),
	Rate BIGINT,
	RoomStatus bit,
	Notes varchar(MAX)
)

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
Values (12312, 'gaden', 'mnogo gaden', 1, 1, 'Mnogo LUX')

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
Values (213125, 'gaden', 'mnogo lux', 10, 1, 'Mnogo LUX')

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
Values (332123, 'gaden', 'mnogo sreden', 6, 1, 'Mnogo LUX')

CREATE TABLE Payments
(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT,
	PaymentDate DATETIME, 
	AccountNumber BIGINT,
	FirstDateOccupied DATETIME,
	LastDateOccupied DATETIME,
	TotalDays BIGINT,
	AmountCharged decimal,
	TaxRate decimal,
	TaxAmount decimal,
	PaymentTotal decimal,
	Notes varchar(max)
)

INSERT INTO Payments(PaymentDate, AccountNumber, FirstDateOccupied,
LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
Values (1/1/2020, 12312312, 2/2/2020, 3/3/2020, 5, 10, 3, 13, 30, 'Mnogo LUX')

INSERT INTO Payments(PaymentDate, AccountNumber, FirstDateOccupied,
LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
Values (1/1/2020, 12312312, 2/2/2020, 3/3/2020, 5, 10, 3, 13, 30, 'Mnogo LUX')

INSERT INTO Payments(PaymentDate, AccountNumber, FirstDateOccupied,
LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
Values (1/1/2020, 12312312, 2/2/2020, 3/3/2020, 5, 10, 3, 13, 30, 'Mnogo LUX')

CREATE TABLE Occupacies
(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT,
	DateOccupied datetime,
	AccountNumber BIGINT,
	RoomNumber BIGINT,
	RateApplied BIGINT,
	PhoneCharge decimal,
	Notes varchar(MAX)
)
INSERT INTO Occupacies
(DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
Values
(1/1/2020, 12312312, 205, 10, 15, 'Mnogo LUX')

INSERT INTO Occupacies
(DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
Values
(1/1/2020, 12312312, 205, 10, 15, 'Mnogo LUX')

INSERT INTO Occupacies
(DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
Values
(1/1/2020, 12312312, 205, 10, 15, 'Mnogo LUX')