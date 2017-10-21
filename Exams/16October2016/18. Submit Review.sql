CREATE PROC usp_SubmitReview(@CustomerID INT, @ReviewContent VARCHAR(MAX), @ReviewGrade INT, @AirlineName VARCHAR(MAX))
AS 
BEGIN
	IF(@AirlineName NOT IN (SELECT AirlineName FROM Airlines))
	BEGIN
		RAISERROR('Airline does not exist.', 16, 1);
		RETURN;
	END

	DECLARE @AirlId INT = (
						 SELECT AirlineID FROM Airlines
				         WHERE AirlineName = @AirlineName 
						 )

	INSERT INTO CustomerReviews
		(ReviewID, CustomerID,ReviewContent,ReviewGrade,AirlineID)
	VALUES
	(1, @CustomerID, @ReviewContent, @ReviewGrade, @AirlId)
END



