CREATE VIEW V_EmployeeNameJobTitle AS
SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS [Full Employee Name], JobTitle 
FROM Employees

SELECT DISTINCT JobTitle 
FROM Employees

SELECT JobTitle
FROM Employees	

SELECT TOP(10) *
FROM Projects
ORDER BY StartDate, [Name]

SELECT TOP(7) FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate DESC

SELECT Salary
FROM Employees
Where JobTitle like'%Engineering%'
and JobTitle like '%Tool%' 


