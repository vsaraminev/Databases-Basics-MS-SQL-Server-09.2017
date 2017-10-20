SELECT g.Name AS Game,
	   gt.Name AS [Game Type],
	   u.Username,
	   ug.Level,
	   ug.Cash,
	   c.Name AS [Character]
	FROM Users AS u
INNER JOIN UsersGames AS ug ON ug.UserId = u.Id
INNER JOIN Games AS g ON g.Id = ug.GameId
INNER JOIN Characters AS c ON c.Id = ug.CharacterId
INNER JOIN GameTypes AS gt ON gt.Id = g.GameTypeId
ORDER BY ug.Level DESC, u.Username ASC, g.Name ASC