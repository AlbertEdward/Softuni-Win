CREATE PROC usp_GetEmployeesFromTown @TownName varchar(50)
AS
BEGIN
	SELECT
		FirstName, LastName
	FROM 
		Employees as e
	JOIN Addresses as a ON a.AddressID = e.AddressID
	JOIN Towns as t ON t.TownID = a.TownID
	WHERE t.Name = @TownName
END

EXEC usp_GetEmployeesFromTown Sofia