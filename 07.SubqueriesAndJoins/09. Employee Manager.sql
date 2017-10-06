SELECT
e.EmployeeID,
e.FirstName,
e.ManagerID,
e1.FirstName AS ManagerName
FROM Employees AS e
JOIN Employees AS e1 ON e1.EmployeeID = e.ManagerID
WHERE e.ManagerID IN (3, 7)
