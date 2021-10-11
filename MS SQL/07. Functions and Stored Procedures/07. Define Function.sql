CREATE FUNCTION dbo.ufn_IsWordComprised (@setOfLetters nvarchar(30), @word nvarchar(30))
RETURNS BIT
BEGIN
	DECLARE @index int = 1
	DECLARE @count INT = LEN(@word)
	DECLARE @letter CHAR(1)

	WHILE @count >= @index
	BEGIN
		SET @letter = SUBSTRING(@word,@index,1)

		IF(CHARINDEX(@letter,@setOfLetters)>0)
			SET @index += 1
			ELSE RETURN 0
	END
	RETURN 1
END
GO

SELECT dbo.ufn_IsWordComprised('oistmiahf','asd') AS [Result]
