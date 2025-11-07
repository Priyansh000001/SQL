-- use tushar;
-- DELIMITER $$ 
-- create procedure getcustomers1()
-- begin 
-- 	select * from sakila.actor; 
-- end$$ 
-- DELIMITER ;
-- call getcustomers1(); -- procedure  

-- drop procedure getcustomers2;
-- use tushar;
-- DELIMITER //
-- create procedure getcustomers2()
-- begin 
-- 	select * from  sakila.actor where actor_id=2;
-- 	select * from sakila.actor where actor_id=1;
-- end//
-- DELIMITER ;
-- call getcustomers2();

-- drop procedure getp3;
-- DELIMITER //
-- CREATE PROCEDURE getp3(
-- 	IN eid int ,out ename varchar(20)
-- )
-- BEGIN
-- 	SELECT first_name  into ename FROM sakila.actor WHERE actor_id=eid;
-- END //
-- DELIMITER ;
-- call getp3(7, @ename);
-- select @ename;
-- SELECT * FROM sakila.actor WHERE first_name=@ename; 
-- drop procedure getp5;
DELIMITER //
CREATE PROCEDURE getp5(
	INout var int 
)
BEGIN
	SELECT count(*) into var FROM sakila.actor WHERE actor_id<var and actor_id>2;
END //
DELIMITER ;
set @var=9;
call getp5(@var);
select @var 