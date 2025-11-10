use sakila;
-- delimiter //
-- create procedure p6(in var int)
-- begin 
-- 	tushar: LOOP
--     -- select actor_id from sakila.actor where actor_id<var
--     set var=var+1;
--     -- select * from actor where actor_id=var;
--     select @var;
--     if var =14 then 
-- 		leave tushar;
-- 	end if;
--     
--     end loop;
--     
-- end//

-- delimiter //
-- create procedure p6(in var int)
-- begin 
-- 	tushar: LOOP
--     -- select actor_id from sakila.actor where actor_id<var
--     set var=var+1;
--     select * from actor where actor_id=5;
--     
--     if var =14 then 
-- 		leave tushar;
-- 	end if;
--     
--     end loop;
--     
-- end//

-- what are tha curser 
-- tha curser is a pointer relirals for tha morey lokichin where the output data store 
-- 3 cyele name is open fach close 


-- curser are 2 type implicil , explicit

-- delimiter //
-- -- procedure is created 
-- CREATE procedure create_email_last ( in eid int,
-- 	out email_list Text 
-- )
-- begin 
-- 	-- variable to caccess value from cursor to plaql
--     declare done bool default false;
--     declare email_address varchar(100) default"";

-- 	-- declare cursor form employees email 
--     declare cur cursor for select first_name from sakila.actor where 
--     actor_id<eid;
--     -- handler to see cursor have all the elements 
--     declare continue handler
-- 		for not found set done = true;
-- 	-- open the cursor 
--     open cur;
-- set email_list ='';
-- 	process_email:loop 
-- 		-- cur will first row and we insert it into the email_address variable
--         fetch cur into email_address;
--         if done = true then 
-- 			leave process_email;
-- 		end if;
-- 		-- concatenate the email into the emaillist 
--         set email_list= concat(email_address,"-", email_list);
-- 		--  aman-aditya-tushar-yash-abhishek 
-- 	end loop;
--     -- close the cursor
--     close cur;
-- end//

-- delimiter ; 
 
-- delimiter //
-- create procedure p8()
-- begin 
-- 	select *  from your_table
--     where amount <10;
--     end;
-- end// 
-- delimiter ; 

DROP PROCEDURE IF EXISTS create_payment;
DELIMITER $$
 CREATE PROCEDURE create_payment (
OUT amount_list TEXT
)
BEGIN
	DECLARE v_amount DECIMAL (5,2);
	DECLARE done INT DEFAULT 0;
	DECLARE cur CURSOR FOR
	SELECT amount FROM sakila.payment WHERE payment_id < 10;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	-- initialize OUT param
	SET amount_list = '';
	OPEN cur;
	read_loop: LOOP
		FETCH cur INTO v_amount;
	FETCH cur INTO v_amount;
	IF done = 1 THEN
	LEAVE read_Loop;
	END IF;
    END LOOP;
CLOSE cur;
END$$
