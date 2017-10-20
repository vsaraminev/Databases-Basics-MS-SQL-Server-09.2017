CREATE PROC udp_SendMessage(@UserId INT, @ChatId INT, @Content VARCHAR(MAX))
AS
BEGIN
	DECLARE @count INT;
	SET @count = (SELECT COUNT(UserId) FROM Messages WHERE UserId = @UserId AND ChatId = @ChatId)

	IF(@count = 0)
	BEGIN
		RAISERROR('There is no chat with that user!', 16, 1);
		RETURN;
	END

	INSERT INTO Messages (Content, SentOn, ChatId, UserId)
	VALUES
	(@Content, GETDATE(), @ChatId, @UserId)			
END