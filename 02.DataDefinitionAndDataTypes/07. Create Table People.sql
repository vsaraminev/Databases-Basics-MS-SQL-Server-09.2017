CREATE TABLE People
(
Id INT PRIMARY KEY IDENTITY(1, 1),
Name NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX),
Height NUMERIC(4, 2),
Weight NUMERIC(8, 2),
Gender CHAR(1) CHECK(Gender IN ('m','f')) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR(MAX)
) 

INSERT INTO People
VALUES
('Pesho', NULL, 1.78, 80.5, 'm','19860504',NULL),
('Ivan', NULL, 1.58, 90.5, 'm','19850504',NULL),
('Gosho', NULL, 1.88, 79.5, 'm','19880504',NULL),
('Maria', NULL, 1.48, 61.5, 'f','19890504',NULL),
('Stela', NULL, 1.98, 65.5, 'f','19810504',NULL)