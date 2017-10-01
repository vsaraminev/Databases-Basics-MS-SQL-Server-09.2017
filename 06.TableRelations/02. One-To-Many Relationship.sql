CREATE TABLE Manufacturers
(
ManufacturerID INT PRIMARY KEY IDENTITY,
Name VARCHAR(50),
EstablishedOn DATE
)

INSERT INTO Manufacturers
VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

CREATE TABLE Models
(
ModelID INT PRIMARY KEY,
Name VARCHAR(50),
ManufacturerID INT
)

INSERT INTO Models
VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'ModelS', 2),
(104, 'ModelX', 2),
(105, 'Model3', 2),
(106, 'Nova', 3)

ALTER TABLE Models
ADD CONSTRAINT FK_Models_Manufacturers
FOREIGN KEY (ManufacturerID)
REFERENCES Manufacturers(ManufacturerID)
