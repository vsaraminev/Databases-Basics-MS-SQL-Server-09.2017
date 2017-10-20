SELECT p.PeakName,
	   m.MountainRange AS Mountain,
	   c.CountryName,
	   con.ContinentName
 FROM Peaks AS p
INNER JOIN Mountains AS m ON m.Id = p.MountainId
INNER JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
INNER JOIN Countries AS c ON c.CountryCode = mc.CountryCode
INNER JOIN Continents AS con ON con.ContinentCode = c.ContinentCode 
ORDER BY p.PeakName ASC, c.CountryName ASC