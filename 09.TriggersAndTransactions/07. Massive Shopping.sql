DECLARE @userId INT = (SELECT id FROM Users WHERE Username = 'Stamat');
DECLARE @gameId INT = (SELECT Id FROM Games WHERE [Name] = 'Safflower');
DECLARE @userGameId INT = (SELECT id FROM UsersGames WHERE UserId = @userId AND GameId = @gameId)

BEGIN TRY
BEGIN TRAN
	UPDATE UsersGames
	SET Cash -= (SELECT SUM(Price) FROM Items WHERE MinLevel IN(11, 12))
	WHERE Id = @userId

	DECLARE @Balance DECIMAL(18, 4);
	SET @Balance = (SELECT Cash FROM UsersGames WHERE Id = @userId);

	IF(@Balance < 0)
	BEGIN
		ROLLBACK;
		RETURN;
	END
	INSERT INTO UserGameItems
	SELECT id, @userGameId FROM Items WHERE MinLevel IN (11, 12)
COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH

BEGIN TRY
BEGIN TRAN
	UPDATE UsersGames
	SET Cash -= (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN 19 AND 21)
	WHERE Id = @userId

	SET @Balance = (SELECT Cash FROM UsersGames WHERE Id = @userId)

	IF(@Balance < 0)
	BEGIN
		ROLLBACK;
		RETURN;
	END
	INSERT INTO UserGameItems
	SELECT id, @userGameId FROM Items WHERE MinLevel BETWEEN 19 AND 21
COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH

SELECT a.Name AS [Item Name] 
FROM Items AS a
INNER JOIN UserGameItems AS ugi ON ugi.ItemId = a.Id
WHERE ugi.UserGameId = @userGameId
ORDER BY [Item Name]