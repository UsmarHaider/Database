use master
go
 
Create database Neo1
go 
use data1

go
create table Students
(RollNo varchar(7) primary key NOT NULL
,Name varchar(30)   NOT NULL
,Gender varchar(7)  NOT NULL
,phonenumber int  NOT NULL
)
GO
INSERT INTO [Students]([RollNo],[Name],[gender],[phonenumber])
values
('L164123' ,'Ali Ahmad','Male', 0333-3333333),
('L164124' ,'Rafia Ahmed','Female',0333-3456789),
('L164125' ,'Basit Junaid','Male',0345-3243567)
GO

create table Attendance
(RollNo varchar(7) Foreign key References Students(RollNo) NOT NULL,
Date1 Date NOT NULL ,
Status_1 char(1) ,
ClassVenue int primary key NOT NULL,
)
INSERT INTO [Attendance]([RollNo],[Date1],[Status_1],[ClassVenue])
values
('L164123', 2-22-2016, 'P', 2),
('L164124' ,2-23-2016 ,'A', 1),
('L164125', 3-4-2016 ,'P', 3)

go

create table ClassVenue
(ClassVenue int Foreign key References Attendance(ClassVenue) NOT NULL,
Building varchar(10),
RoomNum int,
TeacherId int primary key
)
INSERT INTO [ClassVenue]([ID],[Building],[RoomNum],[TeacherId])
values
( 1,'CS',2 ,1),
( 2,'Civil',7 ,2)

go
create table Teacher
(TeacherId int Foreign key References ClassVenue(TeacherId),
Name varchar(10),
Designation varchar(10),
Department varchar(20)
)

INSERT INTO [Teacher]([Id],[Name],[Designation],[Department])
values
(1,'Sarim Baig','Assistant Prof','Computer Science'),
(2,'Bismillah Jan','Lecturer','Civil Eng.'),
(3,'Kashif zafar','Professor','Electrical Eng')


alter table Student add WARNINGCOUNT int NOT NULL

--GO
--INSERT INTO Students
--values
--('L164123' ,'Ali Ahmad','Male', 3.2) phone number in int but here phonenumber is in float


--INSERT INTO ClassVenue
--values
--( 3,'CS',5 ,'Ali') bcz we replace int into char 

update Teacher
set Name='Dr. Kashif Zafar'
where Name= 'Kashif Zafar'

Delete from Students
Where RollNo='L162334'

Delete from Students
Where RollNo='L16123'

Delete from Students
Where RollNo='L16124'

alter table Students add CNIC varchar(13)   


alter table Teacher add Constraint unique_constraint_teach_name unique(name)


alter table Students DROP COLUMN phone

alter table Student add Constraint con_gender check (Gender='male ' or Gender ='female')

alter table Attendance add Constraint con_Status_1 check (Status_1='A ' or Status_1 ='P')

select * from Students
select * from Attendance
select * from ClassVenue
select * from Teacher
