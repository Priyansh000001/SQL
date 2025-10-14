use sakila;
select payment.customer_id as orders, customer.first_name from customer inner join payment on payment.customer_id = customer.customer_id 
group by payment.customer_id, customer.first_name having count(payment.customer_id)<=5;
select * from payment;

show tables;

select * from customer left join payment on payment.customer_id = customer.customer_id;