-- constraints 
/* 
constraints are ruls and regulation whith don't allow ivalid data enter in the table 
-- not null 

*/

CREATE DATABASE REGEXDB;
USE REGXDB;
CREATE TABLE TEST(ID INT );
INSERT INTO TEST VALUES (10),(11),(10),(NULL);
SELECT COUNT(*), COUNT(ID) FROM TEST;

CREATE TABLE TEST2(ID INT NOT NULL);
INSERT INTO TEST2 VALUES(10),(11),(10);
INSERT INTO TEST2 VALUES(NULL),(12); -- THIS WILL GIVE ERROR 

CREATE TABLE TEST3(ID INT UNIQUE);
INSERT INTO TEST3 VALUES(10),(11),(10); -- DUPLICATE VALUES 


CREATE TABLE TEST4(ID INT, GENDER VARCHAR(20));
INSERT INTO TEST4(ID,gender) VALUES(10);
SELECT * FROM TEST4;

CREATE TABLE TEST5(ID INT, GENDER VARCHAR(20) DEFAULT 'MALE'); -- DEFAULT
INSERT INTO TEST5(ID,gender) VALUES(10);
SELECT * FROM TEST5;

CREATE TABLE TEST6(ID INT check (ID>5),GENDER VARCHAR(20));-- CHECK
insert into test6(id,gender) value(10,'male');
insert into test6(id,gender) value(11,'transgender'); -- this will give error 
select * from test6;


CREATE TABLE TEST7(ID INT check (ID>5),GENDER VARCHAR(20) check (gender in ('male','femal')));-- CHECK
insert into test7(id,gender) value(10,'male');
insert into test7(id,gender) value(11,'transgender'); -- this will give error 
select * from test7;


CREATE TABLE TEST8(ID INT check (ID>5),GENDER VARCHAR(20) 
constraint db_test_gender_chk check (gender in ('male','femal'))); -- check
insert into test8(id,gender) value(10,'male');
insert into test8(id,gender) value(11,'transgender'); -- this will give error 
select * from test8;

CREATE TABLE TEST9 (ID INT PRIMARY KEY,GENDER VARCHAR(20));
insert into test9(id,gender) value(10,'male');
select * from test9;

-- 
CREATE table product(pip int primary key , pname varchar(20));
insert into product values(101,'iphone');
insert into product values(102,'ipad');
select * from product; 
-- with foreign key 
CREATE table order2( order_id int ,price int ,pid int ,foreign key (pid) references product(pid));
insert into order2 value(1981,200,101),(1982,250,102),(1983,275,101);
insert into order2 value(1984, 500, 108);
select * from order2;

-- without foregin key (every data will be inserted independent from product table 
create table orders( order_id int , price int, pid int );
insert into orders value(1981,200,101),(1982,250,102),(1983,275,101);
select * from orders;
 
-- Question => Create 2 table employees(employee_id as primary, employee_name, email as unique, department_id) and
-- Department(department_id as unique, department_name on check constraint department should be Biology and Physics,
-- in the department table try to insert the null value in the department_id column)
-- Create Department table without UNIQUE constraint on department_id
create table Department (department_id int,department_name varchar(50),constraint chk_department_name check (department_name in ('Biology', 'Physics')));
insert into Department (department_id, department_name) value (null, 'Biology');
create table Employees (employee_id int primary key,employee_name varchar(100),email varchar(100),department_id int);
