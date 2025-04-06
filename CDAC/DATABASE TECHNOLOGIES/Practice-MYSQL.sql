-- Create Database
CREATE DATABASE practiceCompany;
USE practiceCompany;

-- Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(100)
);

-- Employee Table with DOB and DOJ for extra views
CREATE TABLE Employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(100) NOT NULL,
    DOB DATE,
    DOJ DATE,
    age INT CHECK (age >= 18 AND age <= 60),
    email VARCHAR(100) UNIQUE,
    dept_id INT,
    salary DECIMAL(10,2) DEFAULT 30000,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE
);

-- Insert Department Data
INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'HR', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Finance', 'Chicago'),
(4, 'Marketing', 'Los Angeles');

-- Insert Employee Data
INSERT INTO Employee (empid, empname, DOB, DOJ, age, email, dept_id, salary) VALUES
(1, 'John Doe', '2000-05-15', '2020-07-01', 25, 'john@example.com', 2, 50000),
(2, 'Jane Smith', '1995-03-10', '2015-01-15', 30, 'jane@example.com', 1, 45000),
(3, 'Emily Davis', '1997-08-25', '2018-10-01', 28, 'emily@example.com', 3, 47000),
(4, 'Michael Brown', '1990-11-20', '2010-06-05', 35, 'michael@example.com', 4, 42000),
(5, 'Chris Green', '1999-01-05', '2022-09-01', 23, 'chris@example.com', NULL, NULL); -- No department

-- View All Data
SELECT * FROM Department;
SELECT * FROM Employee;



-- Rename Table
ALTER TABLE Employee RENAME TO EmployeeDetails;



-- Delete an Employee
DELETE FROM EmployeeDetails WHERE empid = 4;


-- Delete a Department (Cascade Deletes Employees)
DELETE FROM Department WHERE dept_id = 3;


-- Change Column Name and Data Type
ALTER TABLE Department CHANGE COLUMN location dept_location VARCHAR(150);


-- Add New Column
ALTER TABLE EmployeeDetails ADD phone_number VARCHAR(15);


-- Remove a Column
ALTER TABLE EmployeeDetails DROP COLUMN phone_number;


-- Update Data
UPDATE EmployeeDetails
SET empname = 'Athena Warrior'
WHERE empid = 2;


-- Modify Data Type
ALTER TABLE EmployeeDetails MODIFY age DECIMAL(10,0);


-- Select Data
SELECT * FROM EmployeeDetails;
SELECT * FROM Department;



-- INNER JOIN
SELECT e.empid, e.empname, d.dept_name, d.dept_location
FROM EmployeeDetails e
INNER JOIN Department d ON e.dept_id = d.dept_id;


-- LEFT JOIN
SELECT e.empid, e.empname, d.dept_name, d.dept_location
FROM EmployeeDetails e
LEFT JOIN Department d ON e.dept_id = d.dept_id;


-- RIGHT JOIN
SELECT e.empid, e.empname, d.dept_name, d.dept_location
FROM EmployeeDetails e
RIGHT JOIN Department d ON e.dept_id = d.dept_id;


-- FULL OUTER JOIN using UNION
SELECT e.empid, e.empname, d.dept_name, d.dept_location
FROM EmployeeDetails e
LEFT JOIN Department d ON e.dept_id = d.dept_id
UNION
SELECT e.empid, e.empname, d.dept_name, d.dept_location
FROM EmployeeDetails e
RIGHT JOIN Department d ON e.dept_id = d.dept_id;



-- CROSS JOIN
SELECT e.empname, d.dept_name
FROM EmployeeDetails e
CROSS JOIN Department d;


-- View: Basic Info
CREATE OR REPLACE VIEW employee_basic AS
SELECT empid, empname, age
FROM EmployeeDetails;

SELECT * FROM employee_basic;


-- View: Employee Age Calculated from DOB
CREATE OR REPLACE VIEW employee_age AS
SELECT empid, empname, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS age
FROM EmployeeDetails;

SELECT * FROM employee_age;



-- View: Employee Experience from DOJ
CREATE OR REPLACE VIEW employee_exp_View AS
SELECT empid, empname, TIMESTAMPDIFF(YEAR, DOJ, CURDATE()) AS experience_years
FROM EmployeeDetails;

SELECT * FROM employee_exp_View;



-- Copy Table Structure without Data
CREATE TABLE dept_structure_only LIKE Department;

select * from dept_structure_only;


-- Copy Table with Data
CREATE TABLE dept_full_copy AS SELECT * FROM Department;

select * from dept_full_copy;
