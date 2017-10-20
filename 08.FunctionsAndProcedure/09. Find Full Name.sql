CREATE PROCEDURE usp_GetHoldersFullName
AS
SELECT 
ah.FirstName + ' ' + ah.LastName AS FullName
FROM AccountHolders AS ah
