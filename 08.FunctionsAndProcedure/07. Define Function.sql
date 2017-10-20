CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
   DECLARE @wordLen INT = LEN(@word);
   DECLARE @index INT = 1;

   WHILE(@index <= @wordLen)
	BEGIN
	  DECLARE @char VARCHAR(1) = SUBSTRING(@word, @index, 1);
		IF(CHARINDEX(@char, @setOfLetters) <= 0)
		  BEGIN
			RETURN 0
		  END
	 SET	@index += 1;
	END
	RETURN 1
END
