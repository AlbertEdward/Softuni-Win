SELECT (c.FirstName + ' ' + c.LastName) AS FullName, a.Country, a.ZIP, CONCAT('$', MAX(ci.PriceForSingleCigar)) AS CigarPrice
FROM Clients AS c
JOIN Addresses AS a ON a.Id = c.AddressId
JOIN ClientsCigars AS cl ON cl.ClientId = c.Id
JOIN Cigars AS ci ON ci.Id = cl.CigarId
GROUP BY (c.FirstName + ' ' + c.LastName), a.Country, a.ZIP
HAVING ZIP NOT LIKE '%[^0-9]%' 