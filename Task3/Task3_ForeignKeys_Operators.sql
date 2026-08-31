use PlayStoreDB;
select * from Apps;
select * from Developers;
insert into Developers() values (105,"Byju's","India",2011);
insert into Categories() values (303,"Music",12);
#LEVEL 0


alter table Apps
add constraint fkey1
foreign key (DeveloperID)
references Developers(DeveloperID);

alter table Apps
add constraint fkey2
foreign key (CategoryID)
references Categories(CategoryID);

alter table Apps
add constraint fkey3
foreign key (PublisherID)
references Publishers(PublisherID);

select * from Apps
where Rating>4.5;

select * from Apps
where price=0;

select * from Apps where CategoryID=305;

#LEVEL 1
select * from Apps where Downloads>500000000;

select * from Apps where Rating>4.3 and Rating<4.7;

select * from Apps where Price in (0,299);

select * from Apps where AppName LIKE 'G%';

select * from Apps where AppName like "%Google%";

select * from Apps where Rating>4.0 and Downloads>500000000;

select * from Apps where CategoryID=301 or CategoryID=305;

#LEVEL 2
select * from Apps where AppName not like "G%";

select * from Apps where Rating<4.5 or Downloads>1000000000;

select * from Developers where DeveloperName like "%a%";

select * from Apps where Price between 0 and 300;

select * from Apps where PublisherID=201 or PublisherID=204;

insert into Apps(AppID,AppName,DeveloperID) values (1012,"DubverseAI",109);

select * from Developers;

select * from Apps where not CategoryID=305;

