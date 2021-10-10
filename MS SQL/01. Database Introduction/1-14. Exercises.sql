CREATE DATABASE Minions

CREATE TABLE Minions(
Id int PRIMARY KEY IDENTITY not NULL,
Name varchar not NULL,
Age int null,
)

CREATE TABLE Towns(
Id int Primary Key not NULL IDENTITY,
Name varchar not NULL,
)

ALTER TABLE Minions
ADD TownId int not null
FOREIGN KEY (TownId) REFERENCES Towns(Id)

INSERT INTO Towns (Id,Name)
VALUES (1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna')

INSERT INTO Minions (Id,Name, Age, TownId)
VALUES (1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3,'Steward', NULL, 2)

DROP DATABASE Minions

CREATE DATABASE Minions

CREATE TABLE People(
Id int PRIMARY KEY IDENTITY,
Name varchar(300) not null,
Picture varbinary(2048),
Height float,
Weight float,
Gender varchar(1) not null,
Birthdate DATETIME not null,
Biography varchar(MAX)
)


INSERT INTO People(Name, Height,Weight, Gender, Birthdate, Biography)
VALUES 
('Albert', 10.95, 8.84, m , 12-12-12, 'idiot'),
('Albert', 10.95, 8.84, m , 12-12-12, 'idiot'),
('Albert', 10.95, 8.84, m , 12-12-12, 'idiot'),
('Albert', 10.95, 8.84, m , 12-12-12, 'idiot'),
('Albert', 10.95, 8.84, m , 12-12-12, 'idiot'),


CREATE TABLE Users(
id int primary key IDENTITY,
Username varchar(30) not null,
Password varchar(30) not null,
ProfilePicture varbinary(900),
LastLoginTime datetime,
IsDeleted bit,
)

INSERT INTO Users(Username, Password,LastLoginTime, IsDeleted)
VALUES 
('Albert', 'A123', 12-12-12, 0),
('ivan', 'sad', 12-12-20, 1),
('kaloqn', 'ffffsa', 12-12-12, 0),
('stoqn', 'ssss', 12-12-12, 1),
('stefan', 'sadsad', 12-12-12, 0)

SELECT *
FROM Users

CREATE DATABASE Movies

CREATE TABLE Directors(
id int primary key IDENTITY,
DirectorName varchar(30) not null,
Notes varchar(MAX)
)

CREATE TABLE Genres(
id int primary key IDENTITY,
GenreName varchar(30) not null,
Notes varchar(MAX)
)

CREATE TABLE Categories(
id int primary key IDENTITY,
CategoryName varchar(30) not null,
Notes varchar(MAX)
)


CREATE TABLE Movies(
id int primary key IDENTITY,
Title varchar(50) not null,
DirectorId int not null,
CopyrightYear datetime,
Length float,
GenreId int not null,
CategoryId int not null,
Rating int,
Notes varchar(max)
)


INSERT INTO Directors(DirectorName,Notes)
VALUES
('Albert', 'Good Man'),
('Stefan', Null),
('asdasd', 'Good Man'),
('best', 'Good Man'),
('Alaaabert', 'Good Man')

INSERT INTO Genres(GenreName,Notes)
VALUES
('Opera', 'Good Man'),
('Rap', Null),
('Classic', 'Good Man'),
('Folk', 'Good Man'),
('Rock', 'Good Man')

INSERT INTO Categories(CategoryName,Notes)
VALUES
('music', 'Good Man'),
('music', Null),
('asdasd', 'Good Man'),
('best', 'Good Man'),
('Alaaabert', 'Good Man')

INSERT INTO Movies(Title,DirectorId,CopyrightYear,Length,GenreId,CategoryId,Rating,Notes)
VALUES
('Titanic', 1,12-12-12,19,3,2,10,'lalala'),
('Britanic', 1,12-12-12,19,3,2,10,'lalala'),
('Avatar', 1,12-12-12,19,3,2,10,'lalala'),
('Godfather', 1,12-12-12,19,3,2,10,'lalala'),
('Scarface', 1,12-12-12,19,3,2,10,'lalala')


CREATE DATABASE CarRental

CREATE TABLE Categories(
id int primary key identity,
CategoryName varchar(50),
DailyRate int,
WeeklyRate int,
MonthlyRate int,
WeekendRate int,
)

CREATE TABLE Cars(
id int primary key identity,
PlateNumber varchar(20) not null,
Manufacturer varchar(30) not null,
Model varchar(30),
CarYear int,
CategoryId int not null,
Doors int,
Picture varbinary(MAX),
Condition varchar(30),
Available varchar(10) not null,
)

CREATE TABLE Employees(
id int primary key identity,
FirstName varchar(30) not null,
LastName varchar(30) not null,
Title varchar(30),
Notes varchar(MAX)
)

CREATE TABLE Customers(
id int primary key identity,
DriverLicenceNumber varchar(50) not null,
FullName varchar (100) not null,
Address varchar (50),
City varchar(30),
ZIPCode int,
Notes varchar(MAX)
)

CREATE TABLE RentalOrders(
id int primary key identity,
EmployeeId int not null,
CustomerId int not null,
CarId int not null,
TankLevel int,
KilometrageStart int,
KilometrageEnd int,
TotalKilometrage int,
StartDate datetime,
EndDate datetime,
TotalDays int,
RateApplied int,
TaxRate float, 
OrderStatus varchar(10) not null,
Notes varchar(max)
)

INSERT INTO Categories(CategoryName)
VALUES
('gogo'),('lolo'),('shosho')

INSERT INTO Cars(PlateNumber, Manufacturer, CategoryId, Available)
VALUES
('123231312asd' , 'BMW', 1 , 'YES'),
('123231312asd' , 'BMW', 1 , 'YES'),
('123231312asd' , 'BMW', 1 , 'YES')

INSERT INTO Employees(FirstName, LastName)
VALUES 
('Albert', 'Khurshudyan'),
('Albert', 'Khurshudyan'),
('Albert', 'Khurshudyan')

INSERT INTO Customers(DriverLicenceNumber, FullName)
VALUES 
('sadsadsadsad12312312321', '12312edwqd'),
('sadsadsadsad12312312321', '12312edwqd'),
('sadsadsadsad12312312321', '12312edwqd')

INSERT INTO RentalOrders(EmployeeId,CustomerId,CarId,OrderStatus)
VALUES
(1,2,3,'YES'),
(1,2,3,'YES'),
(1,2,3,'YES')

