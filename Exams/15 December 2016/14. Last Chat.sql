SELECT TOP(1) 
	   c.Title,
	   m.Content
	   FROM Chats AS c
LEFT JOIN Messages AS m ON c.Id = m.ChatId
ORDER BY StartDate DESC