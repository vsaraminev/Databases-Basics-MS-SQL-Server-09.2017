CREATE PROC usp_WithdrawMoney (@AccountId INT, @moneyAmount MONEY)
AS 
BEGIN
	UPDATE Accounts
	SET Balance -= @moneyAmount
	WHERE Accounts.Id = @AccountId
END
