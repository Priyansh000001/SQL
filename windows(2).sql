create database window_test;

use window_test;

CREATE TABLE employee_sales (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

-- 2. Insert at least 20 sample records
INSERT INTO employee_sales (emp_name, department, sale_amount, sale_date) VALUES
('Alice', 'Electronics', 1200.00, '2025-01-10'),
('Bob', 'Electronics', 950.00, '2025-01-12'),
('Charlie', 'Furniture', 2100.00, '2025-01-15'),
('David', 'Furniture', 1800.00, '2025-01-18'),
('Ella', 'Clothing', 400.00, '2025-01-20'),
('Frank', 'Clothing', 750.00, '2025-01-22'),
('Grace', 'Clothing', 600.00, '2025-01-23'),
('Henry', 'Electronics', 1300.00, '2025-01-24'),
('Isabella', 'Furniture', 2500.00, '2025-01-25'),
('Jack', 'Clothing', 900.00, '2025-01-26'),
('Karen', 'Electronics', 1450.00, '2025-01-28'),
('Leo', 'Furniture', 1900.00, '2025-01-29'),
('Mona', 'Clothing', 500.00, '2025-01-30'),
('Nate', 'Electronics', 1600.00, '2025-02-01'),
('Olivia', 'Clothing', 800.00, '2025-02-02'),
('Peter', 'Furniture', 1700.00, '2025-02-03'),
('Quinn', 'Electronics', 1250.00, '2025-02-04'),
('Rose', 'Clothing', 1000.00, '2025-02-05'),
('Steve', 'Furniture', 2200.00, '2025-02-06'),
('Tina', 'Electronics', 1800.00, '2025-02-07');


select * from employee_sales;

select *, sum(sale_amount) over(partition by Department) from employee_sales;

select *, sum(sale_amount) over(order by emp_name) from employee_sales;

select *, sum(sale_amount) over(order by Department) from employee_sales;

select *, sum(sale_amount) over(partition by Department order by sale_amount) from employee_sales;

select *, sum(sale_amount) over(partition by Department order by sale_amount),
row_number() over(partition by department) from employee_sales;

select *,row_number() over(partition by department),
rank() over(order by sale_date) from employee_sales;

select *,row_number() over(partition by department),
rank() over(order by sale_amount) from employee_sales;

update employee_sales set sale_amount=500 where emp_id=7;

select * from employee_sales;

select *,row_number() over(partition by department),
rank() over(partition by department order by sale_amount) from employee_sales;