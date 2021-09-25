CREATE DATABASE Hotel

CREATE TABLE Employees(
id int primary key identity,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Title varchar(50),
Notes Varchar(MAX)
)

CREATE TABLE Customers(
AccountNumber varchar(50) not null,
FirstName varchar(50) not null,
LastName varchar(50) not null,
PhoneNumber varchar(50),
EmergencyName varchar(50),
EmergencyNumber varchar(50),
Notes Varchar(MAX)
)

CREATE TABLE RoomStatus(
RoomStatus varchar(50) not null,
Notes varchar(max),
)

CREATE TABLE RoomTypes(
RoomType varchar(50) not null,
Notes varchar(max)
)

CREATE TABLE BedTypes(
BedType varchar(50) not null,
Notes varchar(max)
)

CREATE TABLE Rooms(
RoomNumber varchar(50) not null,
RoomType varchar(50) not null,
BedType varchar(50) not null,
Rate int,
RoomStatus varchar(50),
Notes varchar(max)
)

CREATE TABLE Payments(
id int primary key identity,
EmployeeId int not null,
PaymentDate datetime,
AccountNumber varchar(50),
FirstDateOccupied datetime,
LastDateOccupied datetime,
TotalDays int not null,
AmountCharged decimal,
TaxRate decimal,
TaxAmount decimal,
PaymentTotal decimal not null,
Notes varchar(max)
)

CREATE TABLE Occupancies(
id int primary key identity,
EmployeeId int not null,
DateOccupied datetime,
AccountNumber varchar(50),
RoomNumber varchar(50),
RateApplied float,
PhoneCharge decimal,
Notes varchar(max)
)

INSERT INTO Employees(FirstName, LastName)
VALUES
('Albert', 'Albert'),
('Albert', 'Albert'),
('Albert', 'Albert')

INSERT INTO Customers(AccountNumber, FirstName,LastName)
values
('asdasdasd123123','aslber' , 'asdsaas'),
('asdasdasd123123','aslber' , 'asdsaas'),
('asdasdasd123123','aslber' , 'asdsaas')

INSERT INTO RoomStatus(RoomStatus)
Values
('free'),
('free'),
('free')

INSERT INTO RoomTypes(RoomType)
VALUES
('big'),
('big'),
('big')

INSERT INTO BedTypes(BedType)
VALUES
('double'),
('double'),
('double')

INSERT INTO Rooms(RoomNumber,RoomType,BedType, RoomStatus)
VALUES
('12313213', 'wqewqeqwe','wqewqeqwe', 'wq3213123'),
('12313213', 'wqewqeqwe','wqewqeqwe', 'wq3213123'),
('12313213', 'wqewqeqwe','wqewqeqwe', 'wq3213123')

INSERT INTO Payments(EmployeeId,TotalDays, PaymentTotal)
VALUES
(1,10,100.5),
(1,10,100.5),
(1,10,100.5)

INSERT INTO Occupancies(EmployeeId)
VALUES
(1),
(1),
(1)