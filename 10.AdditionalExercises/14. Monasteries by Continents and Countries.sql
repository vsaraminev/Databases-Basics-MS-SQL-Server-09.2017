UPDATE Countries
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'

INSERT INTO Monasteries (Name, CountryCode)
(SELECT 'Hanga Abbey', CountryCode
 FROM Countries AS c 
 WHERE CountryName = 'Tanzania')

 INSERT INTO Monasteries (Name, CountryCode)
(SELECT 'Myin-Tin-Daik', CountryCode
 FROM Countries AS c 
 WHERE CountryName = 'Myanmar')


SELECT 
	 cont.ContinentName, 
	 c.CountryName, 
	 COUNT(m.Name) AS MonasteriesCount
FROM Continents AS cont
  LEFT JOIN Countries AS c ON cont.ContinentCode = c.ContinentCode
  LEFT JOIN Monasteries AS m ON m.CountryCode = c.CountryCode
WHERE c.IsDeleted = 0
GROUP BY cont.ContinentName, c.CountryName
ORDER BY MonasteriesCount DESC, c.CountryName