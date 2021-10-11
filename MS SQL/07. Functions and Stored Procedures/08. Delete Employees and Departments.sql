CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId int)
AS
BEGIN
	DELETE FROM Employees
	WHERE DepartmentID = @departmentId

	
END

ALTER TABLE Employees ALTER COLUMN ManagerId int NULL