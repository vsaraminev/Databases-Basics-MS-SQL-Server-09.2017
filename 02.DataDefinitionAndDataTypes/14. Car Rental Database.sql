CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY(1,1),
CategoryName NVARCHAR(50) NOT NULL,
DailyRate INT,
WeeklyRate INT,
MonthlyRate INT,
WeekendRate INT
)

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES 
('CategoryName1', 1, 1, 1, 1), 
('CategoryName2', 2, 2, 2, 2), 
('CategoryName3', 3, 3, 3, 3)

CREATE TABLE Cars
(
Id INT PRIMARY KEY IDENTITY(1,1),
PlateNumber NVARCHAR(50),
Manufacturer NVARCHAR(50),
Model NVARCHAR(50),
CarYear INT,
CategoryId INT,
Doors INT,
Picture VARBINARY(MAX),
Condition NVARCHAR(MAX),
Available BIT
)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES
('1234567ABC', 'Audi', 'A1', 2012, 1, 5, NULL, 'Good', 1),
('123ABC123', 'Audi', 'A2', 2013, 2, 3, NULL, 'Good', 0),
('1rfghju7856', 'Audi', 'A4', 2015, 3, 5, NULL, 'Perfect', 1)

CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(50),
Notes NVARCHAR(MAX)
)

INSERT INTO Employees(FirstName, LastName, Title, Notes)
VALUES ('Ivan', 'Ivanov','Title1', NULL),
('Pesho', 'Peshov', 'Title2', NULL),
('Gosho', 'Goshov', 'Title3', NULL)

CREATE TABLE Customers
(
Id INT PRIMARY KEY IDENTITY(1,1),
DriverLicenceNumber NVARCHAR(50) NOT NULL,
FullName NVARCHAR(MAX) NOT NULL,
Address NVARCHAR(MAX) NOT NULL,
City NVARCHAR(50),
ZIPCode INT,
Notes NVARCHAR(MAX)
)

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES 
('123AVC123', 'Customer1', 'Address1', 'City1', 1, NULL),
('1356yhbvcd4', 'Customer2', 'Address2' , 'City2', 2, NULL),
('adfgfe4564', 'Customer3', 'Address3', 'City3', 3, NULL)

CREATE TABLE RentalOrders
(
Id INT PRIMARY KEY IDENTITY(1,1),
EmployeeId INT,
CustomerId INT,
CarId INT,
TankLevel NUMERIC (10,2),
KilometrageStart BIGINT NOT NULL,
KilometrageEnd BIGINT NOT NULL,
TotalKilometrage BIGINT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalDays INT NOT NULL,
RateApplies NUMERIC(10,2),
TaxRate NUMERIC(10,2),
OrderStatus BIT,
Notes NVARCHAR(MAX)
)

INSERT INTO RentalOrders
(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd,TotalKilometrage,
StartDate, EndDate, TotalDays, RateApplies, TaxRate, OrderStatus, Notes)
VALUES 
(1, 1, 1, 10, 123, 130, 130-123, '2017-01-02', '2017-02-02',  2, 1.2, 20, 1, NULL),
(2, 2, 2, 20, 323, 330, 330-323, '2017-02-03', '2017-03-04', 5, 1.15, 10, 0, NULL),
(3, 3, 3, 30, 423, 530, 530-423, '2017-05-06', '2017-07-07', 10, 1.1, 15, 1, NULL)
