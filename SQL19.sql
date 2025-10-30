-- tcl (transaction control language)
-- transaction - logical statement 
-- control / manage 

create database testing12;
use testing12;
create table xyz(id int, name varchar(20));
insert into xyz values(11,'aman'),(12,'user');
select * from xyz;
start transaction;
insert into xyz values(99,'tushar');
commit;
start transaction;
set sql_safe_updates = 0;-- safe mode disable
delete from xyz;
insert into xyz values(1001,'adfsafds');
select * from xyz;
rollback; -- revert the transaction
select * from xyz;



start transaction;
insert into xyz values(100234,'adfsaf');
select * from xyz;

create table yash123(id int);

start transaction;
update xyz set name="adsad";
savepoint tusahr_savpoint;
insert into xyz values(12399,'tasfajktushar');
rollback to tusahr_savpoint;
select * from xyz;





-- transaction 
/* 
transaction start 
ddl,dml 
transaction end 

1) autocommint => disable / write (start transaction)
2)
3) end (commit; rollback; ddl statement dcl statement)
*/

WITH RECURSIVE cte AS (
  SELECT emp.employeeid, emp.employeename, emp.employeename AS managerchain
  FROM employees emp
  WHERE emp.managerid IS NULL
  UNION ALL
  SELECT emp.employeeid, emp.employeename, CONCAT(cte.managerchain, '->', emp.employeename) AS managerchain
  FROM employees emp
    JOIN cte ON emp.managerid = cte.employeeid
)
SELECT * FROM cte;


