use master
go
 
Create database Data222
go

use Data222
go
create table Users
(UserID int primary key not null,
 Name varchar(30) not null,
 EmailAddress varchar(50) not null,
 SignupDate date not null
)
go
insert into Users values
(1,'bob','bob@gmail.com','1-1-2016'),
(2,'Tom','tom@yahoo.com','1-2-2017'),
(3,'Alice','alice@gmail.com','1-6-2014'),
(4,'Jim','Jim@ymail.com','1-6-2017')

go
create table Category
(MovieCategoryID int primary key not null,
 categoryName varchar(30) not null
)
go
insert into Category values
(1,'Horror'),
(2,'Comedy'),
(3,'Animated'),
(4,'Action')

go
create table Movies
(MovieID int primary key not null,
 UserID int Foreign key References Users(UserID) not null,
 MovieTitle varchar(50) not null,
 MovieCategoryID int Foreign key References Category(MovieCategoryID),
 RentalRatePerDay float
)
go
Insert into Movies values
(1,1,'MI-I',4,3.3),
(2,2,'MI-II',4,4.3),
(3,3,'MI-III',4,5),
(4,4,'horton hears a who',3,5.0)
go

Insert into Movies values (6,2,'xyz',null,10)

go
create table rentals
(RentalID int primary key not null,
 UserID int Foreign key References Users(UserID) not null ,
 MovieID int Foreign key References Movies(MovieID) not null,
 RentalStartDate date,
 RentalEndDate date
)
go
Insert into rentals values (1,1,1,'1-6-2019','1-10-2019')
Insert into rentals values (2,1,1,'2-7-2018','2-10-2018')
Insert into rentals values (3,1,2,'3-8-2018','2-13-2019')
Insert into rentals values (4,2,3,'4-9-2019','4-15-2019')
Insert into rentals values (5,3,1,'1-7-2018','1-30-2018')
Insert into rentals values (7,3,6,'2-8-2019','2-21-2019')


select * from Users
select * from Category
select * from Movies
select * from rentals


Select UserID, UPPER(Name)
from Users;

Select MovieTitle, RentalRatePerDay
from Movies;

Select MovieID
from Movies
where UserID = 3



select MovieTitle, RentalRatePerDay
from Movies
where RentalRatePerDay<5

Select distinct UserID
from rentals
where RentalID is null


Select distinct UserID
from rentals
where RentalID is not null

select MovieTitle, isnull(MovieCategoryID, 0)
from Movies

select UserID, DATEDIFF(day, RentalStartDate, RentalEndDate) as days
from rentals
where UserID = 3


SELECT CHARINDEX('C', 'Customer') AS MatchPosition

select EmailAddress
from Users
where EmailAddress like '%@gmail.com%'


Select UserID
from rentals
where RentalID = 1 and RentalID = 3

select MovieCategoryID
from Category
where categoryName is not null

select MovieCategoryID
from Category
where categoryName like 'c%'