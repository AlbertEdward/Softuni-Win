CREATE PROCEDURE usp_CalculateFutureValueForAccount(@accountID INT, @percent FLOAT)
AS
BEGIN
SELECT ah.Id, ah.FirstName, ah.LastName, a.Balance, (SELECT dbo.ufn_CalculateFutureValue(a.Balance, @percent, 5))
AS 'Balance in 5 Years' FROM AccountHolders  AS ah
JOIN Accounts AS a
ON a.AccountHolderId= ah.Id
WHERE a.Id= @accountID
GROUP BY ah.Id, ah.FirstName, ah.LastName, a.Balance
END