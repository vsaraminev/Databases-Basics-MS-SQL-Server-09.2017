SELECT TOP (5)
c.CountryName,
CASE 
WHEN r.RiverName IS NULL THEN NULL
ELSE r.RiverName
END AS RiverName
FROM Countries AS c
LEFT JOIN Continents as con ON con.ContinentCode = c.ContinentCode
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
WHERE con.ContinentName = 'Africa' 
ORDER BY c.CountryName
