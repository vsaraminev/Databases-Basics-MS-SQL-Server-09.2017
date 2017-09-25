SELECT 
PeakName, 
RiverName, 
CONCAT(LOWER(LEFT(PeakName,LEN(PeakName)-1)),'',LOWER(RiverName)) AS [Mix]
FROM Peaks,Rivers
WHERE RIGHT(PeakName,1) = LEFT(RiverName, 1)
ORDER BY Mix ASC
