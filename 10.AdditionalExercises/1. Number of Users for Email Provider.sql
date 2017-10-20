SELECT 
RIGHT(u.Email,LEN(u.Email) - CHARINDEX('@',u.Email,1)) AS [Email Provider],
COUNT(*) AS [Number Of Users]
FROM Users AS u
GROUP BY RIGHT(u.Email,LEN(u.Email) - CHARINDEX('@',u.Email,1))
ORDER BY [Number Of Users] DESC, [Email Provider] ASC
