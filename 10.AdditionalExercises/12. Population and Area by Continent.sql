SELECT c.ContinentName,
	   SUM(coun.AreaInSqKm) AS CountriesArea,
	   SUM(CAST(coun.Population AS bigint)) AS CountriesPopulation
  FROM Continents AS c
LEFT JOIN Countries AS coun ON coun.ContinentCode = c.ContinentCode
GROUP BY c.ContinentName
ORDER BY CountriesPopulation DESC