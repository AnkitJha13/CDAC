create database practiceProcedures;

use practiceProcedures;



-- Create dept table
CREATE TABLE dept (
  deptno DECIMAL(2,0) PRIMARY KEY,
  dname VARCHAR(14),
  loc VARCHAR(13)
);

-- Create emp table
CREATE TABLE emp (
  empno DECIMAL(4,0) PRIMARY KEY,
  ename VARCHAR(10),
  job VARCHAR(9),
  mgr DECIMAL(4,0),
  hiredate DATE,
  sal DECIMAL(7,2),
  comm DECIMAL(7,2),
  deptno DECIMAL(2,0),
  FOREIGN KEY (deptno) REFERENCES dept(deptno)
);


-- Table to log deleted employee data using BEFORE DELETE trigger
CREATE TABLE DeletedEmployees (
  empno INT,
  ename VARCHAR(10),
  deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Table to record salary history using AFTER UPDATE trigger
CREATE TABLE SalaryHistory (
  empno INT,
  old_salary DECIMAL(7,2),
  new_salary DECIMAL(7,2),
  changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Insert sample data
INSERT INTO dept VALUES 
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');



INSERT INTO emp VALUES 
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);



-- ======================================
-- STORED PROCEDURES
-- ======================================

-- Simple procedure to get all employees
DELIMITER //
CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM emp;
END //
DELIMITER ;

CALL GetAllEmployees();




-- Procedure to get employees by department ID (IN parameter)
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_id INT)
BEGIN
    SELECT * 
	FROM emp
    WHERE deptno = dept_id;
END //
DELIMITER ;

Call GetEmployeesByDept(20);





-- Procedure to insert a new employee
DELIMITER //
Create Procedure InsertEmployee(
  In p_empno decimal(4,0), in p_ename varchar(10),  in p_job varchar(9), in p_mgr decimal(4,0), 
  in p_hiredate date, in p_sal decimal(7,2), in p_comm decimal(7,2), in p_deptno decimal(2,0)
)
BEGIN
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (p_empno, p_ename, p_job, p_mgr, p_hiredate, p_sal, p_comm, p_deptno);
END //
DELIMITER ;


Call InsertEmployee(7935, 'ashton', 'analyst', 7821, '1988-07-12', 1200.00, 0, 20);


-- to check new inserted data
select * from emp;




-- Procedure to delete employees with experience less than given years
DELIMITER //
CREATE PROCEDURE DeleteEmployeesByExperience(IN min_exp INT)
BEGIN
    SET SQL_SAFE_UPDATES = 0;
    DELETE FROM emp WHERE TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) < min_exp;
    SET SQL_SAFE_UPDATES = 1;
END //
DELIMITER ;

CALL DeleteEmployeesByExperience(5);

select * from emp;


DROP PROCEDURE IF EXISTS DeleteEmployeesByExperience;





-- Procedure to generate a report of employee count grouped by department
DELIMITER //
CREATE PROCEDURE EmployeeCountReport()
BEGIN
    SELECT deptno, COUNT(*) AS employee_count
    FROM emp
    GROUP BY deptno;
END //
DELIMITER ;

CALL EmployeeCountReport();





-- Procedure using IN and OUT parameters to get employee count by department
DELIMITER //
CREATE PROCEDURE GetEmployeeCount(IN dept_id INT, OUT emp_count INT)
BEGIN
    SELECT COUNT(*) INTO emp_count
    FROM emp
    WHERE deptno = dept_id;
END //
DELIMITER ;


set @emp_count = 0;
call GetEmployeeCount(30, @emp_count);
select @emp_count;





-- Procedure to calculate total salary in a department (IN + OUT)
DELIMITER //
CREATE PROCEDURE GetTotalSalary(IN dept_id INT, OUT total_salary DECIMAL(10,2))
BEGIN
    SELECT SUM(sal) INTO total_salary
    FROM emp
    WHERE deptno = dept_id;
END //
DELIMITER ;


SET @total_salary = 0;
CALL GetTotalSalary(30, @total_salary);
SELECT @total_salary;


DROP PROCEDURE IF EXISTS GetTotalSalary;



-- Procedure to find max salary in a department
DELIMITER //
CREATE PROCEDURE GetMaxSalaryByDept(IN dept_id INT, OUT max_salary DECIMAL(7,2))
BEGIN
    SELECT MAX(sal) INTO max_salary
    FROM emp
    WHERE deptno = dept_id;
END //
DELIMITER ;


SET @max_salary = 0;
CALL GetMaxSalaryByDept(20, @max_salary);
SELECT @max_salary;





-- Update Employee Salary by 10% based on dept id 
DELIMITER //
CREATE PROCEDURE UpdateSalaryByPercentage(IN dept_id INT, IN percent DECIMAL(10,2))
BEGIN
    SET SQL_SAFE_UPDATES = 0;
    UPDATE emp SET sal = sal + (sal * percent / 100) WHERE deptno = dept_id;
    SET SQL_SAFE_UPDATES = 1;
END //
DELIMITER ;

CALL UpdateSalaryByPercentage(20, 10);

select * from emp;







-- Update Employee Salary by 15% based on emp id 
DELIMITER //
CREATE PROCEDURE UpdateSalaryByEmpID(IN p_empid INT, IN p_percent DECIMAL(10,2))
BEGIN
    SET SQL_SAFE_UPDATES = 0;
    UPDATE emp
    SET sal = sal + (sal * p_percent / 100)
    WHERE empno = p_empid;
    SET SQL_SAFE_UPDATES = 1;
END //
DELIMITER ;


CALL UpdateSalaryByEmpID(7369, 15);


select * from emp;





-- Get Employee Details by ID
DELIMITER //
CREATE PROCEDURE GetEmployeeDetailsByID(IN emp_id INT, OUT emp_name VARCHAR(10), OUT emp_salary DECIMAL(7,2))
BEGIN
    SELECT ename, sal INTO emp_name, emp_salary
    FROM emp
    WHERE empno = emp_id;
END //
DELIMITER ;

SET @emp_name = '', @emp_salary = 0;
CALL GetEmployeeDetailsByID(7566, @emp_name, @emp_salary);
SELECT @emp_name, @emp_salary;

select * from emp;





-- Procedure using IF-ELSE to check salary status
DELIMITER //
CREATE PROCEDURE CheckSalaryLevelByEmpID(IN emp_id INT)
BEGIN
    DECLARE salary DECIMAL(10,2);
    SELECT sal INTO salary
    FROM emp
    WHERE empno = emp_id;

    IF salary > 3000 THEN
        SELECT 'High Salary' AS status;
    ELSEIF salary BETWEEN 1500 AND 3000 THEN
        SELECT 'Medium Salary' AS status;
    ELSE
        SELECT 'Low Salary' AS status;
    END IF;
END //
DELIMITER ;

CALL CheckSalaryLevelByEmpID(7566); -- it will display the status for a particular empid



select * from emp;
select * from dept;






-- Procedure using CASE to get department location by ID
DELIMITER //
CREATE PROCEDURE GetDeptLocation(IN dept_id INT)
BEGIN
    CASE dept_id
        WHEN 10 THEN SELECT 'New York' AS location;
        WHEN 20 THEN SELECT 'Dallas' AS location;
        WHEN 30 THEN SELECT 'Chicago' AS location;
        ELSE SELECT 'Unknown Department' AS location;
    END CASE;
END //
DELIMITER ;

CALL GetDeptLocation(10);


DROP PROCEDURE IF EXISTS GetDeptLocation;


-- ======================================
-- TRIGGERS
-- ======================================

-- BEFORE DELETE trigger to log employee data before deletion
DELIMITER //
CREATE TRIGGER before_delete_emp
BEFORE DELETE ON emp
FOR EACH ROW
BEGIN
  INSERT INTO DeletedEmployees(empno, ename)
  VALUES (OLD.empno, OLD.ename);
END //
DELIMITER ;


DELETE FROM emp WHERE empno = 7935;  -- This will insert into DeletedEmployees

select * from emp;

-- deleted data from trigger gets stored in this table 
select * from DeletedEmployees;  




-- AFTER UPDATE trigger to log salary changes
DELIMITER //
CREATE TRIGGER after_update_salary
AFTER UPDATE ON emp
FOR EACH ROW
BEGIN
  IF OLD.sal <> NEW.sal THEN
    INSERT INTO SalaryHistory(empno, old_salary, new_salary)
    VALUES (OLD.empno, OLD.sal, NEW.sal);
  END IF;
END //
DELIMITER ;



-- Update salary of an employee to trigger `after_update_salary`
UPDATE emp SET sal = sal + 100 WHERE empno = 7900; -- This will add a record in SalaryHistory


select * from emp;


-- updated data from trigger gets stored here
SELECT * FROM SalaryHistory;




-- ======================================
-- VIEWS 
-- ======================================

-- View to show employees with high salaries
CREATE OR REPLACE VIEW HighSalaryEmployees AS
SELECT empno, ename, sal, deptno FROM emp WHERE sal > 2500;

SELECT * FROM HighSalaryEmployees;




-- View to show employees with no manager
CREATE OR REPLACE VIEW EmployeesWithoutManager AS
SELECT * FROM emp WHERE mgr IS NULL;


SELECT * FROM EmployeesWithoutManager;



-- ======================================
-- SIMPLE SQL QUERIES 
-- ======================================

-- Total salary grouped by department
SELECT deptno, SUM(sal) AS total_salary
FROM emp
GROUP BY deptno;



-- List employees with experience in years
SELECT empno, ename, TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) AS experience_years
FROM emp;



-- Get department name using employee ID
SELECT e.empno, e.ename, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.empno = 7566;


-- Get highest-paid employee in each department
SELECT deptno, empno, ename, sal
FROM emp e
WHERE sal = (
    SELECT MAX(sal)
    FROM emp
    WHERE deptno = e.deptno
)
ORDER BY deptno;



-- Count employees per department
SELECT deptno, COUNT(*) AS employee_count
FROM emp
GROUP BY deptno;


-- ======================================
-- FUNCTION 
-- ======================================

-- Function: Return Total Salary by Department ID
DELIMITER //
CREATE FUNCTION GetDeptTotalSalary(dept_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(sal) INTO total
    FROM emp
    WHERE deptno = dept_id;
    RETURN total;
END //
DELIMITER ;

-- Example call:
SELECT GetDeptTotalSalary(20) AS total_salary;




-- Function: Get Employee Experience in Years
DELIMITER //
CREATE FUNCTION GetEmployeeExperience(emp_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE years INT;
    SELECT TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) INTO years
    FROM emp
    WHERE empno = emp_id;
    RETURN years;
END //
DELIMITER ;


-- Example call:
SELECT GetEmployeeExperience(7369) AS experience_years;




-- Function: Get Department Name by Employee ID
DELIMITER //
CREATE FUNCTION GetDeptNameByEmpID(emp_id INT)
RETURNS VARCHAR(14)
DETERMINISTIC
BEGIN
    DECLARE dept_name VARCHAR(14);
    SELECT d.dname INTO dept_name
    FROM emp e
    JOIN dept d ON e.deptno = d.deptno
    WHERE e.empno = emp_id;
    RETURN dept_name;
END //
DELIMITER ;


-- Example call:
SELECT GetDeptNameByEmpID(7369) AS department_name;




-- Function: Highest-Paid Employee in a Given Department
DELIMITER //
CREATE FUNCTION GetHighestPaidEmpName(dept_id INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE emp_name VARCHAR(10);
    SELECT ename INTO emp_name
    FROM emp
    WHERE deptno = dept_id
    ORDER BY sal DESC
    LIMIT 1;
    RETURN emp_name;
END //
DELIMITER ;

-- Example call:
SELECT GetHighestPaidEmpName(30) AS top_earner;




-- Function: Count Employees in a Given Department
DELIMITER //
CREATE FUNCTION CountEmployeesInDept(dept_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count
    FROM emp
    WHERE deptno = dept_id;
    RETURN emp_count;
END //
DELIMITER ;


-- Example call:
SELECT CountEmployeesInDept(10) AS total_employees;
