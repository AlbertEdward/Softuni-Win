--01. Employee Address
SELECT TOP(5) Employees.EmployeeID, JobTitle,Employees.AddressID, Addresses.AddressText
FROM Employees
JOIN Addresses ON Employees.AddressID = Addresses.AddressID
ORDER BY Employees.AddressID

--02. Addresses with Towns
SELECT TOP(50) Employees.FirstName, Employees.LastName, Towns.Name AS Town, Addresses.AddressText
FROM Employees
JOIN Addresses ON Employees.AddressID = Addresses.AddressID
JOIN Towns ON Addresses.TownID = Towns.TownID
ORDER BY Employees.FirstName, Employees.LastName;

--03. Sales Employee
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.Name AS DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.JobTitle LIKE '%Sales%'
ORDER BY Employees.EmployeeID

--04. Employee Departments
SELECT TOP(5) Employees.EmployeeID, Employees.FirstName, Employees.Salary, Departments.Name AS DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary > 15000
ORDER BY Departments.DepartmentID

--05. Employees Without Project
SELECT TOP(3) Employees.EmployeeID, Employees.FirstName
FROM Employees
LEFT JOIN EmployeesProjects ON Employees.EmployeeID = EmployeesProjects.EmployeeID
LEFT JOIN  Projects ON EmployeesProjects.EmployeeID = Projects.ProjectID
WHERE EmployeesProjects.ProjectID IS NULL
ORDER BY Employees.EmployeeID

--06. Employees Hired After
SELECT Employees.FirstName, Employees.LastName, Employees.HireDate, Departments.Name AS DeptName
FROM Employees
JOIN Departments ON Departments.DepartmentID = Employees.DepartmentID
WHERE HireDate > 1999-01-01 AND (Departments.Name = 'Sales' OR Departments.Name = 'Finance')
ORDER BY HireDate

--07. Employees with Project
SELECT TOP(5) Employees.EmployeeID, Employees.FirstName, Projects.Name AS ProjectName
FROM Employees
JOIN EmployeesProjects ON Employees.EmployeeID = EmployeesProjects.EmployeeID
JOIN Projects ON Projects.ProjectID = EmployeesProjects.ProjectID
WHERE Projects.StartDate > 2002-08-13 AND Projects.EndDate IS NULL
ORDER BY EmployeeID

--08. Employee 24
SELECT Employees.EmployeeID, Employees.FirstName, Projects.Name AS ProjectName
FROM Employees
JOIN EmployeesProjects ON Employees.EmployeeID = EmployeesProjects.EmployeeID
LEFT JOIN Projects ON Projects.ProjectID = EmployeesProjects.ProjectID AND StartDate < '2005-01-01'
WHERE EmployeesProjects.EmployeeID = 24

--09. Employee Manager
SELECT e1.EmployeeID, e1.FirstName, e1.ManagerID,
e2.FirstName AS MenagerName
FROM Employees AS e1
LEFT JOIN Employees AS e2 ON e1.ManagerID = e2.EmployeeID
WHERE e1.ManagerID = 3 OR e1.ManagerID = 7
ORDER BY e1.EmployeeID

--10. Employees Summary
SELECT TOP(50) e1.EmployeeID,
CONCAT(e1.FirstName,' ',e1.LastName) AS EmployeeName,
CONCAT(e2.FirstName,' ',e2.LastName) AS MenagerName,
d.[Name] AS [DepartmentName]
FROM Employees AS e1
LEFT JOIN Employees AS e2 ON e1.ManagerID=e2.EmployeeID
JOIN Departments AS d ON d.DepartmentID=e1.DepartmentID
ORDER BY e1.EmployeeID

-- 11. Min Average Salary
SELECT TOP(1) AVG(Salary) AS MinAverageSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY MinAverageSalary

--12. Highest Peaks in Bulgaria
SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
FROM Peaks AS p
LEFT JOIN Mountains AS m 
ON p.MountainId = m.Id
LEFT JOIN MountainsCountries AS mc
ON mc.MountainId = m.Id
LEFT JOIN Countries AS c
ON c.CountryCode = mc.CountryCode
WHERE p.Elevation > 2835 AND c.CountryCode = 'BG'
ORDER BY Elevation DESC

--13. Count Mountain Ranges
SELECT c.CountryCode, COUNT(c.CountryCode) AS MountainRange
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
WHERE c.CountryCode IN ('BG', 'RU', 'US')
GROUP BY c.CountryCode

--14. Countries With or Without Rivers
SELECT c.CountryName, r.RiverName
FROM Rivers AS r
RIGHT JOIN CountriesRivers AS cr
ON r.Id = cr.RiverId
LEFT JOIN Countries AS c
ON cr.CountryCode = c.CountryCode
ORDER BY c.CountryName

--15. Countries Without any Mountains
SELECT COUNT(c.CountryCode) AS Count
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
WHERE mc.MountainId IS NULL


--16. Countries Without any Mountains
SELECT TOP(5) c.CountryName, MAX(p.Elevation) AS HighestPeakElevation, MAX(r.Length) AS LongestRiverLength
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
LEFT JOIN Peaks AS p ON p.MountainId = mc.MountainId
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName

--17.Highest Peak Name and Elevation by Country
SELECT TOP(5) Country,
CASE WHEN PeakName IS NULL THEN('(no highest peak)') ELSE PeakName END AS 'Highest Peak Name'
,CASE WHEN Elevation IS NULL THEN 0 ELSE Elevation END AS 'Highest Peak Elevation'
,CASE WHEN MountainRange IS NULL THEN('(no mountain)') ELSE MountainRange END AS 'Mountain'
	FROM (SELECT *,DENSE_RANK() OVER(PARTITION BY [Country] ORDER BY [Elevation] DESC) AS [PeakRank]
		FROM (SELECT CountryName AS [Country],p.PeakName,p.Elevation,m.MountainRange FROM
			Countries AS c
				LEFT JOIN MountainsCountries AS mc ON C.CountryCode=mc.CountryCode
				LEFT JOIN Mountains AS m ON m.Id=mc.MountainId
				LEFT JOIN Peaks AS p ON p.MountainId=m.Id
		     ) AS [Ful]
	    ) AS[FULL]
WHERE PeakRank=1