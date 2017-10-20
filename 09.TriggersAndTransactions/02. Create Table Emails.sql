CREATE TRIGGER Tr_NotificationEmails_After_Insert ON Logs AFTER INSERT
AS
BEGIN
	INSERT INTO NotificationEmails
	SELECT TOP (1) l.AccountId,
	CONCAT ('Balance change for account: ', l.AccountId),
	CONCAT('On ', GETDATE(), ' your balance was changed from ', l.OldSum,' to ', l.NewSum, '.')
	FROM Logs AS l
	ORDER BY l.LogId DESC
END
