SELECT 
f.ProductId,
c.FirstName + ' ' + ISNULL(c.LastName, ' ') AS CustomerName,
f.Description
FROM Customers AS c
INNER JOIN Feedbacks AS f ON f.CustomerId = c.Id
WHERE f.CustomerId IN (
SELECT f.CustomerId FROM Feedbacks AS f
GROUP BY f.CustomerId
HAVING COUNT(f.Id) >= 3)
ORDER BY f.ProductId, CustomerName, f.Id