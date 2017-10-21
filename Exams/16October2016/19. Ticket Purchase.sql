CREATE PROC usp_PurchaseTicket (@CustomerID INT, @FlightID INT, @TicketPrice DECIMAL(8, 2), @Class VARCHAR(6), @Seat VARCHAR(5))
AS
BEGIN
	DECLARE @CustBalance DECIMAL(10,2);
	SET @CustBalance = (
						SELECT Balance FROM CustomerBankAccounts
						WHERE CustomerID = @CustomerID
						)

	IF(@TicketPrice > @CustBalance OR @CustBalance IS NULL)
	BEGIN
		RAISERROR('Insufficient bank account balance for ticket purchase.', 16 ,1);
		RETURN;
	END

	UPDATE CustomerBankAccounts
	SET Balance -= @TicketPrice
	WHERE  CustomerID = @CustomerID

	DECLARE @ticId INT;
	SET @ticId = ISNULL((SELECT MAX(TicketID) FROM Tickets), 0) + 1;

	INSERT INTO Tickets
	VALUES
	(@ticId, @TicketPrice, @Class, @Seat, @CustomerID, @FlightID)
	 
END
