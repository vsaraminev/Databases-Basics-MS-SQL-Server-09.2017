SELECT m.Content, m.SentOn FROM Messages AS m
WHERE m.SentOn > '2014-05-12' AND 
	  m.Content LIKE '%just%'
ORDER BY m.Id DESC