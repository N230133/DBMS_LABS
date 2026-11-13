use PlayStoreDB;


DELIMITER //
CREATE PROCEDURE hello()
BEGIN 
	select 'Hello Welcome to Pl Sql' AS Intro;
END //
DELIMITER ;
CALL hello();



delimiter //
create procedure retrieve(in AID int)
begin
declare A_name varchar(20);
declare A_Rating decimal(2,1);
select AppName,Rating into A_name,A_Rating  from Apps where AppID=AID;

select A_name as 'Name;',A_Rating as 'Rating';
end//
delimiter ;
call retrieve(1004);


#level 0
delimiter \\
create procedure PriceBased(in aid int)
begin 
declare V_Price Decimal(3,1);
select Price*1.10 into V_Price from Apps where AppID=aid;
select V_Price as 'Tax';
end \\
delimiter ;
CALL PriceBased(1004);




delimiter \\
create procedure Details(in ApID int)
begin
declare AN Varchar(100);
declare Ra,Pr Decimal(2,1);
declare Dow int;
select AppName,Rating,Price,Downloads into AN,Ra,Pr,Dow from Apps where AppID=ApID;
select AN as 'Name',Ra as 'Rat', Pr as 'Price', Dow as 'Downloads';
end  \\
delimiter ;
call Details(1002);

delimiter //
create procedure Based_On_rating(in id int)
begin
declare AName varchar(200);
declare rat decimal(2,1);
declare stat varchar(300);
select AppName,Rating into AName,rat from Apps where AppID=id;
 
if rat>=5 Then
	set stat='Highly Rated';
elseif rat>=4 then
	set stat = 'Moderately Rated';
else 
	set stat='Low Rated';
end if;
select AName as 'AppName',stat as 'Status';
end //
delimiter ;
call Based_On_rating(1008);



delimiter //
create function PaidFree( APrice decimal(10,4))
returns varchar(200)
deterministic
begin 
declare ou varchar(200);
	if APrice>0 then 
		set ou='Paid Application';
	else
		set ou='Free Application';
	end if;
    return ou;
end //
delimiter ;
select PaidFree(0);

    
delimiter //
create procedure nums()
begin
declare a int default 1;
declare b int default 10;

count_loop:LOOP
	select a;
    set a=a+1;
    if a=b then 
		leave count_loop;
	end if;
end LOOP count_loop;
end //
delimiter ;
select nums();
#LEVEL 1



DELIMITER //
CREATE PROCEDURE classify_application_rating (
    IN p_app_id INT
)
BEGIN
    DECLARE v_rating DECIMAL(2,1);
    DECLARE v_category VARCHAR(30);

    SELECT Rating INTO v_rating
    FROM Apps
    WHERE AppID = p_app_id;

    IF v_rating >= 4.5 THEN
        SET v_category = 'Excellent Application';
    ELSEIF v_rating >= 4.0 THEN
        SET v_category = 'Good Application';
    ELSEIF v_rating >= 3.5 THEN
        SET v_category = 'Average Application';
    ELSE
        SET v_category = 'Low Rated Application';
    END IF;

    SELECT p_app_id AS AppID, v_rating AS Rating, v_category AS Category;
END //

DELIMITER ;


CALL classify_application_rating(1001);



DELIMITER //

CREATE FUNCTION get_app_rating_fn (
    p_app_id INT
)
RETURNS DECIMAL(2,1)
READS SQL DATA
BEGIN
    DECLARE v_rating DECIMAL(2,1);

    SELECT Rating INTO v_rating
    FROM Apps
    WHERE AppID = p_app_id;

    RETURN v_rating;
END //

DELIMITER ;

-- Query using the function
SELECT AppName, get_app_rating_fn(AppID) AS Rating
FROM Apps;



#LEVEL 2

DELIMITER //

CREATE PROCEDURE review_all_applications()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_name VARCHAR(60);
    DECLARE v_rating DECIMAL(2,1);
    DECLARE v_price DECIMAL(6,2);
    DECLARE v_downloads INT;

    DECLARE app_cursor CURSOR FOR
        SELECT AppName, Rating, Price, Downloads
        FROM Apps;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN app_cursor;

    read_loop: LOOP
        FETCH app_cursor INTO v_name, v_rating, v_price, v_downloads;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT v_name AS AppName, v_rating AS Rating, v_price AS Price, v_downloads AS Downloads;
    END LOOP;

    CLOSE app_cursor;
END //

DELIMITER ;


-- Execution
CALL review_all_applications();

DELIMITER //

CREATE PROCEDURE get_app_details_safe (
    IN p_app_id INT
)
BEGIN
    DECLARE v_not_found INT DEFAULT FALSE;
    DECLARE v_name VARCHAR(60);
    DECLARE v_rating DECIMAL(2,1);
    DECLARE v_price DECIMAL(6,2);

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_not_found = TRUE;

    SELECT AppName, Rating, Price
    INTO v_name, v_rating, v_price
    FROM Apps
    WHERE AppID = p_app_id;

    IF v_not_found THEN
        SELECT 'Application not found' AS Message;
    ELSE
        SELECT v_name AS Application_Name, v_rating AS Rating, v_price AS Price;
    END IF;
END //

DELIMITER ;


-- Execution
CALL get_app_details_safe(1001);
CALL get_app_details_safe(9999);




