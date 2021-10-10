SELECT CountryName, IsoCode
FROM Countries
WHERE CountryName Like '%a%a%a%'
ORDER BY IsoCode

SELECT PeakName, RiverName, LOWER(PeakName) + TRIM(LEFT(RiverName, 1) FROM LOWER(RiverName)) AS Mix
FROM Peaks, Rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix


SELECT PeakName, RiverName, LOWER(PeakName) +  RIGHT(RiverName, LEN(RiverName) - 1) AS Mix
FROM Peaks, Rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix
