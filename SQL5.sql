use sakila;
select first_name , substr(first_name,2,3) from actor;
select concat("Mr. ", first_name," ", last_name) from actor;
select concat_ws(" ", "Mr.",first_name,last_name) from actor;
select first_name, locate('E',first_name,5) from actor;
select first_name, substr(first_name,3,2) from actor;
select first_name, replace(first_name,'E','-') from actor;
select char_length("  hey  "), char_length(trim("  hey  "));
select char_length(ltrim("   hey  "));  -- remove only starting spaces 
select char_length(rtrim("   hey  "));  -- remove only ending spaces 

-- scaler function --> apply on 1 row --> return 1 row
-- multi row functions category --> apply on multiple rows and return 1 or more rows as output
-- aggregate functions : function, perform calculation over the rows --> min, max, sum, count

select count(amount), sum(amount), avg(amount) from payment;

select count(amount) as Count, sum(amount) as Sum, avg(amount) as Avrage from payment where customer_id = 1;

-- group : collection of similar values
-- 

select customer_id, count(amount), sum(amount), avg(amount)
from payment
group by customer_id;

-- get the total no. of customer serve by staff id 1
select count(customer_id) from payment where staff_id = 1;
-- get the total amount and the avg amount spend by customer id 5
select sum(amount), avg(amount) from payment where customer_id = 5;
-- get the total amount spend and the maximum amount spend in the month of may
select sum(amount), max(amount) from payment where month(payment_date) = 5;
-- get the no. of transactions and the avg transaction amount done for each month 
select monthname(payment_date),count(amount), avg(amount) from payment group by monthname(payment_date);

select round(67.34,-1), round(67.34,-2), round(67.36,1), round(67.67,2);
select truncate(67.37,1);
select floor(4.676), ceil(4.676);

-- string function, number functions
-- date function
-- get the data from the date

select curdate(),curtime(),current_timestamp(),now();
select now(), adddate(now(),20);  -- pass the value as a column and how many days you wants to add using in adddate function
select adddate(now(),interval 2 hour);   -- for add hours
select adddate(now(),interval 1 year);	 -- for add year
select adddate(now(),interval 2 minute); -- for add minute
select adddate(now(),interval -20 minute); -- for remove minute also by using negative sign
select month(now()), weekofyear(now()), weekday(now());
select now(), extract(month from now());   -- for get the value of month year etc by using extract function 
select now(), date_format(now(),'year is %Y month is %M'), date_format(now(),'year is %y month is %m');

-- where clause, operator like, in, between 
-- and or not
-- function, string function, number, date(scaler functions)
-- aggregate functions (multi row functions) max, min, average, sum

-- group by --> you can select that perticulate column which is used in group by 
select count(amount) from payment where amount = 2.99;
select amount, count(amount) from payment 
group by amount;

select staff_id, sum(amount), count(staff_id) from payment group by staff_id;
select customer_id, sum(amount) from payment group by customer_id;
-- where can not be use with agregate funtion
-- where clause need to be conditions data is already persent in table
select customer_id, sum(amount) from payment group by customer_id having sum(amount) > 100;

select customer_id, sum(amount) from payment 
where month(payment_date) = 6
group by customer_id 
having sum(amount) >= 50;

select customer_id, amount, count(amount) from payment group by customer_id, amount;
select customer_id, monthname(payment_date), count(amount) from payment group by customer_id, monthname(payment_date);
-- get the average amount spended in each month by staff
select month(payment_date), staff_id, avg(amount) from payment
group by month(payment_date),staff_id
order by month(payment_date);