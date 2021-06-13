use master
go

create database MovieTicketing
go

--drop database MovieTicketing
go

use MovieTicketing
go


create table [Users]
(
  userID int identity(1,1) primary key,
  userFname varchar(10),
  userLname varchar(10),
  age int,
  username varchar(10),
  [password] varchar(8),
  email varchar(20),
  gender varchar(10)
)
GO
insert into Users values('Eisha','Ahmad',21,'eisha','eisha123','eisha@gmail.com','Female')
create table Genre
(
 genreID int primary key,
 genreName varchar(20)
)
GO

create table Movies
(
  movieID int primary key,
  title varchar(50),
  rating float,
  genreID int foreign key references Genre (genreID),
  duration int,
  [description] varchar(500),
  director varchar(20),
  [cast] varchar(100)
)
GO

create table Cinemas
(
  cinemaID int primary key,
  cinemaName varchar(20),
  location varchar(50),
  contactNum varchar(20),
  email varchar(30),
  price int
)
GO

create table Slot
(
  slotID int primary key,
  startTime time,
  endTime time
)
GO
create table cinemaToMovieMapping
(
 ID int identity(1,1) primary key,
 cID int foreign key references Cinemas(cinemaID),
 mID int foreign key references Movies(movieID),
 slots int foreign key references Slot(slotID),
 [date] date
)



GO
create table Discount
(
  discountID int primary key,
  [day] varchar(10),
  [description] varchar(20),
  DisountPercent int
)
GO

create table Seats
(
 seatNo int ,
 bookedStatus int check (bookedStatus=0  or bookedStatus=1), --0=not booked, 1=booked
 cid int foreign key references Cinemas (cinemaID)
)

create table Ticket
(
  ticketID int identity(1,1) primary key,
  userId int foreign key references [Users] (UserID),
  cmid int foreign key references cinemaToMovieMapping (ID),
  discount int foreign key references Discount (discountID),
  seatNo int
)


-------------------------------------------------DATA INSERTION-----------------------------------------


insert into Genre values
  (1, 'Horror'),
  (2,'Comedy'),
  (3,'Action'),
  (4,'Animated'),
  (5,'Romance')


insert into Movies values
(1,'A Quiet Place',7.5,1,120,'If they hear you, they hunt you. A family must live in silence to avoid mysterious creatures that hunt by sound.','John Krasinski','John Krasinski'),
(2, 'Bird Box', 6.6,1,124,'When a mysterious force decimates the population, only one thing is certain -- if you see it, you die','Susanne Bier','Sandra Bullock'),
(3,'The Hangover',7.7,2,110,'Two days before his wedding, Doug and three friends drive to Las Vegas for a wild and memorable stag party.',' Todd Phillips','Bradley Cooper'),
(4,'Just Go With It',6.4,2,110,'His heart recently broken, plastic surgeon Danny Maccabee pretends to be married so he can enjoy future dates with no strings attached','Dennis Dugan','Jennifer Aniston'),
(5,'Fast and Furious 8',6.6,3,135,'With Dom and Letty married, Brian and Mia retired and the rest of the crew exonerated, the globe-trotting team has found some semblance of a normal life.','F. Gary Gray','Vin Diesel'),
(6,'Avengers: End Game',8.5,3,180,'Adrift in space with no food or water, Tony Stark sends a message to Pepper Potts as his oxygen supply starts to dwindle.',' Joe Russo','Robert Downey Jr.'),
(7,'Coco',8.4,4,110,'Despite his family generations-old ban on music, young Miguel dreams of becoming an accomplished musician like his idol Ernesto de la Cruz.',' Adrian Molina','Anthony Gonzalez'),
(8,'Up',8.2,4,96,'Carl Fredricksen, a 78-year-old balloon salesman, is about to fulfill a lifelong dream.','Pete Docter','Bob Peterson'),
(9,'Her',8,5,126,'A sensitive and soulful man earns a living by writing personal letters for other people.','Spike Jonze','Joaquin Phoenix'),
(10,'Your Name',8.4,5,112,'Two teenagers share a profound, magical connection upon discovering they are swapping bodies.',' Makoto Shinkai','Taki Tachibana')
go


insert into Cinemas values
(1, 'Universal Cinemas', 'Johar Town', '0333-333333', 'universalcinemas@gmail.com', 300),
(2, 'Cinepax' , 'Walton Rd', '0333-444444', 'packagescinema@gmail.com', 400),
(3, 'Cinestar' , 'Township', '0333-555555', 'cinemastar@gmail.com', 500),
(4, 'Super Cinema' , 'Canal Bank Rd', '0333-666666', 'supercinema@gmail.com', 300)
go

insert into Slot values
(1, '09:00:00', '12:00:00'),
(2, '13:00:00', '16:00:00'),
(3, '17:00:00', '20:00:00'),
(4, '21:00:00', '00:00:00')

insert into cinemaToMovieMapping (cID ,mID,slots, [date] )VALUES
------------cinema1  DAY1
(1,1,1,'2019-11-05'),
(1,3,2,'2019-11-05'),
(1,2,3,'2019-11-05'),
(1,9,4,'2019-11-05'),

-------------cinema2


(2,5,1,'2019-11-05'),
(2,6,2,'2019-11-05'),
(2,7,3,'2019-11-05'),
(2,8,4,'2019-11-05'),

-------------cinema3

(3,3,1,'2019-11-05'),
(3,1,2,'2019-11-05'),
(3,2,3,'2019-11-05'),
(3,6,4,'2019-11-05'),

-------------cinema4


(4,1,1,'2019-11-05'),
(4,9,2,'2019-11-05'),
(4,10,3,'2019-11-05'),
(4,8,4,'2019-11-05'),

------------cinema1 DAY2
(1,1,1,'2019-11-06'),
(1,3,2,'2019-11-06'),
(1,2,3,'2019-11-06'),
(1,9,4,'2019-11-06'),


-------------cinema2
(2,1,1,'2019-11-06'),
(2,2,2,'2019-11-06'),
(2,3,3,'2019-11-06'),
(2,4,4,'2019-11-06'),



-------------cinema3


(3,3,1,'2019-11-06'),
(3,1,2,'2019-11-06'),
(3,2,3,'2019-11-06'),
(3,6,4,'2019-11-06'),

-------------cinema4


(4,1,1,'2019-11-06'),
(4,9,2,'2019-11-06'),
(4,10,3,'2019-11-06'),
(4,8,4,'2019-11-06'),

------------cinema1 DAY3
(1,1,1,'2019-11-07'),
(1,3,2,'2019-11-07'),
(1,2,3,'2019-11-07'),
(1,9,4,'2019-11-07'),



-------------cinema2

(2,5,1,'2019-11-07'),
(2,6,2,'2019-11-07'),
(2,7,3,'2019-11-07'),
(2,8,4,'2019-11-07'),

-------------cinema3
(3,10,1,'2019-11-07'),
(3,9,2,'2019-11-07'),
(3,5,3,'2019-11-07'),
(3,4,4,'2019-11-07'),


-------------cinema4
(4,5,1,'2019-11-07'),
(4,2,2,'2019-11-07'),
(4,3,3,'2019-11-07'),
(4,1,4,'2019-11-07'),


------------cinema1 DAY4
(1,1,1,'2019-11-08'),
(1,3,2,'2019-11-08'),
(1,2,3,'2019-11-08'),
(1,9,4,'2019-11-08'),



-------------cinema2


(2,5,1,'2019-11-08'),
(2,6,2,'2019-11-08'),
(2,7,3,'2019-11-08'),
(2,8,4,'2019-11-08'),

-------------cinema3


(3,3,1,'2019-11-08'),
(3,1,2,'2019-11-08'),
(3,2,3,'2019-11-08'),
(3,6,4,'2019-11-08'),

-------------cinema4
(4,5,1,'2019-11-08'),
(4,2,2,'2019-11-08'),
(4,3,3,'2019-11-08'),
(4,1,4,'2019-11-08'),


------------cinema1 DAY5


(1,10,1,'2019-11-09'),
(1,1,2,'2019-11-09'),
(1,7,3,'2019-11-09'),
(1,5,4,'2019-11-09'),

-------------cinema2


(2,5,1,'2019-11-09'),
(2,6,2,'2019-11-09'),
(2,7,3,'2019-11-09'),
(2,8,4,'2019-11-09'),

-------------cinema3
(3,10,1,'2019-11-09'),
(3,9,2,'2019-11-09'),
(3,5,3,'2019-11-09'),
(3,4,4,'2019-11-09'),



-------------cinema4

(4,1,1,'2019-11-09'),
(4,9,2,'2019-11-09'),
(4,10,3,'2019-11-09'),
(4,8,4,'2019-11-09'),

------------cinema1 DAY6


(1,10,1,'2019-11-10'),
(1,1,2,'2019-11-10'),
(1,7,3,'2019-11-10'),
(1,5,4,'2019-11-10'),

-------------cinema2



(2,5,1,'2019-11-10'),
(2,6,2,'2019-11-10'),
(2,7,3,'2019-11-10'),
(2,8,4,'2019-11-10'),

-------------cinema3
(3,10,1,'2019-11-10'),
(3,9,2,'2019-11-10'),
(3,5,3,'2019-11-10'),
(3,4,4,'2019-11-10'),


-------------cinema4


(4,1,1,'2019-11-10'),
(4,9,2,'2019-11-10'),
(4,10,3,'2019-11-10'),
(4,8,4,'2019-11-10'),

------------cinema1 DAY7
(1,1,1,'2019-11-11'),
(1,3,2,'2019-11-11'),
(1,2,3,'2019-11-11'),
(1,9,4,'2019-11-11'),

------------cinema 2
(2,2,1,'2019-11-11'),
(2,6,2,'2019-11-11'),
(2,2,3,'2019-11-11'),
(2,1,4,'2019-11-11'),

------------cinema 3
(3,2,1,'2019-11-11'),
(3,6,2,'2019-11-11'),
(3,2,3,'2019-11-11'),
(3,1,4,'2019-11-11'),
-------------cinema4


(4,3,1,'2019-11-11'),
(4,1,2,'2019-11-11'),
(4,2,3,'2019-11-11'),
(4,6,4,'2019-11-11')

--seats insertion
insert into Seats (seatNo, bookedStatus, cid) values

--CINEMA1 HALL1
(1,0,1),
(2,0,1),
(3,0,1),
(4,0,1),
(5,0,1),
(6,0,1),
(7,0,1),
(8,0,1),
(9,0,1),
(10,0,1),

(11,0,1),
(12,0,1),
(13,0,1),
(14,0,1),
(15,0,1),
(16,0,1),
(17,0,1),
(18,0,1),
(19,0,1),
(20,0,1),

(21,0,1),
(22,0,1),
(23,0,1),
(24,0,1),
(25,0,1),
(26,0,1),
(27,0,1),
(28,0,1),
(29,0,1),
(30,0,1),

(31,0,1),
(32,0,1),
(33,0,1),
(34,0,1),
(35,0,1),
(36,0,1),
(37,0,1),
(38,0,1),
(39,0,1),
(40,0,1),

(41,0,1),
(42,0,1),
(43,0,1),
(44,0,1),
(45,0,1),
(46,0,1),
(47,0,1),
(48,0,1),
(49,0,1),
(50,0,1),


--CINEMA2 HALL1
(1,0,2),
(2,0,2),
(3,0,2),
(4,0,2),
(5,0,2),
(6,0,2),
(7,0,2),
(8,0,2),
(9,0,2),
(10,0,2),

(11,0,2),
(12,0,2),
(13,0,2),
(14,0,2),
(15,0,2),
(16,0,2),
(17,0,2),
(18,0,2),
(19,0,2),
(20,0,2),

(21,0,2),
(22,0,2),
(23,0,2),
(24,0,2),
(25,0,2),
(26,0,2),
(27,0,2),
(28,0,2),
(29,0,2),
(30,0,2),

(31,0,2),
(32,0,2),
(33,0,2),
(34,0,2),
(35,0,2),
(36,0,2),
(37,0,2),
(38,0,2),
(39,0,2),
(40,0,2),

(41,0,2),
(42,0,2),
(43,0,2),
(44,0,2),
(45,0,2),
(46,0,2),
(47,0,2),
(48,0,2),
(49,0,2),
(50,0,2),


--CINEMA3 HALL1
(1,0,3),
(2,0,3),
(3,0,3),
(4,0,3),
(5,0,3),
(6,0,3),
(7,0,3),
(8,0,3),
(9,0,3),
(10,0,3),

(11,0,3),
(12,0,3),
(13,0,3),
(14,0,3),
(15,0,3),
(16,0,3),
(17,0,3),
(18,0,3),
(19,0,3),
(20,0,3),

(21,0,3),
(22,0,3),
(23,0,3),
(24,0,3),
(25,0,3),
(26,0,3),
(27,0,3),
(28,0,3),
(29,0,3),
(30,0,3),

(31,0,3),
(32,0,3),
(33,0,3),
(34,0,3),
(35,0,3),
(36,0,3),
(37,0,3),
(38,0,3),
(39,0,3),
(40,0,3),
(41,0,3),
(42,0,3),
(43,0,3),
(44,0,3),
(45,0,3),
(46,0,3),
(47,0,3),
(48,0,3),
(49,0,3),
(50,0,3),



--CINEMA4 HALL1
(1,0,4),
(2,0,4),
(3,0,4),
(4,0,4),
(5,0,4),
(6,0,4),
(7,0,4),
(8,0,4),
(9,0,4),
(10,0,4),

(11,0,4),
(12,0,4),
(13,0,4),
(14,0,4),
(15,0,4),
(16,0,4), 
(17,0,4),
(18,0,4),
(19,0,4),
(20,0,4),

(21,0,4),
(22,0,4),
(23,0,4),
(24,0,4),
(25,0,4),
(26,0,4),
(27,0,4),
(28,0,4),
(29,0,4),
(30,0,4),

(31,0,4),
(32,0,4),
(33,0,4),
(34,0,4),
(35,0,4),
(36,0,4),
(37,0,4),
(38,0,4),
(39,0,4),
(40,0,4),

(41,0,4),
(42,0,4),
(43,0,4),
(44,0,4),
(45,0,4),
(46,0,4),
(47,0,4),
(48,0,4),
(49,0,4),
(50,0,4)


insert into Discount values
(1,'Wednesday','Student offer',10),
(2,'Sunday','Family discount',20),
(3,'Friday','Jumma Mubarak!',30)





select cmm.cID,c.cinemaName,m.title,s.startTime,s.endTime,DATENAME(WEEKDAY,cmm.[date]) as [Day]
from cinemaToMovieMapping cmm
inner join Movies m
ON m.movieID=cmm.mID
inner join Slot s
ON cmm.slots=s.slotID
inner join Cinemas c
ON cmm.cID=c.cinemaID





create PROCEDURE userLOGIN
@username varchar(10),@password varchar(8),@ret int output
as
begin
if(exists(select * from [Users] where username=@username and password=@password))
begin
set @ret=1
return @ret
end
else
begin
set @ret=0
return @ret
end
end

create procedure SIGNUP 
@userFname varchar(10),
@userLname varchar(10),
@age int,
@username varchar(10),
@password varchar(8),
@email varchar(20),
@gender varchar(10),
@ret int output
as
begin
if(@userFname is NULL OR @userLname is null OR @age is NULL OR @username is null OR @password is null OR @email is null OR @gender is null)
begin
set @ret=0
return @ret
end
if(exists(select * from [Users] where username=@username or email=@email))
begin
set @ret=0
return @ret
end
if(@age<18)
begin
set @ret=0
return @ret
end
else
begin
insert into [Users] values(@userFname,@userLname,@age,@username,@password,@email,@gender)
set @ret=1
return @ret
end
end

select * from Users

--drop procedure DISPLAY_MOVIE_SCHEDULE
alter PROCEDURE DISPLAY_MOVIE_SCHEDULE
@cid int,@gid int,@day varchar(10)
as
begin
select cmm.cID as cid,c.cinemaName as cname,m.title as movie_title,s.startTime as start_time,s.endTime as end_time,DATENAME(WEEKDAY,cmm.[date]) as [Day]
from cinemaToMovieMapping cmm
inner join Movies m
ON m.movieID=cmm.mID
inner join Slot s
ON cmm.slots=s.slotID
inner join Cinemas c
ON cmm.cID=c.cinemaID
where
cmm.cid=@cid and @day=DATENAME(WEEKDAY,cmm.[date]) and cmm.mID in
(select movieID from Movies where genreID=@gid)

end

go
execute DISPLAY_MOVIE_SCHEDULE
1,2,'Sunday'

go

CREATE PROCEDURE SEARCH_MOVIE_BY_NAME
@MovieName varchar(30)
as
begin
select cmm.cID,c.cinemaName,m.title,s.startTime,s.endTime,DATENAME(WEEKDAY,cmm.[date]) as [Day]
from cinemaToMovieMapping cmm
inner join Movies m
ON m.movieID=cmm.mID
inner join Slot s
ON cmm.slots=s.slotID
inner join Cinemas c
ON cmm.cID=c.cinemaID
where
cmm.mID in
(select movieID from Movies where title=@MovieName)
end

execute SEARCH_MOVIE_BY_NAME 'her'


select * from movies
go
--------------Checking available discounts---------------------
create procedure Check_Available_Discount
@date date,@discountID int output
as
begin
select @discountID=(select discountID from Discount where [day]=DATENAME(WEEKDAY,@date))
print 'Check_Available_Discount'
return @discountID
end

--drop procedure Check_Available_Discount
go
--------------GettingCMID--------------
create procedure GET_CMID
@cID int,
@mID int,
@slots int,
@date date,
@cmid int output
as
begin
select @cmid=(select id from cinemaToMovieMapping where cID=@cID and mID=@mID and slots=@slots and [date]=@date)
print 'GET_CMID'
return @cmid
end

--drop procedure GET_CMID
--------------------------------------TICKET BOOKING---------------------------------------------------------




go
create procedure TicketBooking
@userID int,
@cID int,
@mID int,
@slots int,
@date date,
@seatNo int
as
begin
declare @discountID int
execute Check_Available_Discount @date,@discountID output
--select @discountID
declare @cmid int
execute GET_CMID @cID,@mID,@slots,@date,@cmid output
print 'TicketBooking procedure'
insert into Ticket values(@userID,@cmid,@discountID,@seatNo)
end
select * from Discount
--drop procedure TicketBooking
------------------Trigger on Ticket Insertion------------------------
go
create trigger Ticket_Insertion ON Ticket
instead of insert
as
begin
declare @seatNo int
select @seatNo=(select seatNo from inserted)
declare @cmid int
select @cmid=(select cmid from inserted)
if(exists(select seatNo from Seats where seatNo=@seatNo and bookedStatus=0))
begin
declare @userID int,@discountID int
select @userID=(select userID from inserted)
select @discountID=(select discount from inserted)
insert into Ticket values(@userID,@cmid,@discountID,@seatNo)
update Seats
set bookedStatus=1
where (seatNo=@seatNo)
end
else
begin
print 'Seat Already Booked !'
end
end



select * from Ticket


--truncate table seats
--truncate table Ticket



-------------UserInfo Procedure---------------
--drop procedure getUserInfo
go
create Procedure getUserInfo
@uname varchar(10)
as
begin
select * from Users where username=@uname
end

execute getUserInfo  @uname='michelle'




--drop procedure getCinemaInfo
go
create Procedure getCinemaInfo
@cinemaId int
as
begin
select * from Cinemas where cinemaID=@cinemaId
end

go
create Procedure getGenreInfo
@genreId int
as
begin
select * from Genre where genreID=@genreId
end


go
create Procedure getMovies
@genreId int
as
begin
select * from Movies where genreID=@genreId
end

create Procedure getMovieInfo
@movieId int
as
begin
select * from Movies where movieID=@movieId
end


select * from Movies where movieID=1

------------------------------TRIGGERS-----------------------------
--alter trigger trig_addmovie
--on movies
--after insert
--as
--begin
--declare
--@movieid int,
--@title varchar(30),
--@rating float,
--@genreId int,
--@duration int,
--@description varchar(200),
--@director varchar (30),
--@cast varchar (30)

--if(@movieid is NOT NULL AND @title is NOT null AND @rating is NOT NULL AND @genreId is NOT null AND @duration is NOT null AND @description is NOT null AND @director is NOT null)
--begin
--if (not exists(select * from movies where movieid=@movieId  and @genreid not in (select genreid from Movies where genreid between 1 and 5)))
--begin
--insert into [movies] values (@movieid, @title, @rating, @genreId, @duration, @description, @director, @cast)
--end
--else
--begin
--print 'Already exists'
--end
--end
--end

--insert into Movies values (1, 'Mauqia', 8, 3, 120, 'The story of mother and child', 'Akaishi San', 'Akaishi San')
--select * from Movies
--select * from cinemas

--create trigger trig_cinemadel
--on Cinemas
--instead of delete
--as
--begin
--print 'you cannot delete cinemas'
--end

--delete from cinemas where cinemaid=2
--select * from cinemas

--create trigger trig_genre
--on Genre
--instead of delete
--as
--begin
--print 'Cannot remove genre'
--end

--delete from genre where genreid=2
--select * from genre


select * from [Users]
select * from Cinemas
select * from Movies
select * from Slot
select * from Discount
select * from cinemaToMovieMapping
select * from Genre
select * from Ticket
select * from Seats