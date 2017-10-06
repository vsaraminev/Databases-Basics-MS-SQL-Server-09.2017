SELECT SUM(counted.counts) AS CountryCode From
(
SELECT 
COUNT(*) AS counts
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
WHERE m.Id IS NULL
GROUP BY c.CountryCode
) AS counted
