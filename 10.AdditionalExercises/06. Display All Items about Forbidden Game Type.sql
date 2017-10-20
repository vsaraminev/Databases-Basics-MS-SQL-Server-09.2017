SELECT i.Name AS Item,
	   i.Price,
	   i.MinLevel,
	   gt.Name AS [Forbidden Game Type]
	   FROM Items AS i
LEFT JOIN GameTypeForbiddenItems AS fi ON fi.ItemId = i.Id
LEFT JOIN GameTypes AS gt ON gt.Id= fi.GameTypeId
GROUP BY i.Name, i.Price, i.MinLevel, gt.Name
ORDER BY [Forbidden Game Type] DESC, i.Name ASC