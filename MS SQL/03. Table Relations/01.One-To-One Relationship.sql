CREATE DATABASE Person

CREATE TABLE Passports
(
PassportID INT PRIMARY KEY,
PassportNumber NVARCHAR(8) NOT NULL
)
CREATE TABLE Persons
(
 PersonID INT PRIMARY KEY IDENTITY,
 FirstName NVARCHAR(20) NOT NULL,
 Salary DECIMAL(7,2),
 PassportID INT NOT NULL FOREIGN KEY REFERENCES Passports(PassportID) UNIQUE
)
 INSERT INTO Passports(PassportID,PassportNumber)
 VALUES(101,'N34FG21B')
 INSERT INTO Passports(PassportID,PassportNumber)
 VALUES(102,'K65LO4R7')
 INSERT INTO Passports(PassportID,PassportNumber)
 VALUES(103,'ZE657QP2')

INSERT INTO Persons
 (FirstName,Salary,PassportID)
 VALUES('Roberto',43300.00,102)
INSERT INTO Persons
 (FirstName,Salary,PassportID)
 VALUES('Tom',56100.00,103)
INSERT INTO Persons
 (FirstName,Salary,PassportID)
 VALUES('Yana',60200.00,101)