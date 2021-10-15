CREATE  PROCEDURE usp_GetHoldersWithBalanceHigherThan(@number DECIMAL(18,4))
AS
BEGIN
SELECT FirstName,LastName FROM AccountHolders AS ah
JOIN Accounts AS a
ON a.AccountHolderId=ah.Id
GROUP BY FirstName,LastName
HAVING SUM(Balance)>@number
ORDER BY FirstName,LastName
END

EXEC usp_GetHoldersWithBalanceHigherThan 40000