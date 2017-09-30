SELECT TOP(10)
FirstName, 
LastName, 
DepartmentID 
FROM Employees AS e
WHERE Salary > (
				SELECT 
				AVG(Salary) 
				FROM Employees AS emp
				WHERE e.DepartmentID = emp.DepartmentID
				GROUP BY DepartmentID
)
ORDER BY DepartmentID
