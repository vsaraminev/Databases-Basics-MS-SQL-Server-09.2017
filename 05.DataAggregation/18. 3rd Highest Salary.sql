SELECT 
salaries.DepartmentID, 
salaries.Salary 
FROM
(
SELECT 
DepartmentID, 
MAX(Salary) AS Salary,
DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY salary DESC) AS Rank
FROM Employees
GROUP BY DepartmentID, Salary
) AS salaries
WHERE Rank = 3
