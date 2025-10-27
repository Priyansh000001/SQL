-- ddl and dml statements alterd
-- DDL : Data definaton language 
-- language : data defination ,table 

-- creat 
use regex1;
create table t4(id int);-- create statment -- ddl operation 

-- drop 
drop table t4; -- data and table structure both are deleted (we can't undo)

create table t5(id int);

desc t5; 
-- ddl (table structure is change)
alter table t5 add column name varchar(20);

desc t5; 

-- ddl (select,group by ,joins,subquery)
alter table t5 drop column id;

select * from t5;
alter table t5 add column eid int primary key;
desc t5; 


-- DML ( insert, update, delete, marge)
insert into t5 values('yash',11),('aman',12);

set sql_safe_updates = 0 ; 
update t5 set name='tushar';-- without condition (all rows are update 
select * from t5;

update t5 set name = 'regex' where eid=11; -- update on condition ( use this method)
select * from t5;

-- delect 
-- delete from t5 
delete from t5 where eid=12; -- this can undone ( we can undo it)
select * from t5;

-- truncate (DDL) -- drop struchure + recreate the structure 
truncate t5;
select * from t5;

-- DDL (create, drop, alter ,truncate) 
-- DML : insert,update,delete, maarge(mysql support nhi krta) 



-- 1. Create table having name 'emall'
create table t7 (email varchar(50));
-- 2. Add a column named 'roll_no' BEFORE the email column
alter table t7 add column roll_no int first;
-- 3. Add a primary key to roll_no and a unique key to email
alter table t7 add primary key (roll_no),add unique (email);
-- 4. Insert two rows into both columns
insert into t7 (roll_no, email) values(1, 'student1@example.com'),(2, 'student2@example.com');
-- 5. Add new column 'phone_no' with data type VARCHAR
alter table t7 add column phone_no varchar(15);
-- 6. Update one phone number having a character
update t7 set phone_no = '98A7654321' where roll_no = 1;
update t7 set phone_no = '98A7654321 abc' where roll_no = 2;
-- 7. Try to change number datatype from VARCHAR to INT
alter table t7 modify column phone_no int;
select * from t7;

--  windows functions 
--  windows functions vs group by functions
-- over() in windows functions

-- group by revision 