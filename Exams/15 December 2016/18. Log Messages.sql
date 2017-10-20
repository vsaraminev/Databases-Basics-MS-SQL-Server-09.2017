CREATE TABLE MessageLogs
(
Id INT PRIMARY KEY IDENTITY,
Content VARCHAR(200),
SentOn DATE,
ChatId INT,
UserId INT,
CONSTRAINT FK_Messages_Chats
FOREIGN KEY (ChatId)
REFERENCES Chats(Id),
CONSTRAINT FK_Messages_Users
FOREIGN KEY (UserId)
REFERENCES Users(Id)
)
GO

CREATE TRIGGER tr_LogMessages ON [dbo].[Messages] AFTER DELETE
AS
BEGIN 
	INSERT INTO MessageLogs(Id,Content, SentOn, ChatId, UserId)
	SELECT Id, Content, SentOn, ChatId, UserId FROM deleted 
END