CREATE PROC usp_SendFeedback (@CustomerId INT, @ProductId INT, @Rate FLOAT, @Description VARCHAR(MAX))
AS
BEGIN
	DECLARE @FeedbacksCount INT;

	SET @FeedbacksCount =  (
							SELECT COUNT(f.Rate) from Feedbacks as f
							WHERE f.CustomerId = @CustomerId 
							AND f.ProductId = @ProductId
							GROUP BY f.CustomerId
							);
	IF(@FeedbacksCount >= 3)
	BEGIN
		RAISERROR ('You are limited to only 3 feedbacks per product!', 16, 1);
	END

	INSERT INTO Feedbacks(CustomerId, ProductId, Rate, Description) 
	VALUES
	(@CustomerId, @ProductId, @Rate, @Description) 
END
