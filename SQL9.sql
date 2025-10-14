use sakila;
show tables;
select * from actor;


-- view --> its a virtual table that use for store other tables data without changing other table data

create view t1 as 
(select first_name, last_name from actor);

insert into t1 values("Rohit","Singh");
select * from actor;
select * from t1;

-- CTAS --> creaTE TABLE AS SELECT

create table t2 as 
(select first_name, last_name from actor);

insert into t2 values("Rohit","Singh");
select * from t2;

drop table t2;


-- Non updatable view --> these are created by help of aggregate function, distinct, group by, having, union or union all and using subquery

-- Tempory table --> that table is using only for current time if we wants to use after restart workbench sql then we dont find thats table

create temporary table xyz as
(select actor_id, first_name from actor);
select * from xyz;