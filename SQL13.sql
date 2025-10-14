use sakila;
select *, if(amount<5,'low salary','high salary') as category from payment;
select *, case
when amount<=3 then 'low'
when amount>3 and amount<=6 then 'medium' 
else 'high' end as category
from payment;

select st_id, student_name, marks, case 
when marks <= 33 then 'C'
when marks <= 60 then 'B'
else 'A' end as 'Grades' from student;

select film_id from inventory group by film_id having count(film_id)>=6;