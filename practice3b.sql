/*part 1*/
Select FBU.UserID, FBU.UserName, SA.SchoolName from fb_users FBU 
inner join school_attended SA on FBU.UserID = SA.UserID
where SchoolName = 'MIT';

/*part 2*/
Select P.PostID, P.Content, count(L.PostID) as MostLiked from likes L 
inner join posts P on P.PostID = L.PostID
group by L.PostID
order by MostLiked Desc
Limit 1; /* Top 1*/

/*part 3*/
Select FBU.UserID, FBU.UserName, P.Content, count(L.PostID) as MostLiked from fb_users FBU 
inner join friends fr on FBU.UserID = fr.FriendID
left join posts P on fr.FriendshipID = P.FriendshipID
left join Likes L on P.PostID = L.PostID;

select UserName
from FB_USERS U inner join Likes L on U.UserID=L.UserID
Group by UserName
Order by COUNT(U.UserID) Desc
LIMIT 1;

/*part 4*/
Select UserName, F.Location from fb_users F
inner join (Select Location from fb_users group by Location order by count(Location)desc limit 1) as I
on F.Location = I.Location
group by UserName;

/*part 5*/
Select U.UserID, U.UserName from fb_users U 
inner join(Select UserID from friends h1 inner join 
				(Select FriendID from friends fr inner join fb_users fb 
                 on fr.FriendID = fb.UserID 
				 where month(fb.DOB) = '10' ) 
                 as h2 on h1.FriendID = h2.FriendID)
			as F on F.UserID = U.UserID
group by Username
order by U.UserID;

/*part 6*/
Select UserID, UserName from fb_users U 
inner join(select FriendID as FriendsofFriends from friends F inner join
				(Select FriendID as FriendsofBob  from friends BF inner join
					(Select UserID as BobID from fb_users where UserName = 'Bob') as Bob
					on Bob.BobID = BF.UserID) as Bobsfriends
				on Bobsfriends.FriendsofBOb = F.UserID) as FOF
			on FOF.FriendsofFriends = U.UserID
order by U.UserID;

/*part 7*/
Select Inr.UID, Inr.frend, Inr.ScN from school_attended  sa
inner join(Select FBU.UserID as UID, FriendID as frend, FBU.SN as ScN from friends F 
		inner join (Select UserID, SchoolName as SN from school_attended
					where SchoolName != 'MIT') as FBU
					on FBU.UserID = F.UserID) as Inr
		on sa.SchoolName = Inr.ScN
where sa.UserID = Inr.UID and sa.SchoolName = Inr.ScN and Inr.frend = 
(Select ss.UserID from school_attended ss where ss.UserID!= Inr.UID and ss.UserID = Inr.frend and ss.SchoolName = sa.SchoolName) ;
        





