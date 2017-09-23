CREATE TABLE Users
(
Id BIGINT IDENTITY PRIMARY KEY,
Username VARCHAR(30) UNIQUE,
Password VARCHAR(26),
ProfilePicture VARBINARY(MAX),
LastLoginTime DATE,
IsDeleted BIT
)

INSERT INTO Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES ('Ivan', 'pass123', NULL, NULL, 1),
('Pesho', 'peshoPass',NULL, NULL, 0),
('Maria', 'noPass', NULL, '2016-12-15',1),
('Tosho', 'Passsssss', NULL, NULL, 0),
('Iva', 'PaSsWoRd', NULL, '2015-03-02',0)