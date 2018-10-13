/*part 1*/
Select R.UserID , U.Name, Count(MovieID) from rentals R inner join users U on U.UserID = R.UserID
group by UserID 
order by UserID;

/*part 2*/
Select M.MovieTitle, count(R.MovieID) as RentedTimes from rentals R inner join movies M on R.MovieID = M.MovieID
group by R.MovieID
order by RentedTimes Desc
limit 1;

/*part 3*/
Select UPPER(U.Name), count(R.MovieID) as RentedMovies from rentals R 
inner join users U on U.UserID = R.UserID
where Year(R.RentalStartDate) = 2012
group by U.Name;

/*part 4*/
(Select MovieID, MovieTitle from movies) minus   /* Except minus does not work in mysql*/
(select R.MovieID, M.MovieTitle from Rentals inner join movies M on M.MovieID = R.MovieID );

Select MovieTitle from movies
where MovieID not in (select MovieID from rentals);

/*part 5*/
select distinct U.UserID, U.Name, M.MovieTitle, ifnull(C.CategoryName, '-') as CategoryName
from users U inner join rentals R on U.UserID = R.UserID
inner join movies M on R.MovieID = M.MovieID left join  category C on C.categoryID = M.MovieCategoryID
order by U.UserID;

/*part 6*/
Select U.Name, sum(M.RentalRatePerDay * DATEDIFF (R.RentalStartDate , R.RentalEndDate)) 
from users U inner join rentals R on U.UserID = R.UserID 
inner join movies M on M.MovieID = R.MovieID
where U.Name = 'Alice';

/*part 7*/
Select M.MovieTitle, count(R.MovieID) as NoofTimesRented, sum(M.RentalRatePerDay * DATEDIFF (R.RentalEndDate, R.RentalStartDate)) as TotalRent
from movies M inner join rentals R on M.MovieID = R.MovieID 
where M.MovieTitle like '%MI%'
group by MovieTitle;

/*part 8*/
Select C.categoryID,C.categoryName, ifnull(avg(M.RentalRatePerDay), 0)  as Average from category C
left outer join movies M  on M.MovieCategoryID = C.categoryID
group by C.categoryID, C.categoryName;