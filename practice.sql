create table practice.users(
 UserID int NOT NULL,
 Name varchar(50) NULL,
 EmailAddress varchar(50) NULL,
 SignupDate date Null,
 Primary Key(UserID)
);

create table practice.movies(
MovieID int Primary key NOT NULL,
MovieTitle varchar(50) NULL,
MovieCategoryID int NULL,
RentalRatePerDay int NULL,
FOREIGN KEY(MovieCategoryID) references practice.category(CategoryID)
);

create table practice.category(
categoryID int primary key NOT NULL,
categoryName varchar(50) NULL
);

create table practice.rentals(
rentalID int primary key NOT NULL,
UserID int ,
MovieID int,
RentalStartDate date,
RentalEndDate date,
FOREIGN KEY(UserID) references practice.users(UserID),
FOREIGN KEY(MovieID) references practice.movies(MovieID)
);

Drop Table practice.category;
Drop Table practice.movies;
Drop Table practice.users;
Drop Table practice.rentals;


insert into practice.users values
(1,'bob','bob@gmail.com','2012-01-01'),
(2,'Tom','tom@gmail.com','2012-02-01'),
(3,'Alice','alice@gmail.com','2011-06-01'),
(4,'Jim','Jim@gmail.com','2011-06-01');

insert into category values 
(1,'Horror')
,(2,'Comedy')
,(3,'Animated')
,(4,'Action');

Insert into movies
values
(1,'MI-I',4,3.3),
(2,'MI-II',4,4.3),
(3,'MI-III',4,5),
(4,'horton hears a who',3,5.0),
(5,'sherk-2',3,5.0);

Insert into movies values (6,'xyz',null,10);

Insert into rentals values (1,1,1,'2012-06-01','2012-10-01');
Insert into rentals values (2,1,1,'2013-07-02','2013-10-02');
Insert into rentals values (3,1,2,'2012-08-03','2013-12-02');
Insert into rentals values (4,2,3,'2013-09-04','2013-09-04');
Insert into rentals values (5,3,1,'2012-07-01','2012-11-01');
Insert into rentals values (6,3,5,'2012-8-02','2012-02-21');
Insert into rentals values (7,3,6,'2012-2-8','2012-2-21');

select * from movies;
select * from users;
select * from category;
select * from rentals; 
