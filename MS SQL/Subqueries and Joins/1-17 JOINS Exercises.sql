SELECT TOP(5) Employees.EmployeeID, JobTitle,Employees.AddressID, Addresses.AddressText
FROM Employees
JOIN Addresses ON Employees.AddressID = Addresses.AddressID
ORDER BY Employees.AddressID


SELECT TOP(50) FirstName, LastName, Towns.Name AS Town, 
FROM Employees
Join Towns ON Employees.EmployeeID = Towns.TownID
ORDER BY FirstName