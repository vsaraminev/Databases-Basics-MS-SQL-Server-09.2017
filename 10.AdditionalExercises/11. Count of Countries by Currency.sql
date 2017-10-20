SELECT  cur.CurrencyCode,
		cur.Description,
		COUNT(con.ContinentCode) AS NumberOfCountries
		FROM Currencies AS cur
LEFT JOIN  Countries AS c ON c.CurrencyCode = cur.CurrencyCode
LEFT JOIN Continents AS con ON con.ContinentCode = c.ContinentCode
GROUP BY cur.CurrencyCode,cur.Description
ORDER BY NumberOfCountries DESC, cur.Description ASC