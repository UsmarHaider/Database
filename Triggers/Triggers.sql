

go
create table Students
(RollNo varchar(7) primary key
,Name varchar(30)
,WarningCount int
,Department varchar(15)
)
GO
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'1', N'Ali', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'2', N'Bilal', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'3', N'Ayesha', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'4', N'Ahmed', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'5', N'Sara', 0, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'6', N'Salman', 1, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'7', N'Zainab', 2, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'8', N'Danial', 1, N'CS')

go
create table Courses
(
CourseID int primary key,
CourseName varchar(40),
PrerequiteCourseID int,
CreditHours int
) 
GO
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (10, N'Database Systems', 20, 3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (20, N'Data Structures', 30,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (30, N'Programing', NULL,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (40, N'Basic Electronics', NULL,3)
go

go
Create table Instructors 
(
InstructorID int Primary key,
Name varchar(30),
Department varchar(7) ,
)
GO
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (100, N'Ishaq Raza', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (200, N'Zareen Alamgir', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (300, N'Saima Zafar', N'EE')
go
Create table Semester
(
Semester varchar(15) Primary key,
[Status] varchar(10),
)
GO
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Fall2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2017', N'InProgress')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Summer2016', N'Cancelled')
go
Create table Courses_Semester
(
InstructorID int Foreign key References Instructors(InstructorID),
CourseID int Foreign key References Courses(CourseID),
Semester varchar(15) Foreign key References Semester(Semester), 
Section varchar(1) ,
AvailableSeats int,
Department varchar(2)
)
GO
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'D', 45, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'C', 0, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (100, 10, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2016', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2016', N'A', 0, N'CS')

go



create table Registration
(
Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
CourseID int Foreign key References Courses(CourseID), 
Section varchar(1),
GPA float
)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'1', 20, N'A', 3.3)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'2', 20, N'B', 4)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2016', N'1', 30, N'A', 1.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'6', 40, N'D',0.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2017', N'6', 40, N'D',1)


go

Create table ChallanForm
(Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
TotalDues int,
[Status] varchar(10)
)
GO
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'1', 100000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'2', 13333, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'3', 5000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'4', 20000, N'Pending')
select * from Students
select * from Courses
select * from Instructors
select * from Registration
select * from Semester
select * from Courses_Semester
select * from ChallanForm
------------------------------------------------------------ 1: 
--CREATE TRIGGER students_delete_replacer ON Students
--INSTEAD OF DELETE
--AS BEGIN
--PRINT ' don’t have the permission to delete the student xD';
--END
--GO
--DELETE FROM Students WHERE Department = 'CS'
--SELECT * FROM Students
---- ---------------------------------------------------------2: 
--CREATE TRIGGER courses_insertion_replacer ON Courses
--INSTEAD OF INSERT
--AS BEGIN
--PRINT ' don’t have the permission to Insert a new Course xD';
--END
--GO
--INSERT INTO Courses VALUES(50, 'Fundamentals of Big Data Analytics', NULL, 3);
--SELECT * FROM Courses
------------------------------------------------------------- 4:
--DROP TRIGGER registration_notification
--CREATE TRIGGER outstanding_dues ON Registration
--INSTEAD OF INSERT
--AS BEGIN
--DECLARE @enteredRollNo VARCHAR(7)
--SELECT @enteredRollNo = I.RollNumber FROM inserted I
--IF (@enteredRollNo IN (SELECT CF.RollNumber FROM ChallanForm CF WHERE CF.Status = 'Pending' GROUP BY CF.RollNumber HAVING sum(CF.TotalDues) >= 20000))
--BEGIN
--PRINT 'You have outstanding dues hence you cannot be enrolled'
--END
--ELSE
--BEGIN
--INSERT INTO Registration VALUES((SELECT I.Semester FROM inserted I), @enteredRollNo, (SELECT I.CourseID FROM inserted I), (SELECT I.Section FROM inserted I),
--								(SELECT I.GPA FROM inserted I))
--END
--END
--GO
--INSERT INTO Registration VALUES('Fall2017', 4, 40, 'A', -1);
--SELECT * FROM Registration
--------------------------------------------------------------5:
--CREATE TRIGGER deletion_constraint ON Courses_Semester
--INSTEAD OF DELETE
--AS BEGIN
--DECLARE @enteredInstructorID INT
--DECLARE @enteredCourseID INT
--DECLARE @enteredSemester VARCHAR(15)
--DECLARE @enteredSection VARCHAR(1)
--DECLARE @enteredAvailableSeats INT
--DECLARE @enteredDept VARCHAR(2)
--SELECT @enteredInstructorID = D.InstructorID FROM deleted D
--SELECT @enteredCourseID = D.CourseID FROM deleted D
--SELECT @enteredSemester = D.Semester FROM deleted D
--SELECT @enteredSection = D.Section FROM deleted D
--SELECT @enteredDept = D.Department FROM deleted D
--SELECT @enteredAvailableSeats = D.AvailableSeats FROM deleted D
--IF (@enteredAvailableSeats < 10)
--BEGIN
--PRINT 'Not Possible'
--END
--ELSE
--BEGIN
--PRINT 'Successfully Deleted'
--DELETE FROM Courses_Semester WHERE InstructorID=@enteredInstructorID AND CourseID=@enteredCourseID
-- AND Semester=@enteredSemester AND Section=@enteredSection
-- AND Department=@enteredDept AND AvailableSeats=@enteredAvailableSeats
--END
--END
--GO
--DELETE FROM Courses_Semester WHERE AvailableSeats < 10
--SELECT * FROM Courses_Semester
--DELETE FROM Courses_Semester WHERE CourseID=10 AND Section='D'
--SELECT * FROM Courses_Semester
------------------------------------------------------------------- 6: 
--CREATE TRIGGER
-- noDrop_Instructors ON DATABASE
--FOR drop_table
--AS BEGIN
--PRINT 'Cannot drop Instructors Table'
--END
--GO
--CREATE TRIGGER 
--noAlter_Instructors ON DATABASE
--FOR alter_table
--AS BEGIN
--PRINT 'Cannot Alter Instructors Table'
--END
--GO
