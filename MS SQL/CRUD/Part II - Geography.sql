--22. All Mountain Peaks
Select PeakName
FROM Peaks
ORDER BY PeakName


--23. Biggest Countries by Population
SELECT TOP(30) CountryName, [Population]
FROM Countries
WHERE ContinentCode = 'EU'
ORDER BY [Population] DESC, CountryName

--24. *Countries and Currency (Euro/Not Euro)
SELECT CountryName, CountryCode,
CASE
    WHEN CurrencyCode != 'EUR' THEN 'Not Euro'
    WHEN CurrencyCode = 'EUR' THEN 'Euro'
	WHEN CurrencyCode IS NULL THEN 'Not Euro'
END AS Currency
FROM Countries
ORDER BY CountryName

