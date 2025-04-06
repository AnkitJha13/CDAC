create database practiceProcedures;

use practiceProcedures;


CREATE TABLE emp (
  empno decimal(4,0) NOT NULL,
  ename varchar(10) default NULL,
  job varchar(9) default NULL,
  mgr decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(7,2) default NULL,
  comm decimal(7,2) default NULL,
  deptno decimal(2,0) default NULL
);


CREATE TABLE dept (
  deptno decimal(2,0) default NULL,
  dname varchar(14) default NULL,
  loc varchar(13) default NULL
);


INSERT INTO emp VALUES 
('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20'),
('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30'),
('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30'),
('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20'),
('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30'),
('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30'),
('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10'),
 ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20'),
('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10'),
('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30'),
('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20'),
('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30'),
('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20'),
('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');



INSERT INTO dept VALUES 
('10','ACCOUNTING','NEW YORK'),
('20','RESEARCH','DALLAS'),
('30','SALES','CHICAGO'),
('40','OPERATIONS','BOSTON');


select * from emp;

select * from dept;



-- Retrieve Employee Details by Department
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_id INT)
BEGIN
    SELECT * 
	FROM emp
    WHERE deptno = dept_id;
END //
DELIMITER ;

Call GetEmployeesByDept(10);



-- Insert New Employee Record
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





-- Delete Employees by Experience (not working)
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




-- Generate Employee Count Report
DELIMITER //
CREATE PROCEDURE EmployeeCountReport()
BEGIN
    SELECT deptno, COUNT(*) AS employee_count
    FROM emp
    GROUP BY deptno;
END //
DELIMITER ;

CALL EmployeeCountReport();





-- Retrieve Employee Count by Department
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






-- Calculate Total Salary in a Department
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





-- Find Maximum Salary in a Department
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

-- to drop a procedure 
DROP PROCEDURE IF EXISTS UpdateSalaryByPercentage; 





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



