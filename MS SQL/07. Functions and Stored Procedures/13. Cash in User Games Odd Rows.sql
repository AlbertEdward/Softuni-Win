CREATE FUNCTION ufn_CashInUsersGames(@gameName NVARCHAR(50))
RETURNS TABLE
AS
RETURN SELECT(SELECT SUM(Cash) AS [SumCash]
FROM(SELECT g.[Name], ug.Cash, ROW_NUMBER() OVER (PARTITION BY g.[Name] ORDER BY ug.Cash DESC) AS [Row] FROM UsersGames AS ug
JOIN Games AS g
ON ug.GameId = g.Id
WHERE g.[Name]=@gameName) AS [RowNumQuery]
WHERE [Row] %2 != 0) AS [Sum]