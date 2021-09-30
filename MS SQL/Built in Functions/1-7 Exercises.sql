SELECT FirstName,HireDate
FROM Employees
WHERE (DepartmentID = 3 OR DepartmentID = 10) AND (HireDate >= '1995-01-01 00:00:00' AND HireDate <= '2005-12-31 00:00:00')

SELECT FirstName, LastName
FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'

SELECT Name
FROM Towns
WHERE LEN(Name) = 5 OR LEN(Name) = 6
ORDER BY Name

SELECT TownID, Name
FROM Towns
WHERE Name Like 'M%' or Name Like 'K%' or Name Like 'B%' or Name Like 'E%'
ORDER BY Name

SELECT TownID, Name
FROM Towns
WHERE Name NOT Like 'R%' and Name NOT Like 'B%' and Name NOT Like 'D%'
ORDER BY Name


