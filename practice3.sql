Create table FB_USERS ( UserID Int Primary Key,
                     likesUserName Varchar(25),
                     DOB Date,
                     Gender Char(1),
                     Location Varchar(50)
                    );
Create table FRIENDS ( FriendshipID Int Primary Key,
                       UserID  Int,
                       FriendID  Int,
                       Foreign Key(UserID) References FB_USERS(UserId),
                       Foreign Key(FriendID) References FB_USERS(UserId)
                      );
Create table POSTS ( PostID Int Primary Key,
                       FriendshipID  Int,
                       Content  Varchar(250),
                       Foreign Key(FriendshipID) References FRIENDS(FriendshipID)
                      );
Create table LIKES ( LikeID Int Primary Key,
                     PostID  Int,
                     UserID  Int,
                     Foreign Key(PostID) References FRIENDS(FriendshipID),
                     Foreign Key(UserID) References FB_USERS(UserId) 
                      );   
Create table SCHOOL_ATTENDED (SchoolID Int Primary Key,
                              UserID Int,
                              SchoolName Varchar(250) ,
                              Foreign Key(UserID) References FB_USERS(UserId)
                              );     
    
                              
INSERT INTO FB_USERS Values (1,'Bob','1998-04-02','M','America');
INSERT INTO FB_USERS Values (2,'Alice','2001-02-03','F','Rome');
INSERT INTO FB_USERS Values (3,'George','1991-12-12','M','China');
INSERT INTO FB_USERS Values (4,'Victoria','1980-05-01','F','France');
INSERT INTO FB_USERS Values (5,'Sim','1995-10-03','M','America');
INSERT INTO FB_USERS Values (6,'Rachael','1987-10-08','F','America');  

INSERT INTO FRIENDS Values (1,1,5);
INSERT INTO FRIENDS Values (2,1,6);
INSERT INTO FRIENDS Values (3,6,5);
INSERT INTO FRIENDS Values (4,3,4);
INSERT INTO FRIENDS Values (5,5,4);
INSERT INTO FRIENDS Values (6,4,2);                        
                          
INSERT INTO POSTS Values (1,1,'Liking the Sunny Mornings');
INSERT INTO POSTS Values (2,1,'Lets meet sometime');
INSERT INTO POSTS Values (3,2,'How are you?');
INSERT INTO POSTS Values (4,3,'Loving the book you suggested');
INSERT INTO POSTS Values (5,4,'How is France?');
INSERT INTO POSTS Values (6,1,'EarthQuake!!!');

INSERT INTO LIKES Values (1,1,1);
INSERT INTO LIKES Values (2,1,5);
INSERT INTO LIKES Values (3,1,6);
INSERT INTO LIKES Values (4,2,2);
INSERT INTO LIKES Values (5,3,1);
INSERT INTO LIKES Values (6,6,1);
INSERT INTO LIKES Values (7,6,6);
INSERT INTO LIKES Values (8,4,3);

INSERT INTO SCHOOL_ATTENDED Values (1,1,'MIT');
INSERT INTO SCHOOL_ATTENDED Values (2,5,'MIT');
INSERT INTO SCHOOL_ATTENDED Values (3,6,'Geargia Tech.');
INSERT INTO SCHOOL_ATTENDED Values (4,3,'Havard');
INSERT INTO SCHOOL_ATTENDED Values (5,4,'Havard');
INSERT INTO SCHOOL_ATTENDED Values (6,2,'Standford');

