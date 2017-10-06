SELECT TOP (50)
e.EmployeeID,
e.FirstName + ' '+ e.LastName AS EmployeeName,
e1.FirstName + ' ' + e1.LastName AS ManagerName,
d.Name
FROM Employees AS e
LEFT JOIN Employees AS e1 ON e1.EmployeeID = e.ManagerID
LEFT JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
ORDER BY e.EmployeeID ASC
