CREATE FUNCTION udf_GetRating(@ProductName VARCHAR(20))
RETURNS VARCHAR(10)
AS
BEGIN	
	DECLARE @ProductId INT = (SELECT Id FROM Products 
								WHERE Name = @ProductName)

	DECLARE @AverageRate FLOAT = (SELECT AVG(Rate) FROM Feedbacks 
									WHERE ProductId = @ProductId)
	DECLARE @Result VARCHAR(10);

	SET @Result =
	CASE
	WHEN @AverageRate < 5 THEN 'Bad'
	WHEN @AverageRate BETWEEN 5 AND 8 THEN 'Average'
	WHEN @AverageRate > 8 THEN 'Good'
	ELSE 'No rating'
	END

	RETURN @Result
END

