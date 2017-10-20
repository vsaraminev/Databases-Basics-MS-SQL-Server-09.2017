CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL (18, 4)) 
AS 
BEGIN
	BEGIN TRAN

	EXEC [dbo].[usp_WithdrawMoney] @SenderId, @Amount
	EXEC [dbo].[usp_DepositMoney] @ReceiverId, @Amount
		
		IF( (SELECT Balance FROM Accounts WHERE Id = @SenderId) < 0)
		BEGIN
			ROLLBACK
		END
	COMMIT
END