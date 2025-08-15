-- Step 1: Create and use the database
CREATE DATABASE day1;
USE day1;

-- Step 2: Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    HireDate DATE
);

-- Step 3: Create Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Step 4: Insert records into Departments
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');

-- Step 5: Insert records into Employees
INSERT INTO Employees (EmpID, EmpName, DeptID, Salary, HireDate) VALUES
(101, 'John', 1, 50000, '2018-02-12'),
(102, 'Alice', 2, 60000, '2019-07-10'),
(103, 'Bob', 1, 55000, '2020-05-05'),
(104, 'Carol', 3, 45000, '2017-09-20');
-- 1. Display all records from Employees table
SELECT * FROM Employees;

-- 2. Display only EmpName and Salary of all employees
SELECT EmpName, Salary FROM Employees;

-- 3. Find all employees from IT department
SELECT EmpName
FROM Employees
WHERE DeptID = (SELECT DeptID FROM Departments WHERE DeptName = 'IT');

-- 4. Employees whose salary > 50000
SELECT * FROM Employees WHERE Salary > 50000;

-- 5. Employees hired before 2020-01-01
SELECT * FROM Employees WHERE HireDate < '2020-01-01';

-- 6. Employees in descending order of salary
SELECT * FROM Employees ORDER BY Salary DESC;

-- 7. Count total employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- 8. Average salary of all employees
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- 9. Maximum salary in each department
SELECT DeptID, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY DeptID;

-- 10. Departments having more than 1 employee
SELECT DeptID, COUNT(*) AS EmpCount
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 1;
