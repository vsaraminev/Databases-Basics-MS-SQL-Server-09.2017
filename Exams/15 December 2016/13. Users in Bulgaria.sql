SELECT  u.Nickname,
		c.Title,
		l.Latitude,
		l.Longitude
		FROM Users AS u
INNER JOIN Locations AS l ON l.Id = u.LocationId
INNER JOIN UsersChats AS uc ON uc.UserId = u.Id
INNER JOIN Chats AS c ON c.Id = uc.ChatId
WHERE (l.Latitude BETWEEN 41.14 AND CAST(44.13 AS NUMERIC)) AND 
	  (l.Longitude BETWEEN 22.21 AND CAST(28.36 AS NUMERIC))
ORDER BY c.Title ASC