CREATE VIEW v_UserWithCountries AS
SELECT
Cus.FirstName + ' ' + ISNULL(Cus.LastName, ' ') AS CountryName, 
Cus.Age,
Cus.Gender,
Cou.Name
FROM Customers AS Cus
JOIN Countries AS Cou ON Cou.Id = Cus.CountryId 