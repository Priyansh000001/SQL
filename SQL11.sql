show databases;
use sakila;
select * from customer;
select * from customer where store_id in (1,2);
select * from customer where customer_id between 1 and 5;
select sum(active) as total from customer;
select abs(-2) as absolute;
select * from actor;
select concat(first_name, ' ', last_name) as full_name from actor;
select ceil(3.4) as cc;
select floor(3.4) as cc;
select power(2,4) as po;
select left('mohit',2) as filter;
select mod(100,9) as result;
select locate('h','mohit') as position;
select length('mohit singh shekhawat') as len;
select substr('mohit singh shekhawat',7,10) as substring;
select substr(first_name,locate('A',first_name)+1,3) as word from customer;
select trim('mohit     singh  ') as kjk;
select ltrim('   mohit     singh  ') as kjk;
select rtrim('    mohit     singh  ') as kjk;
select replace('mohit singh', 'i', '_') as replacement;
select reverse('mohit singh') as reverse_name;


-- order by
select * from customer order by first_name asc;
select * from customer order by first_name desc;
select * from customer order by customer_id desc limit 1 offset 1;

select * from customer order by customer_id desc limit 3 offset 0;