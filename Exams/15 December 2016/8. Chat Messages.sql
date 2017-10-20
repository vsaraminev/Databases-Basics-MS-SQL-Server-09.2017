SELECT  c.Id, 
		c.Title, 
		m.Id 
		FROM Chats AS c
INNER JOIN Messages AS m ON m.ChatId = c.Id
WHERE m.SentOn < '2012-03-26' AND c.Title LIKE '%x' 
ORDER BY c.Id ASC, m.Id ASC