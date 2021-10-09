CREATE FUNCTION ufn_GetSalaryLevel (@salary DECIMAL(18,4))
RETURNS NVARCHAR(7)  
AS
BEGIN
	DECLARE @salaryLevel VARCHAR(7)
	IF (@Salary < 30000)
		SET @salaryLevel = 'Low'
	ELSE IF(@Salary <= 50000)
		SET @salaryLevel = 'Average'
	ELSE
		SET @salaryLevel = 'High'
	RETURN @salaryLevel
END

GO 

SELECT Salary, dbo.ufn_GetSalaryLevel(Salary) as SalaryLevel
FROM Employees