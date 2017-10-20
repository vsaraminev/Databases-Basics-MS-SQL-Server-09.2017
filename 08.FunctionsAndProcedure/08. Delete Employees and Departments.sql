CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT)
AS 
ALTER TABLE Departments
ALTER COLUMN ManagerID INT NULL

DELETE FROM EmployeesProjects 
WHERE EmployeeID IN (
					SELECT e.EmployeeID FROM Employees AS e
					WHERE e.DepartmentID = @departmentId
					)

UPDATE Employees
SET ManagerID = NULL
WHERE ManagerID IN (
					SELECT e.EmployeeID FROM Employees AS e
					WHERE e.DepartmentID = @departmentId
					)

UPDATE Departments
SET ManagerID = NULL
WHERE  ManagerID IN (
					SELECT e.EmployeeID FROM Employees AS e
					WHERE e.DepartmentID = @departmentId
					)
					
DELETE FROM Employees
WHERE EmployeeID IN (
SELECT e.EmployeeID FROM Employees AS e
					WHERE e.DepartmentID = @departmentId
					)

DELETE FROM Departments
WHERE DepartmentID = @departmentId

SELECT COUNT(EmployeeID) FROM Employees
WHERE DepartmentID = @departmentId
