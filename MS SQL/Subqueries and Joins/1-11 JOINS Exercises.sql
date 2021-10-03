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

SELECT Employees.FirstName, Employees.LastName, Employees.HireDate, Departments.Name AS DeptName
FROM Employees
JOIN Departments ON Departments.DepartmentID = Employees.DepartmentID
WHERE HireDate > 1999-01-01 AND (Departments.Name = 'Sales' OR Departments.Name = 'Finance')
ORDER BY HireDate

SELECT TOP(5) Employees.EmployeeID, Employees.FirstName, Projects.Name AS ProjectName
FROM Employees
JOIN EmployeesProjects ON Employees.EmployeeID = EmployeesProjects.EmployeeID
JOIN Projects ON Projects.ProjectID = EmployeesProjects.ProjectID
WHERE Projects.StartDate > 2002-08-13 AND Projects.EndDate IS NULL
ORDER BY EmployeeID

SELECT Employees.EmployeeID, Employees.FirstName, Projects.Name AS ProjectName
FROM Employees
JOIN EmployeesProjects ON Employees.EmployeeID = EmployeesProjects.EmployeeID
LEFT JOIN Projects ON Projects.ProjectID = EmployeesProjects.ProjectID AND StartDate < '2005-01-01'
WHERE EmployeesProjects.EmployeeID = 24


SELECT TOP(1) AVG(Employees.Salary) AS MinAverageSalary
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.Name
ORDER BY MinAverageSalary