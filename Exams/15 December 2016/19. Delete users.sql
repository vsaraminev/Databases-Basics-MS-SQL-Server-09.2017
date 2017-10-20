CREATE TRIGGER tr_DeleteUsers ON [dbo].[Users] INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM Messages
	WHERE UserId = (SELECT Id FROM deleted)

	DELETE FROM UsersChats 
	WHERE UserId = (SELECT Id FROM deleted)

	UPDATE Users
	SET CredentialId = NULL
	WHERE Id = (SELECT Id FROM deleted)

	DELETE FROM Credentials	
	WHERE Id = (SELECT CredentialId FROM deleted)

	DELETE FROM Users
	WHERE Id = (SELECT Id FROM deleted)
END