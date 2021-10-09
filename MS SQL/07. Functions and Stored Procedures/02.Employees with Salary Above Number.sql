CREATE PROC usp_GetEmployeesSalaryAboveNumber @Number decimal(18, 4)
AS
BEGIN
	SELECT
		FirstName, LastName
	FROM
		Employees
	WHERE
		Salary >= @Number
END

EXEC usp_GetEmployeesSalaryAboveNumber @Number = 48100
