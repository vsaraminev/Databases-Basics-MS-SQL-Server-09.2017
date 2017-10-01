CREATE TABLE Subjects
(
SubjectID INT PRIMARY KEY,
SubjectName VARCHAR(50)
)

CREATE TABLE Majors
(
MajorID INT PRIMARY KEY,
Name VARCHAR(50)
)

CREATE TABLE Students
(
StudentID INT PRIMARY KEY,
StudentNumber INT,
StudentName VARCHAR(MAX),
MajorID INT,
CONSTRAINT FR_Students_Majors
FOREIGN KEY (MajorID)
REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
PaymentID INT PRIMARY KEY,
PaymentDate DATE,
PaymentAmount NUMERIC(8, 2),
StudentID INT,
CONSTRAINT FK_Payments_Students
FOREIGN KEY (StudentID)
REFERENCES Students(StudentID)
)

CREATE TABLE Agenda
(
StudentID INT,
SubjectID INT,
CONSTRAINT PK_StudentsSubjects
PRIMARY KEY (StudentID, SubjectID),
CONSTRAINT FK_StudentsSubjects_Students
FOREIGN KEY (StudentID)
REFERENCES Students(StudentID),
CONSTRAINT FK_StudentsSubjects_Subjects
FOREIGN KEY (SubjectID)
REFERENCES Subjects(SubjectID)
)
