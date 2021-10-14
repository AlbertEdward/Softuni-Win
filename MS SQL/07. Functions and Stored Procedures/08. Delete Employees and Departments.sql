SELECT EmployeeID
FROM Employees
WHERE DepartmentID = 4

CREATE PROC usp_DeleteEmployeesFromDepartment @departmentId int
AS
BEGIN
	DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (
						SELECT EmployeeID
						FROM Employees
						WHERE DepartmentID = @departmentId
						)

	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN (
						SELECT EmployeeID
						FROM Employees
						WHERE DepartmentID = @departmentId
						)
	
	DELETE FROM Employees
	WHERE 
	IN (
						SELECT EmployeeID
						FROM Employees
						WHERE DepartmentID = @departmentId
						)
					

END
