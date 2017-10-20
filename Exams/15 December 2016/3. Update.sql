UPDATE Chats
SET StartDate = m.SentOn from Chats AS c
INNER JOIN Messages AS m ON m.ChatId = c.Id
WHERE c.StartDate > m.SentOn