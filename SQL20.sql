/* 
MySQL views are virtual tables defined by a stored SELECT query. They do not store data themselves 
but rather present a dynamic view of data retrieved from one or more underlying base tables. Views offer several benefits in database management:

 Views simplify complex queries 
 Views can restrict access to specific columns or rows of data
 Views provide a consistent representation of data to applications and users
 Complex and frequently used queries can be stored as views
*/
use sakila;
SELECT first_name, film_id FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id;

-- complex query view
create view v_actor as 
SELECT first_name, film_id FROM actor JOIN film_actor ON actor.actor_id = film_actor.actor_id;

select * from v_actor;
-- view for specific column (securty)
create view v_first as 
select first_name from actor;

select * from v_first;


-- ctas (create table as select)
create table yash110
select * from actor where actor_id between 2 and 5;

select * from yash110;
create view v_yash -- updatable
as select actor_id , first_name from yash110;

select * from v_yash;
set sql_safe_updates= 0; 
update v_yash set first_name="xyz";
select * from yash110;
 

-- index 
/*
In SQL, an index is a specialized lookup table or data structure associated with a table or view that significantly improves 
the speed of data retrieval operations. It works by providing a quick lookup mechanism for specific columns, similar to an index in a book.
Instead of scanning an entire table row by row (a full-table scan) to find specific data, the database 
can use the index to directly locate the required rows, which is especially beneficial for large tables. 
*/
drop table students;
create table students(
student_id int, name varchar(50),
age int
);

insert into students (student_id,name,age) values 
(3,'alice',20),
(1, 'bob',22),
(5,'charlie',19),
(3,'deav',21),
(4,'evi',23);

explain select * from student where student_id=2;-- use of index 
explain select * from student where student_id=3 and name = 'alice';-- no index use 
explain select * from student where name='alice'; -- no index use 
create index inx_student_c on students(student_id,name);-- index created (non-clustured index)
select indexes from students;
select * from students;
