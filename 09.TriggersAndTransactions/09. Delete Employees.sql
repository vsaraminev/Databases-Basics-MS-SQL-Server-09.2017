CREATE TABLE Deleted_Employees
(
EmployeeId INT PRIMARY KEY IDENTITY, 
FirstName VARCHAR(50), 
LastName VARCHAR(50), 
MiddleName VARCHAR(50), 
JobTitle VARCHAR(50), 
DepartmentId INT, 
Salary DECIMAL(18, 2)
)
GO

--Submit only trigger
CREATE TRIGGER tr_DeletedEmployees ON Employees AFTER DELETE
AS
BEGIN
	INSERT INTO Deleted_Employees
	SELECT  FirstName, 
			LastName,
			MiddleName, 
			JobTitle, 
			DepartmentID, 
			Salary 
			FROM deleted
END