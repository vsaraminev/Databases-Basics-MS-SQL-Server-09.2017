CREATE PROC usp_GetEmployeesSalaryAboveNumber (@value MONEY)
AS
SELECT e.FirstName, e.LastName FROM Employees AS e
WHERE e.Salary >= @value
