SELECT TOP(5) Employees.EmployeeID, JobTitle,Employees.AddressID, Addresses.AddressText
FROM Employees
JOIN Addresses ON Employees.AddressID = Addresses.AddressID
ORDER BY Employees.AddressID

SELECT TOP(50) Employees.FirstName, Employees.LastName, Towns.Name AS Town, Addresses.AddressText
FROM Employees
JOIN Addresses ON Employees.AddressID = Addresses.AddressID
JOIN Towns ON Addresses.TownID = Towns.TownID
ORDER BY Employees.FirstName, Employees.LastName;

SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.Name AS DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.JobTitle LIKE '%Sales%'
ORDER BY Employees.EmployeeID

SELECT TOP(5) Employees.EmployeeID, Employees.FirstName, Employees.Salary, Departments.Name AS DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary > 15000
ORDER BY Departments.DepartmentID

SELECT TOP(3) Employees.EmployeeID, Employees.FirstName
FROM Employees
LEFT JOIN EmployeesProjects ON Employees.EmployeeID = EmployeesProjects.EmployeeID
LEFT JOIN  Projects ON EmployeesProjects.EmployeeID = Projects.ProjectID
WHERE EmployeesProjects.ProjectID IS NULL
ORDER BY Employees.EmployeeID
