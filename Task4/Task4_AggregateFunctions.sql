use PlayStoreDB;

#LEVEL 0
select count(*) AS Apps_Count from Apps;
select avg(Rating) AS Average_Rating from Apps;
select max(rating) AS Max_Rating from Apps;
select min(rating) AS Min_Rating from Apps;
select sum(Downloads) AS Downloads_Sum from Apps;
select * from Apps order by Rating desc;

#LEVEL 1
select CategoryID,count(*) AS Apps_Count
from  Apps
group by CategoryID;

select CategoryID,avg(Rating) AS Avg_Rating
from Apps
group by CategoryID;

select max(Price) AS Max_Price,min(Price) AS Min_Price from Apps;

select AppID,AppName,Downloads from Apps order by Downloads desc;

select DeveloperID,count(*) AS Apps_Count from Apps group by DeveloperID;

select CategoryID,count(*) from Apps group by CategoryID HAVING count(*) > 1;

#LEVEL 2

select DeveloperID,sum(Downloads) AS Total_Downloads from Apps group by DeveloperID;

select PublisherID,avg(Rating) AS Avg_Rating from Apps group by PublisherID;

select DeveloperID,count(*) AS Apps_Count from Apps  group by DeveloperID having count(*)>1;

select CategoryID,avg(Rating) AS Avg_Rating from Apps group by CategoryID having avg(rating)>4.3;

select CategoryID,count(*) AS Apps_Count from Apps group by CategoryID order by count(*) desc;

select * from Apps where Rating=(select MAX(Rating) from Apps);

select DeveloperID,sum(Price) AS Total_Price from Apps group by DeveloperID;


select * from Apps;