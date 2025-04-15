-- Create Database
CREATE DATABASE practiceCompany;
USE practiceCompany;

-- Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(100)
);



-- Employee Table
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





-- to drop the tables completely
DROP TABLE Employee;
DROP TABLE Department;



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




-- If missed adding Primary and Foreign keys
-- Add Primary Key to Department
alter table department 
add primary key(dept_id);

-- Add Foreign Key to Employee
ALTER TABLE Employee 
ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE;




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









----------------------------- ASSIGNMENT SQL --------------------------------------------------------

-----------------------------------------------------------------------------------------------------



create database sqlPractice;
use sqlPractice;



create table dept
(
    deptcode varchar(15) primary key, 
    deptname varchar(60), 
    budget integer
);

create table grade
(
    gradecode varchar(15), 
    gradelevel varchar(30), 
    gradedescription varchar(60),
    basic integer,
    primary key (gradecode, gradelevel)
);

create table desig
(
    desigcode varchar(15) primary key,
    designame varchar(15)
);


-- Employee Table
CREATE TABLE emp (
    empcode VARCHAR(15) PRIMARY KEY,
    empname VARCHAR(60),
    deptcode VARCHAR(15),
    birthdate DATE NOT NULL,
    joindate DATE NOT NULL,
    sex CHAR(1) CHECK (sex IN ('M', 'F', 'T')),
    desigcode VARCHAR(15),
    supcode VARCHAR(15),
    gradecode VARCHAR(15),
    gradelevel VARCHAR(30),
    basicpay INTEGER,
    FOREIGN KEY (deptcode) REFERENCES dept(deptcode),
    FOREIGN KEY (desigcode) REFERENCES desig(desigcode),
    FOREIGN KEY (supcode) REFERENCES emp(empcode),
    FOREIGN KEY (gradecode, gradelevel) REFERENCES grade(gradecode, gradelevel)
);


CREATE TABLE salary (
    empcode VARCHAR(15),
    salmonth DATE NOT NULL,
    basic INTEGER,
    allow INTEGER,
    deduct INTEGER,
    PRIMARY KEY (empcode, salmonth),
    FOREIGN KEY (empcode) REFERENCES emp(empcode) 
);



-- History Table
CREATE TABLE history (
    empcode VARCHAR(15),
    changedate DATE NOT NULL,
    desigcode VARCHAR(15),
    gradecode VARCHAR(15),
    gradelevel VARCHAR(30),
    basicpay INTEGER,
    PRIMARY KEY (empcode, changedate, desigcode, gradecode, gradelevel),
    FOREIGN KEY (empcode) REFERENCES emp(empcode) ,
    FOREIGN KEY (desigcode) REFERENCES desig(desigcode),
    FOREIGN KEY (gradecode, gradelevel) REFERENCES grade(gradecode, gradelevel)
);








insert into dept values
('ACCT', 'Accounts', 19),
('PRCH', 'Purchase', 25),
('SALE', 'Sales', 39),
('STOR', 'Stores', 33),
('FACL', 'Facilities', 42),
('PERS', 'Personal', 12); 


insert into grade values
('GC1',  'GL1', 'GC-GL-1',   25000),
('GC4',  'GL1', 'GC-4-GL-1', 21000),
('GC4',  'GL4', 'GC-4-GL-4', 15000),
('GC6',  'GL1', 'GC-6-GL-1', 13000),
('GC6',  'GL2', 'GC-6-GL-2', 11000),
('GC12', 'GL1', 'GC-12-GL-1', 9000),
('GC12', 'GL2', 'GC-12-GL-2', 8500),
('GC12', 'GL3', 'GC-12-GL-3', 8000),
('GC15', 'GL1', 'GC-15-GL-1', 7000),
('GC15', 'GL2', 'GC-15-GL-2', 6500),
('GC15', 'GL3', 'GC-15-GL-3', 6000),
('GC20', 'GL1', 'GC-20-GL-1', 3500),
('GC20', 'GL2', 'GC-20-GL-2', 3000),
('GC20', 'GL3', 'GC-20-GL-3', 2500),
('GC20', 'GL4', 'GC-20-GL-4', 2000);


insert into desig values 
('CLRK', 'Clerk'),
('SLMN', 'Sales Man'),
('MNGR', 'Manager'),
('SPRV', 'Supervisor'),
('PRES', 'Personal'); 






insert into emp values
('7839', 'Reddy',  'ACCT', '1959-12-12', '1981-07-17', 'M', 'PRES',  null,  'GC1', 'GL1', 32000),
('7566', 'Jain',   'PRCH', '1955-01-24', '1981-04-02', 'F', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7698', 'Murthy', 'SALE', '1960-09-16', '1981-05-01', 'F', 'MNGR', '7839', 'GC6', 'GL1', 14700),
('7782', 'Menon',  'ACCT', '1967-08-30', '1981-06-09','M', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7902', 'Naik',   'PRCH', '1958-02-20', '1981-12-03', 'M', 'MNGR', '7839', 'GC6', 'GL2', 11800),
('7654', 'Gupta', 'SALE', '1957-01-22', '1981-09-28', 'M', 'SLMN', '7698', 'GC6', 'GL2', 12600),
('7521', 'Wilson', 'STOR', '1956-03-18', '1981-02-22', 'M', 'MNGR', '7698', 'GC6', 'GL2', 12200),
('7844', 'Singh',  'SALE', '1956-09-09', '1981-09-08', 'F', 'SLMN', '7698', 'GC6', 'GL1', 14300),
('7900', 'Shroff', 'SALE', '1956-06-28', '1981-12-03', 'M', 'CLRK', '7698', 'GC6', 'GL2', 12000),
('7788', 'Khan', 'PRCH', '1957-02-03', '1982-12-09', 'M', 'SPRV', '7566', 'GC6', 'GL2', 11900),
('7499', 'Roy', 'SALE', '1957-09-27', '1981-02-20', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7934', 'Kaul',   'ACCT', '1957-05-02', '1982-01-23', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11950),
('7369', 'Shah',   'PRCH', '1960-05-25','1983-12-17', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12200),
('7876', 'Patil',  'PRCH', '1965-09-02', '1990-12-17', 'M', 'CLRK', '7788', 'GC6', 'GL2', 12300),
('7999', 'Sinha',  'SALE', '1970-04-11', '1992-02-20', 'M', 'SLMN', '7782', 'GC6', 'GL1', 14600),
('7939', 'Rai',    'PRCH', '1988-08-10', '2012-12-06', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11800),
('7192', 'John',   'ACCT', '1968-11-05', '1994-12-03', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12300),
('9902', 'Ahmad',  'SALE', '1970-02-16', '1992-04-17', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7802', 'Sanghvi','STOR', '1980-05-06', '1993-01-01', 'M', 'MNGR', '7566', 'GC6', 'GL2', 12400),
('6569', 'Tiwari', 'STOR', '1989-08-19', '2010-08-21', 'M', 'MNGR', '7782', 'GC6', 'GL2', 12400); 



insert into salary values
('7839', '2011-12-01', 30000, 3000, 1200),
('7839', '2012-01-01', 32000, 3200, 1250),
('7839', '2012-02-01', 32000, 3200, 1250),
('7566', '2011-12-01', 12000, 600,   400),
('7566', '2012-01-01', 12400, 1240,  550),
('7566', '2012-02-01', 12400, 1240,  550),
('7698', '2011-12-01', 13900, 800,   500),
('7698', '2012-01-01', 14700, 1470,  650),
('7698', '2012-02-01', 14700, 1470,  650),
('7782', '2011-12-01', 11800, 600,   500),
('7782', '2012-01-01', 12400, 1240,  550),
('7782', '2012-02-01', 12400, 1240,  550),
('7902', '2011-12-01', 11200, 600,   450),
('7902', '2012-01-01', 11800, 1180,  550),
('7902', '2012-02-01', 11800, 1180,  550),
('7654', '2011-12-01', 11900, 700,   500),
('7654', '2012-01-01', 12600, 1260,  550),
('7654', '2012-02-01', 12600, 1260,  550),
('7521', '2011-12-01', 11400,  800,  500),
('7521', '2012-01-01', 12200, 1220,  550),
('7521', '2012-02-01', 12200, 1220,  550),
('7844', '2011-12-01', 13400,  900,  600),
('7844', '2012-01-01', 14300, 1430,  650),
('7844', '2012-02-01', 14300, 1430,  650),
('7900', '2011-12-01', 11500,  500,  300),
('7900', '2012-01-01', 12000, 1200,  550),
('7900', '2012-02-01', 12000, 1200,  550),
('7788', '2011-12-01', 11300,  600,  450),
('7788', '2012-01-01', 11900, 1190,  550),
('7788', '2012-02-01', 11900, 1190,  550),
('7499', '2011-12-01', 13400,  800,  550),
('7499', '2012-01-01', 14200, 1420,  650),
('7499', '2012-02-01', 14200, 1420,  650),
('7934', '2011-12-01', 11450,  500,  250),
('7934', '2012-01-01', 11950, 1195,  550),
('7934', '2012-02-01', 11950, 1195,  550),
('7369', '2011-12-01', 11600,  600,  450),
('7369', '2012-01-01', 12200, 1220,  550),
('7369', '2012-02-01', 12200, 1220,  550),
('7876', '2011-12-01', 11700,  600,  500),
('7876', '2012-01-01', 12300, 1230,  550),
('7876', '2012-02-01', 12300, 1230,  550),
('7999', '2011-12-01', 13950,  650,  600),
('7999', '2012-01-01', 14600, 1460,  650),
('7999', '2012-02-01', 14600, 1460,  650),
('7939', '2011-12-01', 11100,  700,  400),
('7939', '2012-01-01', 11800, 1180,  550),
('7939', '2012-02-01', 11800, 1180,  550),
('7192', '2011-12-01', 11700,  600,  500),
('7192', '2012-01-01', 12300, 1230,  550),
('7192', '2012-02-01', 12300, 1230,  550),
('9902', '2011-12-01', 13400,  800,  500),
('9902', '2012-01-01', 14200, 1420,  650),
('9902', '2012-02-01', 14200, 1420,  650),
('7802', '2011-12-01',  11900,  500,  300),
('7802', '2012-01-01',  12400, 1240,  550),
('7802', '2012-02-01',  12400, 1240,  550),
('6569', '2011-12-01', 11800,  600,  400),
('6569', '2012-01-01', 12400, 1240,  550),
('6569', '2012-02-01', 12400, 1240,  550); 




insert into history values
( '7839', '1981-09-17',  'CLRK', 'GC15','GL1',  7000),
( '7839', '1985-12-31',  'SLMN', 'GC12','GL3',  8000),
( '7839', '1988-12-31',  'SPRV', 'GC12','GL2',  8500),
( '7839', '1990-12-31',  'MNGR', 'GC12','GL1',  9000),
( '7839', '1994-12-31',  'CLRK', 'GC6', 'GL2', 11000),
( '7839', '1998-12-31',  'SLMN', 'GC6', 'GL1', 13000),
( '7839', '2001-12-31',  'SPRV', 'GC4', 'GL4', 15000),
( '7839', '2006-12-31',  'MNGR', 'GC4', 'GL1', 21000),
( '7839', '2011-12-31',  'PRES', 'GC1', 'GL1', 25000),
( '7566', '1981-04-02',  'CLRK', 'GC12','GL3',  8000),
( '7566', '1991-12-31',  'SLMN', 'GC12','GL2',  8500),
( '7566', '2001-12-31',  'SPRV', 'GC12','GL1',  9000),
( '7566', '2011-12-31',  'MNGR', 'GC6', 'GL2', 11000),
( '7698', '1981-05-01',  'CLRK', 'GC12','GL3',  8000),
( '7698', '1991-05-01',  'SLMN', 'GC12','GL2',  8500),
( '7698', '2001-05-01',  'MNGR', 'GC12','GL1',  9000),
( '7698', '2006-05-01',  'SPRV', 'GC6', 'GL2', 11000),
( '7698', '2011-05-01',  'MNGR', 'GC6', 'GL1', 13000),
( '7782', '1981-06-09',  'CLRK', 'GC12','GL3',  8000),
( '7782', '1991-06-09',  'SLMN', 'GC12','GL2',  8500),
( '7782', '2001-06-09',  'SPRV', 'GC12','GL1',  9000),
( '7782', '2011-06-09',  'MNGR', 'GC6', 'GL2', 11000),
( '7902', '1981-12-03',  'CLRK', 'GC12','GL3',  8000),
( '7902', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),
( '7902', '2001-12-03',  'SPRV', 'GC12','GL1',  9000),
( '7902', '2011-12-03',  'MNGR', 'GC6', 'GL2', 11000),
( '7654', '1981-09-28',  'SLMN', 'GC12','GL3',  8000),
( '7654', '1991-09-28',  'SLMN', 'GC12','GL2',  8500),
( '7654', '2001-09-28',  'SLMN', 'GC12','GL1',  9000),
( '7654', '2011-09-28',  'SLMN', 'GC6', 'GL2', 11000),
( '7521', '1981-02-22',  'CLRK', 'GC12','GL3',  8000),
( '7521', '1991-02-22',  'SLMN', 'GC12','GL2',  8500),
( '7521', '2001-02-22',  'SPRV', 'GC12','GL1',  9000),
( '7521', '2011-02-22',  'MNGR', 'GC6', 'GL2', 11000),
( '7844', '1981-09-08',  'SLMN', 'GC12','GL3',  8000),
( '7844', '1991-09-08',  'SLMN', 'GC12','GL2',  8500),
( '7844', '2001-09-08',  'SLMN', 'GC12','GL1',  9000),
( '7844', '2006-09-08',  'SLMN', 'GC6', 'GL2', 11000),
( '7844', '2011-09-08',  'SLMN', 'GC6', 'GL1', 13000),
( '7900', '1981-12-03',  'SLMN', 'GC12','GL3',  8000),
( '7900', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),
( '7900', '2001-12-03',  'CLRK', 'GC12','GL1',  9000),
( '7900', '2011-12-03',  'CLRK', 'GC6', 'GL2', 11000),
( '7788', '1982-12-09',  'SLMN', 'GC12','GL3',  8000),
( '7788', '1992-12-09',  'CLRK', 'GC12','GL2',  8500),
( '7788', '2002-12-09',  'MNGR', 'GC12','GL1',  9000),
( '7788', '2012-12-09',  'SPRV', 'GC6', 'GL2', 11000),
( '7499', '1981-02-20',  'SLMN', 'GC12','GL3',  8000),
( '7499', '1991-02-20',  'SLMN', 'GC12','GL2',  8500),
( '7499', '2001-02-20',  'SLMN', 'GC12','GL1',  9000),
( '7499', '2006-02-20',  'SLMN', 'GC6', 'GL2', 11000),
( '7499', '2011-02-20',  'SLMN', 'GC6', 'GL1', 13000),
( '7934', '1982-01-23',  'SLMN', 'GC12','GL3',  8000),
( '7934', '1992-01-23',  'SLMN', 'GC12','GL2',  8500),
( '7934', '2002-01-23',  'CLRK', 'GC12','GL1',  9000),
( '7934', '2012-01-23',  'CLRK', 'GC6', 'GL2', 11000),
( '7369', '1983-12-17',  'SLMN', 'GC12','GL3',  8000),
( '7369', '1993-12-17',  'SLMN', 'GC12','GL2',  8500),
( '7369', '2003-12-17',  'CLRK', 'GC12','GL1',  9000),
( '7369', '2006-12-17',  'CLRK', 'GC6', 'GL2', 11000);





-- View All Data
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM grade;
SELECT * FROM desig;
SELECT * FROM salary;
SELECT * FROM history;





-- List the name, employee code and designation name of each employee
SELECT e.empname, e.empcode, d.designame
FROM emp e
JOIN desig d ON e.desigcode = d.desigcode;



-- List all the departments and the budgets
SELECT deptname, budget
FROM dept;



-- List the employees and their respective department names
SELECT e.empname, d.deptname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode;


-- List the employees who are not having any superior to work under 
SELECT empname
FROM emp
WHERE supcode IS NULL;


-- List the employees who are working directly under the superior most employee of the office
SELECT e.empname
FROM emp e
WHERE e.supcode = (
    SELECT empcode
    FROM emp
    WHERE supcode IS NULL
);


-- List the employee(s) who is senior most in the office
SELECT empname
FROM emp
WHERE joindate = (SELECT MIN(joindate) FROM emp);


-- List the employees who will retire from the office next
SELECT empname, birthdate, DATE_ADD(birthdate, INTERVAL 60 YEAR) AS retirement_date
FROM emp
WHERE DATE_ADD(birthdate, INTERVAL 60 YEAR) = (
    SELECT MIN(DATE_ADD(birthdate, INTERVAL 60 YEAR))
    FROM emp
);



-- List the departments with the respective department managers
SELECT d.deptname, e.empname AS manager
FROM dept d
JOIN emp e ON d.deptcode = e.deptcode
WHERE e.supcode IS NULL;


-- List the number of employees working for either ‘accounts’ or ‘personal’ or ‘purchase’ departments
SELECT COUNT(*)
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE LOWER(d.deptname) IN ('accounts', 'personal', 'purchase');



--  List the employees working for ‘accounts’ or ‘personal’ department
SELECT e.empname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE LOWER(d.deptname) IN ('accounts', 'personal');


-- List the employees working for ‘accounts’ and ‘personal’ department
SELECT e.empname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE d.deptname IN ('accounts', 'personal')
GROUP BY e.empname
HAVING COUNT(DISTINCT d.deptname) = 2;


-- List the employees working for ‘accounts’ but not for ‘personal’ department
SELECT e.empname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE d.deptname = 'accounts'
AND e.empcode NOT IN (
    SELECT empcode
    FROM emp e2
    JOIN dept d2 ON e2.deptcode = d2.deptcode
    WHERE d2.deptname = 'personal'
);



--  List the youngest employee of the office
SELECT empname
FROM emp
WHERE birthdate = (SELECT MAX(birthdate) FROM emp);


-- List the employees who are drawing basic pay not equal to 12400
SELECT empname
FROM emp
WHERE basicpay != 12400;


-- List the employees who are drawing basic salary between 11000 and 12000
SELECT empname
FROM emp
WHERE basicpay BETWEEN 11000 AND 12000;


-- List the employees who are drawing basic salary not between 11000 and 12000
SELECT empname
FROM emp
WHERE basicpay NOT BETWEEN 11000 AND 12000;



-- List the employees who got salary allowance between Rs.1000 to Rs.1500 in the month of January 2012
SELECT e.empname
FROM salary s
JOIN emp e ON s.empcode = e.empcode
WHERE s.salmonth = '2012-01-01'
AND s.allow BETWEEN 1000 AND 1500;



-- List the employees whose name ends with ‘i’ or ‘y’
SELECT empname
FROM emp
WHERE empname LIKE '%i' OR empname LIKE '%y';



-- List the employees who have at least 25 years of experience
SELECT empname
FROM emp
WHERE YEAR(CURDATE()) - YEAR(joindate) >= 25;



--  List the ‘Salesmen’ who have minimum 30 to 20 years of experience
SELECT e.empname
FROM emp e
JOIN desig d ON e.desigcode = d.desigcode
WHERE d.designame = 'Salesman'
AND YEAR(CURDATE()) - YEAR(e.joindate) BETWEEN 20 AND 30;



-- List the basic salary and half of the basic salary for each employee
SELECT empname, basicpay, basicpay / 2 AS half_basicpay
FROM emp;



--  List the employees and the latest take-home-pay of each employee
SELECT e.empname, s.basic + s.allow - s.deduct AS takehome_pay
FROM emp e
JOIN salary s ON e.empcode = s.empcode
WHERE s.salmonth = (SELECT MAX(salmonth) FROM salary WHERE empcode = e.empcode);



-- List the employees and the latest take-home-pay of each employee of ‘Accounts’ department
SELECT e.empname, s.basic + s.allow - s.deduct AS takehome_pay
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
JOIN salary s ON e.empcode = s.empcode
WHERE d.deptname = 'Accounts'
AND s.salmonth = (SELECT MAX(salmonth) FROM salary WHERE empcode = e.empcode);




-- List employees and their respective ages
SELECT empname, TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM emp;





--  List all the ‘Accounts’ department employees, first ordered by their age and then by their names
SELECT e.empname, TIMESTAMPDIFF(YEAR, e.birthdate, CURDATE()) AS age
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE d.deptname = 'Accounts'
ORDER BY age, e.empname;




-- List the number of employees directly reporting to ‘Reddy’
SELECT COUNT(*) AS num_subordinates
FROM emp
WHERE supcode = (SELECT empcode FROM emp WHERE empname = 'Reddy');



-- List the employees who have at least one person working under him/her and the number of their subordinates.
-- List the employee with the highest number of subordinates first,
-- next the person with the next highest number of subordinates, and so on.

SELECT e.empname, COUNT(e2.empcode) AS num_subordinates
FROM emp e
JOIN emp e2 ON e.empcode = e2.supcode
GROUP BY e.empname
HAVING COUNT(e2.empcode) > 0
ORDER BY num_subordinates DESC;




-- List the employees who have minimum 3 employees working under him/her
SELECT e.empname
FROM emp e
JOIN emp e2 ON e.empcode = e2.supcode
GROUP BY e.empcode
HAVING COUNT(e2.empcode) >= 3;


-- List the minimum and maximum salaries drawn in each grade code
SELECT gradecode, MIN(basicpay) AS min_salary, MAX(basicpay) AS max_salary
FROM emp
GROUP BY gradecode;



-- List the employees with names of their supervisors
SELECT e.empname AS employee, s.empname AS supervisor
FROM emp e
LEFT JOIN emp s ON e.supcode = s.empcode;



-- List the number of officers reporting to each supervisor having more than 3 people working under them
SELECT supcode, COUNT(empcode) AS num_officers
FROM emp
GROUP BY supcode
HAVING COUNT(empcode) > 3;




-- List the employees who have not got any promotion till now
SELECT e.empname
FROM emp e
LEFT JOIN history h ON e.empcode = h.empcode
WHERE h.empcode IS NULL;




-- List the employee with maximum number of promotions. Also list the number of promotions that he/she got
SELECT empcode, COUNT(*) AS num_promotions
FROM history
GROUP BY empcode
ORDER BY num_promotions DESC
LIMIT 1;




-- List the employees who got promoted in the year 1991
SELECT e.empname
FROM history h
JOIN emp e ON h.empcode = e.empcode
WHERE YEAR(h.changedate) = 1991;



-- List the department budget and the total salary drawn (by the employees of this department)
SELECT d.deptname, d.budget, SUM(e.basicpay) AS total_salary
FROM dept d
JOIN emp e ON d.deptcode = e.deptcode
GROUP BY d.deptname, d.budget;



-- Display the employee names in full uppercase
SELECT UPPER(empname) AS empname_upper
FROM emp;



-- List all the employees drawing salary higher than the salary drawn by ‘Jain’
SELECT e.empname
FROM emp e
WHERE e.basicpay > (SELECT basicpay FROM emp WHERE empname = 'Jain');



--  List all the employees who have higher salary than all the employees who draw salary in the range of 11000 to 12000
SELECT e.empname
FROM emp e
WHERE e.basicpay > ALL (SELECT basicpay FROM emp WHERE basicpay BETWEEN 11000 AND 12000);



--  List all the employees who draw greater than the average pay. Display the result in the increasing order of the salary
SELECT empname, basicpay
FROM emp
WHERE basicpay > (SELECT AVG(basicpay) FROM emp)
ORDER BY basicpay ASC;



-- List the employees who draw the highest salary
SELECT e.empname
FROM emp e
WHERE e.basicpay = (SELECT MAX(basicpay) FROM emp);





-- List all the employees other than the employees who draw the highest salary
SELECT e.empname
FROM emp e
WHERE e.basicpay < (SELECT MAX(basicpay) FROM emp);



-- List the employees who draw the highest salary in each department
SELECT e.deptcode, e.empname
FROM emp e
WHERE e.basicpay = (
    SELECT MAX(basicpay)
    FROM emp
    WHERE deptcode = e.deptcode
);


-- List the employee(s) getting second highest salary
Select empname
from emp
order by basicpay DESC
LIMIT 1 OFFSET 1;




-- List the employee(s) who are getting fifth highest salary
Select empname
from emp
order by basicpay DESC
LIMIT 2 OFFSET 4;



-- List the department name of the female employee who draws the highest salary higher than any other female employee
SELECT d.deptname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE e.sex = 'F' AND e.basicpay = (
    SELECT MAX(basicpay)
    FROM emp
    WHERE sex = 'F'
);



-- List all male employees who draw salary greater than at least one female employee
SELECT e.empname
FROM emp e
WHERE e.sex = 'M' AND e.basicpay > ANY (
    SELECT basicpay
    FROM emp
    WHERE sex = 'F'
);




-- List the departments in which the average salary of employees is more than the average salary of the company
SELECT d.deptname
FROM dept d
JOIN emp e ON d.deptcode = e.deptcode
GROUP BY d.deptname
HAVING AVG(e.basicpay) > (SELECT AVG(basicpay) FROM emp);



-- List the employees drawing salary lesser than the average salary of employees working for ‘accounts’ department
SELECT e.empname
FROM emp e
WHERE e.basicpay < (
    SELECT AVG(basicpay)
    FROM emp
    WHERE deptcode = (
        SELECT deptcode
        FROM dept
        WHERE deptname = 'Accounts'
    )
);


