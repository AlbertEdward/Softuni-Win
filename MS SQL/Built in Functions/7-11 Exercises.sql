SELECT FirstName,LastName
FROM Employees
WHERE LEN(LastName) = 5


SELECT EmployeeID, FirstName, LastName, Salary, 
DENSE_RANK() OVER(PARTITION BY EmployeeID ORDER BY Salary) Rank
FROM Employees
WHERE Salary >= 10000 AND Salary <= 50000
ORDER BY Salary Desc


SELECT *
FROM (SELECT EmployeeID, FirstName, LastName, Salary
,RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) as Rank FROM Employees) a
WHERE a.Rank = 2 AND Salary >= 10000 AND Salary <= 50000
ORDER BY Salary Desc





