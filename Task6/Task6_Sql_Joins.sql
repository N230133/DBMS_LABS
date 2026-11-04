use PlayStoreDB;
#LEVEL 0
select A.AppName,D.DeveloperName
 from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID;
 
 select A.AppName,P.PublisherName
 from Apps A inner join Publishers P on A.PublisherID=P.PublisherID limit 7;
 
 select A.AppName,C.CategoryName
 from Apps A inner join Categories C on A.CategoryID=C.CategoryID limit 4;
 
 select A.AppName,D.DeveloperName,P.PublisherName
 from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID 
 inner join Publishers P on A.PublisherID=P.PublisherID limit 4;
 
 select P.PublisherName,A.AppName from Publishers P left join Apps A on P.PublisherID=A.PublisherID;

 select C.CategoryName,A.AppName from Categories C left join Apps A on C.CategoryID=A.CategoryID;
 
 #LEVEL 1
 select P.PublisherID,A.AppName from Publishers P right join Apps A  on P.PublisherID=A.PublisherID;
 select C.CategoryName,A.AppName from categories C left join Apps A on C.CategoryID=A.CategoryID;
 select A.AppName,D.DeveloperName,D.Country from Apps A  join Developers D on A.DeveloperID=D.DeveloperID;
 select A.AppName,D.DeveloperName,P.PublisherName,C.CategoryName 
 from Apps A join Developers D on A.DeveloperID=D.DeveloperID join Publishers P on A.PublisherID=P.PublisherID 
 join Categories C on A.CategoryID=C.CategoryID;
 
 select A.AppName,D.DeveloperName,D.Country from Apps A join Developers D
 on A.DeveloperID=D.DeveloperID where D.Country="USA";
 
 select A.AppName,P.PublisherName from Apps A join Publishers P on A.PublisherID=P.PublisherID 
 join Categories C on A.CategoryID=C.CategoryID where CategoryName="Gaming";
 
select A.AppID,D.DeveloperName from Apps A join Developers D on A.DeveloperID=D.DeveloperID where A.Rating>4.5;

#LEVEL 2
select * from Publishers P left join Apps A on P.PublisherID=A.PublisherID;

select * from Publishers P left join Apps A on P.PublisherID=A.PublisherID where A.AppID is null;

select A.AppName,C.CategoryName from Apps A left join Categories C on A.CategoryID=C.CategoryID order by C.CategoryName;

select A.AppName,D.DeveloperName,P.PublisherName,C.CategoryName,A.Rating from Apps A inner join Developers D 
on A.DeveloperID=D.DeveloperID inner join Publishers P on A.PublisherID=P.PublisherID inner join 
Categories C on A.CategoryID=C.CategoryID;

select A.AppName from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID inner join Publishers P on
A.PublisherID=P.PublisherID where D.Country="USA" and P.PublisherName="Google Play";

select D.DeveloperName from Developers D left join Apps A on D.DeveloperID=A.DeveloperID
where A.DeveloperID is null;

select D.DeveloperName,C.DeveloperName,D.Country from Developers D inner join Developers C 
on D.Country=C.Country
and D.DeveloperID<C.DeveloperID;

select P.PublisherName,C.CategoryName from Publishers P cross join Categories C;

select P.PublisherName,A.AppName from Publishers P left join Apps A  on P.PublisherID=A.PublisherID
union 
select P.PublisherName,A.AppName from Publishers P right join Apps A on P.PublisherID=A.PublisherID;
