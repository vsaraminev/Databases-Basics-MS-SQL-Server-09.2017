CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES 
('Ivan', 'Ivanov', 'Title1', NULL),
('Pesho', 'Peshev', 'Title2', NULL),
('Gosho', 'Goshev', 'Title3', Null)

CREATE TABLE Customers
(
AccountNumber INT PRIMARY KEY IDENTITY(1, 1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
PhoneNumber NVARCHAR(50),
EmergencyName NVARCHAR(50) NOT NULL,
EmergencyNumber INT NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES
('Petar', 'Petrov', '123456', 'Pepi', 1, NULL),
('Tosho', 'Toshev', '1245683456', 'Tosh', 2, NULL),
('Valentin', 'Valentinov', '34567123456', 'Val', 3, NULL)

CREATE TABLE RoomStatus
(
RoomStatus NVARCHAR(50),
Notes NVARCHAR(MAX)
)

INSERT INTO RoomStatus (RoomStatus, Notes)
VALUES 
('RoomStatus1', NULL), 
('RoomStatus2', NULL), 
('RoomStatus3',NULL)

CREATE TABLE RoomTypes
(
RoomType NVARCHAR(50) PRIMARY KEY NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT INTO RoomTypes (RoomType, Notes)
VALUES 
('RoomType1', NULL), 
('RoomType2', NULL), 
('RoomType3', NULL)

CREATE TABLE BedTypes
(
BedType NVARCHAR(50),
Notes NVARCHAR(MAX)
)

INSERT INTO BedTypes (BedType, Notes)
VALUES 
('BedType1', NULL), 
('BedType2', NULL), 
('BedType3', NULL)

CREATE TABLE Rooms
(
RoomNumber INT PRIMARY KEY NOT NULL,
RoomType NVARCHAR(50),
BedType NVARCHAR(50),
Rate INT,
RoomStatus NVARCHAR(50),
Notes NVARCHAR(MAX)
)

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES 
(1, 'RoomType1', 'BedType1', 7, 'RoomStatus1', NULL),
(2, 'RoomType2', 'BedType2', 8, 'RoomStatus2', NULL),
(3, 'RoomType3', 'BedType3', 9, 'RoomStatus3', NULL)

CREATE TABLE Payments
(
Id INT PRIMARY KEY IDENTITY(1, 1),
EmployeeId INT,
PaymentDate DATE,
AccountNumber INT,
FirstDateOccupied DATE,
LastDateOccupied DATE,
TotalDays INT,
AmountCharged NUMERIC(10,2),
TaxRate FLOAT(2),
TaxAmount MONEY,
PaymentTotal MONEY,
Notes NVARCHAR(MAX)
)

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays,
AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
VALUES 
(1, '2017-02-02', 1, '2017-01-01', '2017-01-03', 20, 20.2, 1.23, 1234, 1235, NULL),
(2, '2017-03-02', 2, '2017-02-02', '2017-02-03', 10, 24.2, 4.23, 123344, 134235, NULL),
(3, '2017-04-02', 3, '2017-03-03', '2017-03-03', 15, 2.2, 6.23, 11234, 21235, NULL)

CREATE TABLE Occupancies
(
Id INT PRIMARY KEY IDENTITY(1, 1),
EmployeeId INT,
DateOccupied DATE,
AccountNumber INT,
RoomNumber INT,
RateApplied FLOAT(2),
PhoneCharge MONEY,
Notes NVARCHAR(50) 
)

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES 
(1, '2017-05-06', 1, 1, 1.52, 20,NULL), 
(2, '2017-06-06', 2, 2, 1.12, 10,NULL),
(3, '2017-05-07', 3, 3, 1.2, 20,NULL)