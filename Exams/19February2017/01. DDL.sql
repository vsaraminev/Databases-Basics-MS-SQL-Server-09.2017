CREATE TABLE Countries
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) UNIQUE
)

CREATE TABLE Products
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) UNIQUE,
Description NVARCHAR(250),
Recipe NVARCHAR(MAX),
Price MONEY CHECK (Price >= 0)
) 

CREATE TABLE Distributors
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) UNIQUE,
AddressText NVARCHAR(30),
Summary NVARCHAR(200),
CountryId INT,
CONSTRAINT FK_Distributors_Countries
FOREIGN KEY (CountryId)
REFERENCES Countries(Id)
)

CREATE TABLE Ingredients
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30),
Description NVARCHAR(200),
OriginCountryId INT,
DistributorId INT,
CONSTRAINT FK_Ingredients_Distributors
FOREIGN KEY (DistributorId)
REFERENCES Distributors(Id),
CONSTRAINT FK_Ingredients_Countries
FOREIGN KEY (OriginCountryId)
REFERENCES Countries(Id)
)

CREATE TABLE Customers
(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(25),
LastName NVARCHAR(25),
Gender CHAR(1) CHECK (Gender = 'M' OR Gender = 'F'),
Age INT,
PhoneNumber CHAR(10),
CountryId INT,
CONSTRAINT FK_Customers_Countries
FOREIGN KEY (CountryId)
REFERENCES Countries(Id)
)

CREATE TABLE Feedbacks
(
Id INT PRIMARY KEY IDENTITY,
Description NVARCHAR(255),
Rate DECIMAL (8,2) CHECK (RATE BETWEEN 0 AND 10),
ProductId INT,
CustomerId INT,
CONSTRAINT FK_Feedbacks_Customers
FOREIGN KEY (CustomerId)
REFERENCES Customers(Id),
CONSTRAINT FK_Feedbacks_Products
FOREIGN KEY (ProductId)
REFERENCES Products(Id)
) 

CREATE TABLE ProductsIngredients
(
ProductId INT,
IngredientId INT,
CONSTRAINT PK_ProductsIngredients
PRIMARY KEY (ProductId, IngredientId),
CONSTRAINT FK_ProductsIngredients_Products
FOREIGN KEY (ProductId)
REFERENCES Products(Id),
CONSTRAINT FK_ProductsIngredients_Ingredients
FOREIGN KEY (IngredientId)
REFERENCES Ingredients(Id)
)