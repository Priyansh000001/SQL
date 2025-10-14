CREATE DATABASE REGEX;
USE REGEX;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    gender CHAR(1),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    hire_date DATE
);
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade DECIMAL(4,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(1, 'Alice', 'Roy', '2000-05-12', 'F', 'Delhi'),
(2, 'Bob', 'Khan', '1999-11-23', 'M', 'Mumbai'),
(3, 'Charlie', 'Patel', '2001-03-30', 'M', 'Bangalore'),
(4, 'Diana', 'Singh', '2002-07-08', 'F', 'Mumbai'),
(5, 'Evan', 'Mishra', '2003-01-14', 'M', 'Delhi'),
(6, 'Fiona', 'Das', '2000-12-20', 'F', 'Kolkata'),
(7, 'George', 'Rao', '2002-02-25', 'M', 'Hyderabad'),
(8, 'Hannah', 'Gupta', '2001-06-11', 'F', 'Mumbai'),
(9, 'Ian', 'Verma', '1998-09-17', 'M', 'Delhi'),
(10, 'Jaya', 'Joshi', '2004-04-22', 'F', 'Chennai');

INSERT INTO Courses VALUES
(101, 'Database Systems', 4),
(102, 'Operating Systems', 3),
(103, 'Computer Networks', 4),
(104, 'Software Engineering', 3),
(105, 'Data Structures', 4);
INSERT INTO Instructors VALUES
(1, 'Dr. Anil Mehta', '2015-06-01'),
(2, 'Dr. Neha Jain', '2018-01-15'),
(3, 'Dr. Rakesh Sharma', '2017-09-20');
INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-01-10', 85.5),
(2, 2, 101, '2022-01-10', 78.0),
(3, 3, 102, '2022-01-15', 68.2),
(4, 1, 103, '2022-01-17', 92.0),
(5, 4, 104, '2022-02-10', 73.5),
(6, 5, 105, '2022-02-15', 59.0),
(7, 6, 101, '2022-02-18', 60.2),
(8, 7, 103, '2022-03-01', 88.0),
(9, 8, 102, '2022-03-05', 91.3),
(10, 9, 101, '2022-03-10', 76.0),
(11, 10, 105, '2022-03-20', 45.5),
(12, 2, 105, '2022-04-01', 80.0),
(13, 3, 105, '2022-04-05', 77.5),
(14, 4, 101, '2022-04-10', 83.2),
(15, 5, 103, '2022-04-15', 71.0),
(16, 6, 104, '2022-04-20', 66.0),
(17, 7, 105, '2022-04-25', 74.5),
(18, 8, 101, '2022-05-01', 88.0),
(19, 9, 102, '2022-05-05', 81.0),
(20, 10, 103, '2022-05-10', 69.5);


select * from Students;

select * from Students where gender = 'F' and city <> 'Mumbai' and year(birthdate) > 2000;
select * from Students where first_name like '____a';
select * from Students where birthdate between '2000-03-01' and '2002-02-28';
select length(concat(first_name,last_name)) as name_length from Students;
select concat(first_name,last_name), instr(first_name,'an') from students;
select concat(first_name,last_name) as name, datediff(year,now(),birthdate) as age from Students;
select enrollment_id, student_id, course_id, dayofweek(enrollment_date) as day_is, dayname(enrollment_date) as dayname from Enrollments;
select course_id, avg(grade) from Enrollments group by course_id having count(enrollment_id) > 3;