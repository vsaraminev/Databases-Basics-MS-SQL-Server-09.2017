SELECT 
c.FirstName + ' ' +ISNULL(c.LastName, ' ') AS CustomerName,
c.PhoneNumber,
c.Gender 
FROM Customers AS c
left join Feedbacks AS f ON f.CustomerId = c.Id
WHERE f.Rate IS NULL
ORDER BY c.Id ASC