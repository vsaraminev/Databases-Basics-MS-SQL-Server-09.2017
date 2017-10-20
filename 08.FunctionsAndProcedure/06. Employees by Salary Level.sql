CREATE PROC usp_EmployeesBySalaryLevel(@salary VARCHAR(10))
AS
SELECT e.FirstName, e.LastName FROM Employees AS e 
WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @salary
