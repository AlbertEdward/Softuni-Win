CREATE FUNCTION udf_ClientWithCigars(@name VARCHAR(50))
RETURNS INT
AS
BEGIN
DECLARE @counter INT
SET @counter =
			(SELECT COUNT(*) AS [Output]
				FROM Clients AS c
				LEFT JOIN ClientsCigars AS cc ON cc.ClientId = c.Id
				LEFT JOIN Cigars as cgr ON cc.CigarId = cgr.Id
				WHERE c.FirstName = @name
				GROUP BY c.FirstName)
RETURN @counter
END
GO
SELECT dbo.udf_ClientWithCigars('Betty')