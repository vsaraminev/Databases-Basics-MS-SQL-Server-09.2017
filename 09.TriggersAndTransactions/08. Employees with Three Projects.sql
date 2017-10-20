CREATE PROC usp_AssignProject(@emloyeeId INT, @projectID INT)
AS
BEGIN 
	BEGIN TRAN

	INSERT INTO EmployeesProjects
	VALUES (@emloyeeId, @projectID)

	IF((SELECT COUNT(ProjectID) FROM EmployeesProjects
		WHERE EmployeeID = @emloyeeId)>3)
	BEGIN
		RAISERROR ('The employee has too many projects!', 16, 1);
		ROLLBACK;
		RETURN;
	END

	COMMIT
END 


SELECT e.EmployeeID FROM Employees AS e
INNER JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID 
HAVING COUNT(ep.ProjectID) < 3
