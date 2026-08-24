CREATE DATABASE PlayStoreDB;
USE PlayStoreDB;
CREATE TABLE Developers(DeveloperID INT PRIMARY KEY,DeveloperName VARCHAR(60) NOT NULL,Country VARCHAR(30),FoundedYear INT);
INSERT INTO Developers(DeveloperID,DeveloperName,Country,FoundedYear) VALUES (101,"Google LLC","USA",1998),(102,"MetaPlatforms","USA",2004),(103,"Spaotify AB","Sweden",2006),(104,"Canva Pty Ltd","Australia",2012),(105,"BYJU's","India",2011);
SELECT * FROM Developers;

CREATE TABLE PUBLISHERS(PublisherID INT PRIMARY KEY,PublisherName VARCHAR(60),HeadOffice VARCHAR(40),SupportEmail VARCHAR(60));
INSERT INTO PUBLISHERS(PublisherID,PublisherName,HeadOffice,SupportEmail) VALUES (201,"Google Play","Clafornia","support@google.com"),(202,"Samsung galaxy Store","Seoul","support@samsung.com"),(203,"Huawei AppGallery","Shenzhen","support@hauwei.com"),(204,"Amazon Appstore","Seattle","support@amazon");
SELECT * FROM PUBLISHERS;

CREATE TABLE Categories(CategoryID INT PRIMARY KEY,CategoryName VARCHAR(40),MinimumAge INT);
INSERT INTO Categories(CategoryID,CategoryName,MinimumAge) VALUES (301,"Education",3),(302,"Productivity",3),(303,"Music",12),(304,"Social",13),(305,"Gaming",16);
SELECT * FROM Categories;

CREATE TABLE Apps(AppID INT PRIMARY KEY,AppName VARCHAR(60),DeveloperID INT,PublisherID INT,CategoryID INT,Rating DECIMAL(2,1),Downloads INT,Price DECIMAL(6,2));
INSERT INTO Apps(AppID,AppName,DeveloperID,PublisherID,CategoryID,Rating,Downloads,Price) VALUES (1001,"Google Classroom",101,201,301,4.6,500000000,0),
(1002,"Google Keep",101,201,302,4.5,1000000000,0),
(1003,"Instagram",102,201,304,4.4,500000000,0),
(1004,"Spotify",103,201,303,4.5,100000000,0),
(1005,"canva",104,201,302,4.7,50000000,90),
(1006,"BYJUS",105,201,301,4.3,100000000,199),
(1007,"Candy Crush",102,204,305,4.6,100000000,0),
(1008,"Temple Run",104,203,305,4.2,500000000,0);
SELECT * FROM Apps;

INSERT INTO Developers() VALUES (106,"OpenAI","USA",2015);
SELECT * FROM Developers;
INSERT INTO Categories() VALUES (306,"Artificial Intelligence",12);
SELECT * FROM Categories;
INSERT INTO Apps() VALUES (1009,"ChatGPT",102,201,302,4.5,8000000,0);
SELECT * FROM Apps;
UPDATE Apps 
SET Rating=4.5
WHERE AppID=1008;
SELECT * FROM Apps;

DELETE FROM Developers
WHERE DeveloperID=105;
SELECT * FROM Developers;

UPDATE Publishers
SET SupportEmail="support@Galaxy.com"
WHERE PublisherID=202;

INSERT INTO Apps() VALUES (1010,"NoteBookLLM",102,202,305,4.3,50000000,0),(1011,"Gemini",104,203,303,4.6,6000000,0);
SELECT * FROM Apps;

UPDATE Apps
SET Price=199
WHERE AppID=1006;

DELETE FROM Categories
WHERE CategoryID=303;

SELECT * FROM Developers;
SELECT * FROM Apps;
SELECT * FROM Categories;
SELECT * FROM Publishers;