SELECT c.Id, (c.FirstName + ' ' + c.LastName) AS ClientName, c.Email
FROM Clients AS c
LEFT JOIN ClientsCigars AS cc ON cc.ClientId = c.Id
LEFT JOIN Cigars AS ci ON ci.Id = cc.CigarId
WHERE cc.ClientId IS NULL
ORDER BY ClientName