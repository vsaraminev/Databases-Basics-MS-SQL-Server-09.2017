CREATE PROC usp_CalculateFutureValueForAccount(@AccId INT, @rate FLOAT)
AS
BEGIN
SELECT a.Id, 
ah.FirstName, 
ah.LastName, 
a.Balance,
dbo.ufn_CalculateFutureValue(a.Balance, @rate, 5) AS "Balance In 5 Years" 
FROM AccountHolders AS ah
JOIN Accounts AS a ON a.AccountHolderId = ah.Id
WHERE a.Id = @AccId
END
