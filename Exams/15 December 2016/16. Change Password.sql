CREATE PROC udp_ChangePassword(@Email VARCHAR(MAX), @NewPassword VARCHAR(MAX))
AS
BEGIN
	IF(@Email NOT IN(SELECT Email FROM Credentials))
	BEGIN
		RAISERROR('The email does''t exist!', 16, 1);
		RETURN;
	END

	UPDATE Credentials
	SET Password = @NewPassword
	WHERE Email = @Email 
END