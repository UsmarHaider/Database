
create database ques21

use ques21

create table SAILOR
(
SailorID int primary key,
SailorName varchar(50),
Phone varchar(50),
City varchar(50)
)

create table OWNER
(
OwnerID int primary key,
OwnerName varchar(50),
Phone varchar(50),
City varchar(50),
Country varchar(50)
)

create table BOAT
(
BoatName varchar(50) primary key,
BoatType varchar(50),
Price int,
OwnerID int,
Foreign key (OwnerID) references [dbo].[OWNER](OwnerID)
)

create table RESERVATION
(
ReserveID int primary key,
SailorID int,
BoatName varchar(50),
Date date,
[Day] varchar(25),
Foreign key (SailorID) references SAILOR(SailorID),
Foreign key (BoatName) references BOAT(BoatName)
)

create table RESERVATION_DAYS
(
ID int primary key identity(1,1),
WeekDay varchar(25)
)

Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (1, 'Salar But', '123-123-123', 'Lahore' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (2, 'Ahmad Jabbar' , '123-123-123', 'Karachi' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (3, 'Sumair Tayyab', '123-123-123', 'Karachi' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (4, 'Bilal Ahmad', '123-123-123', 'Sialkot' )
Insert into SAILOR(SailorID, SailorName, Phone, City) VALUES (5, 'Ali Hafiz', '123-123-123', 'Lahore' )

Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (1,'John Silver','123-123-123','Birmingham','England')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (2,'Shane Micheal','123-123-123','Bradford','England')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (3,'Ahmad Jabbar','123-123-123','Multan','Pakistan')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (4,'Furqan Ali','123-123-123','Sakkhar','Pakistan')
Insert into OWNER (OwnerID, OwnerName, Phone, City, Country) VALUES (5,'Faheem Abid','123-123-123','Lahore','Pakistan')
 
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Hang Loose','Cabin_cruise',5000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Southern Comfort','Motor_boat',1000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Kitty Crew','Motor_boat',6000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Lounge Lizard','Motor_boat',2000000,1)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Safe Seamen','Raft',5000000,2)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Double Dollars','Cabin_cruise',5000000,3)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Titanic','Cabin_cruise',8000000,3)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Wet Dream','Airboat',700000,3)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Crew Lounge','Fishing',300000,4)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('Aga','Fishing',100000,4)
Insert into BOAT (BoatName, BoatType, Price, OwnerID) VALUES ('A Fish Too Far ','Cabin_cruise',8000000,4)

Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (1,1,'A Fish Too Far','10-06-2014', 'Thursday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (2,1,'Hang Loose','06-07-2014', 'Monday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (3,1,'Double Dollars','02-08-2014', 'Sunday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (4,2,'Crew Lounge','03-08-2014', 'Thursday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (5,3,'Wet Dream','10-09-2014', 'Sunday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (6,4,'Titanic','10-09-2014', 'Saturday')
Insert into RESERVATION (ReserveID, SailorID, BoatName, Date, [day]) VALUES (7,4,'Aga','10-09-2014', 'Thursday')

Insert into RESERVATION_DAYS(weekday) VALUES ('Sunday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Monday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Tuesday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Wednesday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Thursday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Friday')
Insert into RESERVATION_DAYS(weekday) VALUES ('Saturday')


select * from SAILOR
select * from OWNER
select * from BOAT
select * from RESERVATION
select * from RESERVATION_DAYS

---q1
create view abc as
select BOAT.BoatName,BOAT.BoatType,BOAT.Price,BOAT.OwnerID,OWNER.OwnerName from BOAT left join OWNER on BOAT.OwnerID=OWNER.OwnerID

select * from abc

---q2
create view def as
select SAILOR.SailorID,SAILOR.SailorName,SAILOR.Phone,SAILOR.City,RESERVATION.BoatName from RESERVATION left join SAILOR on RESERVATION.SailorID=SAILOR.SailorID

select * from def


drop procedure ghi
create procedure ghi
as begin
select OwnerName,count(*) as count from abc
group by OwnerName
end
execute ghi
drop view jkl
create view jkl as
select OWNER.OwnerID,OWNER.OwnerName,OWNER.Phone,OWNER.City,OWNER.Country,BOAT.BoatName from OWNER left join BOAT on BOAT.OwnerID=OWNER.OwnerID

insert into jkl values (4,'Furqan Ali','123-123-123','Sakkhar','Pakistan','Zeemal')


create trigger mno
on database
for


CREATE TRIGGER example
AFTER INSERT ON emp
FOR EACH ROW
BEGIN
   insert_row_proc;
END;


CREATE PROCEDURE insert_row_proc
BEGIN
  INSERT INTO emp@remote
    VALUES ('x');
EXCEPTION
   WHEN OTHERS THEN
       INSERT INTO emp_log
       VALUES ('x');
END;



---question4
CREATE VIEW OwnerDetails AS
SELECT * FROM [Owner]

INSERT INTO OwnerDetails VALUES(6, 'Ali', '234-234-234', 'Lahore', 'Pakistan')

SELECT * FROM OwnerDetails
 
 ----question6
 go
create trigger view_insert on insert1
instead of insert
as begin
exec boat_count
insert into insert1 values(
(select inserted.OwnerID from inserted), (select inserted.OwnerName from inserted),(select inserted.Phone from inserted), (select City from inserted) ,(select inserted.Country from inserted))
end
go

insert into insert1 values(9,'saad',123-123-123,'lahore','pakistan')
select * from OWNER

go
create procedure s
as begin
select 'a' as msg1
end
go
