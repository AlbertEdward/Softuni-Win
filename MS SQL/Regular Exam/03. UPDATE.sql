UPDATE Cigars
SET PriceForSingleCigar *= 1.20
WHERE TastId IN (SELECT Tastes.Id FROM Tastes WHERE Tastes.TasteType = 'Spicy') 

UPDATE Brands
SET BrandDescription = 'New description'
WHERE BrandDescription IS NULL
