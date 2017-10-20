CREATE PROC usp_GetTownsStartingWith(@param VARCHAR(20))
AS
SELECT t.Name FROM Towns AS t
WHERE t.Name LIKE CONCAT (@param, '%')