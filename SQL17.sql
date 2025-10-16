/*
operators
functions. string , date ,numeric.(scaler function)
group by ( operation on same set of rows)
	sum,avg,count
where and having 
normalization:
- 1 nf 
- 2 nf => partial dependency 
	(not - key attribute partially on key value 
    1. a. 50
    1. a. 60 
    
1.a. 			1.50
			1.60
join 
- extract 
join .where condition+conditino 
inner join. using 
left join 
right join 



natural 
	cross join 
    
cross => cartesian join 


self join 
eid,name,managerid 


table join table2 join table3
where table.condition=table2.condition and table2.codot= table3.conditin 


table join table2. on. condition 
join table3. on condition 

--subquery 
-- price original (max price)

-- inner query return 1 row 
>,<,<=,>=

multi row subquery 
in = any 
>any, <any 


>all,<all 

exists 
-----------------------------------
are tha row in depend 
tha sub q is excuest at fast 
sub are run in 1 time tha resels are campoare on outer corey 
core sub where is depend on outer querey 
sub qure is excukit bass on outer result 

*/
use REGEXDB;
select * from orders;



-- data types 
-- numeric.=>tinint,smallint,medium, int, digint

create table tushar1(id tinyint);# id tinyint unsigned
insert into tushar1 values(10),(-9);
insert into tushar1 values(-127); #- 128 to 127 (1byte) 2**8
select * from tushar1;
-- smallint. 2 byte 
create table tushar2(id float, id2 double); 
insert into tushar2 values(10.12345678,10.123456789);
select * from tushar2;

create table tushar3(id2 double(5,2)); 
insert into tushar3 values(10.12345678);
insert into tushar3 values(170.123456789);
insert into tushar3 values(1067.123456789);
select * from tushar3;
-- string char
create table tushar4(gender char(5)); -- It occupies the spaces upto 5. (Fix Size Character)
insert into tushar4 values('abc');
insert into tushar4 values('abcrf');
insert into tushar4 values('abcwqdew');-- error
select * from tushar4;
select gender,char_length(gender) from tushar4;

-- verchar 
create table tushar5(gender varchar(5));
insert into tushar5 values('abc');
insert into tushar5 values('abe           ');
select gender,char_length(gender) from tushar5;


-- datetime
create table tushar6 (OrderID int,CustomerName varchar(100),OrderDate datetime);
insert into tushar6 values(1, 'Alice', '2025-10-16 09:45:22');
select * from tushar6;

