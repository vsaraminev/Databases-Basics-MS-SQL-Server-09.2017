SELECT maxUsage.ContinentCode, Usages.CurrencyCode ,maxUsage.MaxUsage FROM 
(
	SELECT c.ContinentCode, c.CurrencyCode, COUNT(*) AS Usage FROM Countries AS c
    GROUP BY c.ContinentCode ,c.CurrencyCode
	HAVING  COUNT(*) > 1
) 
 AS Usages
 INNER JOIN
(
SELECT Usages.ContinentCode, MAX(Usages.Usage) AS MaxUsage FROM 
    (
	 SELECT c.ContinentCode, c.CurrencyCode AS code, COUNT(*) AS Usage FROM Countries AS c
	 GROUP BY c.ContinentCode ,c.CurrencyCode
	) AS Usages
	GROUP BY Usages.ContinentCode
) AS maxUsage ON maxUsage.ContinentCode = Usages.ContinentCode AND maxUsage.MaxUsage = Usages.Usage
