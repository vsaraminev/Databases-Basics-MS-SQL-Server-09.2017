CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY) 
RETURNS VARCHAR(10)
AS
BEGIN
		DECLARE @result VARCHAR(10);

		if (@salary < 30000)
		BEGIN
		 SET @result = 'Low'; 
		END
		ELSE IF (@salary BETWEEN 30000 AND 50000)
		BEGIN
		 SET @result = 'Average';
		END
		ELSE IF (@salary > 50000)
		BEGIN 
		 SET @result = 'High'; 
		END

		RETURN @result;
END
