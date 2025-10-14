use sakila;
select * from customer; 
select * from payment;

select customer.first_name, sum(payment.amount) from payment inner join customer on payment.customer_id = customer.customer_id group by payment.customer_id;
select e1.customer_id,e1.first_name, e1.address_id, e2.first_name, e2.address_id from customer as e1 inner join customer as e2 on (e1.address_id = e2.address_id and e1.customer_id < e2.customer_id) group by  e1.customer_id,e1.first_name, e1.address_id, e2.address_id, e2.first_name;

select first_name from customer where address_id = (select max(address_id) from customer);

-- find the customer who is having second highest address id

select concat(first_name,' ',last_name) as full_name, address_id from customer 
where address_id = (select max(address_id) from customer 
where address_id < (select max(address_id) from customer));