CREATE FUNCTION ufn_CalculateFutureValue(@sum MONEY, @rate FLOAT, @years INT)
RETURNS DECIMAL (18, 4)
AS
BEGIN
	DECLARE @result DECIMAL (18, 4)
	SET @result = @sum * POWER((1+@rate),@years);

	RETURN @result;
END  
