CREATE PROCEDURE usp_SearchByTaste(@taste VARCHAR(50))
AS
BEGIN
	SELECT
		cgs.CigarName,CONCAT('$',cgs.PriceForSingleCigar) AS Price, t.TasteType, b.BrandName,
		CONCAT(s.Length,' cm') AS CigarLength,
		CONCAT(s.RingRange,' cm') AS CigarRingRange
	FROM 
		Tastes AS t
	FULL JOIN Cigars AS cgs ON cgs.TastId = t.Id
	FULL JOIN Brands AS b ON b.Id = cgs.BrandId
	FULL JOIN Sizes as s ON s.Id = cgs.SizeId
WHERE t.TasteType = @taste
ORDER BY CigarLength ASC, CigarRingRange DESC
END

EXEC usp_SearchByTaste 'Woody'