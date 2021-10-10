CREATE TABLE Manufacturers
(
ManufacturerID INT NOT NULL PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL,
EstablishedOn DATE NOT NULL,
)
CREATE TABLE Models
(
ModelID INT NOT NULL PRIMARY KEY,
[Name] NVARCHAR(20) NOT NULL,
ManufacturerID INT NOT NULL FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)
INSERT INTO Manufacturers([Name],EstablishedOn)
	VALUES
	('BMW','03/07/1916'),
	('Tesla','01/01/2003'),
	('Lada','05/01/1966')
INSERT INTO Models(ModelID,[Name],ManufacturerID)
	VALUES
	(101,'X1',1),
	(102,'i6',1),
	(103,'Model S',2),
	(104,'Model X',2),
	(105,'Model 3',2),
	(106,'Nova',3)

	SELECT * FROM Models
	SELECT * FROM Manufacturers

SELECT * FROM Models
JOIN Manufacturers 
ON Manufacturers.ManufacturerID = Models.ManufacturerID