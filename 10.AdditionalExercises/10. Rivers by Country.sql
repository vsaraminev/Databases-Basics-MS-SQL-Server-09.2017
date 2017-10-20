SELECT c.CountryName, 
	   con.ContinentName,
	   COUNT(r.Id) AS RiversCount,
	   CASE 
	   WHEN SUM(r.Length) IS NULL THEN 0
	   ELSE SUM(r.Length) 
	   END AS TotalLength 
FROM Countries AS c
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
LEFT JOIN Continents AS con ON con.ContinentCode = c.ContinentCode
GROUP BY c.CountryName, con.ContinentName
ORDER BY RiversCount DESC, TotalLength DESC, c.CountryName ASC