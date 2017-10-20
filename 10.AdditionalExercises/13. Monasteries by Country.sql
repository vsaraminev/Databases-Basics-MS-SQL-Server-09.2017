CREATE TABLE Monasteries
(
  Id int PRIMARY KEY IDENTITY, 
  Name nvarchar(200) NOT NULL, 
  CountryCode char(2) NOT NULL,
  CONSTRAINT FK_Monasteries_Countries 
  FOREIGN KEY (CountryCode) REFERENCES Countries(CountryCode)
)

INSERT INTO Monasteries(Name, CountryCode) 
VALUES
  ('Rila Monastery �St. Ivan of Rila�', 'BG'), 
  ('Bachkovo Monastery �Virgin Mary�', 'BG'),
  ('Troyan Monastery �Holy Mother''s Assumption�', 'BG'),
  ('Kopan Monastery', 'NP'),
  ('Thrangu Tashi Yangtse Monastery', 'NP'),
  ('Shechen Tennyi Dargyeling Monastery', 'NP'),
  ('Benchen Monastery', 'NP'),
  ('Southern Shaolin Monastery', 'CN'),
  ('Dabei Monastery', 'CN'),
  ('Wa Sau Toi', 'CN'),
  ('Lhunshigyia Monastery', 'CN'),
  ('Rakya Monastery', 'CN'),
  ('Monasteries of Meteora', 'GR'),
  ('The Holy Monastery of Stavronikita', 'GR'),
  ('Taung Kalat Monastery', 'MM'),
  ('Pa-Auk Forest Monastery', 'MM'),
  ('Taktsang Palphug Monastery', 'BT'),
  ('S�mela Monastery', 'TR');


WITH CTE_CountriesWithMoreRivers (CountryCode) AS 
(
  SELECT c.CountryCode
  FROM Countries AS c
  JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
  GROUP BY c.CountryCode
  HAVING COUNT(cr.RiverId) > 3

)

UPDATE Countries
	SET IsDeleted = 1
	WHERE CountryCode IN (SELECT * FROM CTE_CountriesWithMoreRivers)

SELECT m.Name AS Monastery, 
	   c.CountryName AS Country
	   FROM Monasteries AS m
JOIN Countries AS c ON c.CountryCode = m.CountryCode
WHERE c.IsDeleted = 0
ORDER BY Monastery
