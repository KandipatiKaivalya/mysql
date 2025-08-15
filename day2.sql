-- Create a database
create database day2;
use day2;

-- Create Employees table
create table employees(
    empid int primary key,
    empname varchar(50),
    deptid int,
    salary int,
    hiredate date
);

-- Create Departments table
create table departments(
    deptid int primary key,
    deptname varchar(50)
);

-- Insert some data into Departments
insert into departments values
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');

-- Insert data into Employees
insert into employees values
(101, 'John', 1, 50000, '2018-02-12'),
(102, 'Alice', 2, 60000, '2019-07-10'),
(103, 'Bob', 1, 55000, '2020-05-05'),
(104, 'Carol', 3, 45000, '2017-09-20');

-- --------------------------
-- Queries (11 to 15)
-- --------------------------

-- 11. Employees whose names start with 'A'
select * from employees
where empname like 'A%';

-- 12. Employees with salary between 45000 and 60000
select * from employees
where salary between 45000 and 60000;

-- 13. Show department name of each employee
select e.empname, d.deptname
from employees e
join departments d on e.deptid = d.deptid;

-- 14. Number of employees in each department
select deptid, count(*) as empcount
from employees
group by deptid;

-- 15. All employees including those without department
select e.empname, d.deptname
from employees e
left join departments d on e.deptid = d.deptid;
