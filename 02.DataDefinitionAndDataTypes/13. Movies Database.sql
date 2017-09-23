CREATE TABLE Directors
(
Id INT PRIMARY KEY,
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT INTO Directors (Id, DirectorName, Notes)
VALUES 
(1, 'Ivan', 'Ivan e 1'), 
(2, 'Pesho', 'Pesho e 2'), 
(3, 'Gosho', 'Gosho e 3'), 
(4, 'Tosho', 'Tosho e 4'),
(5, 'Maria', 'Maria e 5')

CREATE TABLE Genres
(
Id INT PRIMARY KEY,
GenreName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT INTO Genres (Id, GenreName, Notes)
VALUES 
(1, 'Action', NULL), 
(2, 'Comedy', NULL), 
(3, 'Crime', NULL), 
(4, 'Drama', NULL), 
(5, 'History', NULL)

CREATE TABLE Categories
(
Id INT PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT INTO Categories (Id, CategoryName, Notes)
VALUES 
(1, 'Category1', NULL), 
(2, 'Category2', NULL), 
(3, 'Category3', NULL), 
(4, 'Category4', NULL), 
(5, 'Category5', NULL)

CREATE TABLE Movies
(
Id INT PRIMARY KEY,
Title NVARCHAR(50) NOT NULL,
DirectorId INT,
CopyrightYear DATE,
Lenght NUMERIC(10,2),
GenreId INT,
CategoryId INT,
Rating FLOAT(2),
Notes NVARCHAR(MAX)
)

INSERT INTO Movies (Id, Title, DirectorId, CopyrightYear, Lenght, GenreId, CategoryId, Rating, Notes)
VALUES 
(1, 'Movie1', 1, '2005-05-06', 120.35, 1, 1, 7.8, NULL), 
(2, 'Movie2', 2, '2009-04-03', 116.14, 2, 2, 8.8, NULL),
(3, 'Movie3', 3 ,'2004-05-07', 118.06, 3, 3, 9.5, NULL),
(4, 'Movie4', 4 ,'2014-07-07', 108.16, 4, 4, 6.5, NULL),
(5, 'Movie5', 5 ,'2001-06-07', 111.26, 5, 5, 5.5, NULL)
