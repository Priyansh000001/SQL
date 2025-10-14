use regex;

-- char
create table test1(char1 char(5));
insert into test1 values('Mohit');
insert into test1 values('Mohit ');
select char1, length(char1) from test1;
drop table test1;

-- NOTE -->
-- > in char the last whitespaces are truncated
-- > but in varchar it is truncated upto to the size of characters defined

-- varchar
create table test3(varchar1 varchar(5));
insert into test3 values('Mohit ');  -- given warninng but run code successfully
insert into test3 values('Mohit singh');  -- error
select varchar1, length(varchar1) from test3;
drop table test3;

-- date
create table test1(dob date);
insert into test1 values(curdate());
insert into test1 values('2026-03-30'); -- yyyy-mm-dd
insert into test1 values('2026-13-03'); -- incurrect
select * from test1;
drop table test1;

-- timestamp
create table test2( dob timestamp);
insert into test2 values (curdate());  
insert into test2 values (now());
select * from test2;
drop table test2;

-- how to store the image in rdbms system --> running assignment --> blob

-- double --> its store the max size value as compair to the float
create table test1(salary double(5,2));
insert into test1 values (843948984938.43434343);
insert into test1 values (23.323);
insert into test1 values (233.323); -- total 5 digit 3 before point and after point - 2 so given error
insert into test1 values (2332.33); -- given error bcz allow only 3 digit before point
insert into test1 values (2332); -- given error bcz allow only 3 digit before point
select * from test1;
drop table test1;

create table test1(salary float);
insert into test1 values (843948984938.43434343);
select * from test1;  -- given '843949000000' that output bcz cross its length than using 000000 like this only given 6 digit
drop table test1;