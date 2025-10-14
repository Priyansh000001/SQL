use sakila;
create table sales(
sale_id int primary key,
product_name varchar(50) not null,
region varchar(50) not null,
quantity int,
price_per_unit decimal(10,2),
sale_date date
);

select * from sales;

select region,sum(quantity) from sales where sum(quantity) < (select region,sum(quantity) from sales group by region having max(sum(quantity)));

select region, sum(quantity) from sales group by region having max(sum(quantity));

select region,sum(quantity) as total from sales group by region
having total = (select max(t) from (select sum(quantity) as t from sales group by region) as derived 
where t<(select max(t) from (select sum(quantity) as t from sales group by region) as derived1));

select first_name, address_id from customer where address_id <= (select avg(address_id) from customer);

select first_name, address_id from customer
where address_id <= (select avg(address_id) from customer where address_id<=10);

select * from address;
select first_name, address_id,(select address from address where customer.address_id = address.address_id) as address
from customer;