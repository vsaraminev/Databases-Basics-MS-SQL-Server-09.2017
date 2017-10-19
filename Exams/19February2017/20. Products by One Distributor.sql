SELECT 
p.Name AS ProductName,
AVG(f.Rate) AS ProductAverageRate,
d.Name AS DistributorName,
c.Name AS DistributorCountry
FROM Products AS p
INNER JOIN Feedbacks AS f ON f.ProductId = p.Id
INNER JOIN ProductsIngredients AS pi ON pi.ProductId = p.Id
INNER JOIN Ingredients AS i ON  i.Id = pi.IngredientId
INNER JOIN Distributors AS d ON d.Id = i.DistributorId
INNER JOIN Countries AS c ON c.Id = d.CountryId
WHERE p.Id IN 
(SELECT temp.Id FROM
(SELECT  
p.Id,
p.Name AS ProductName,
AVG(f.Rate) AS ProductAverageRate,
d.Name AS DistributorName,
c.Name AS DistributorCountry
FROM Products AS p
INNER JOIN Feedbacks AS f ON f.ProductId = p.Id
INNER JOIN ProductsIngredients AS pi ON pi.ProductId = p.Id
INNER JOIN Ingredients AS i ON  i.Id = pi.IngredientId
INNER JOIN Distributors AS d ON d.Id = i.DistributorId
INNER JOIN Countries AS c ON c.Id = d.CountryId
GROUP BY p.id, p.Name, d.Name, c.Name) AS temp
GROUP BY temp.Id
HAVING COUNT(temp.DistributorName) = 1)
GROUP BY p.Id, p.Name, d.Name, c.Name
ORDER BY p.Id