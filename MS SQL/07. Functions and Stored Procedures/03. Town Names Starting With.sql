CREATE PROC usp_GetTownsStartingWith @Str varchar(50)
AS
BEGIN
	SELECT Name
	FROM Towns
	WHERE Name LIKE LOWER(@Str+'%')
END

EXEC usp_GetTownsStartingWith 'b'