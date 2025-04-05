-- Creating a Database
CREATE DATABASE practiceMySQL;

-- Using the Database
USE practiceMySQL;


-- Creating Course Table with Constraints
CREATE TABLE Course(
    course_id INT PRIMARY KEY,                     -- PRIMARY KEY ensures unique course_id
    course_name VARCHAR(100) NOT NULL,             -- NOT NULL ensures course_name cannot be NULL
    duration_in_years DECIMAL(10,3) CHECK (duration_in_years > 0), -- CHECK ensures only positive values
    course_fee DECIMAL(10,2) DEFAULT 50000,        -- DEFAULT value set for course_fee
    UNIQUE(course_name)                            -- UNIQUE ensures no duplicate course_name
);


-- Creating Students Table with Constraints
CREATE TABLE Students(
    student_id INT PRIMARY KEY,                   -- PRIMARY KEY ensures unique student_id
    student_name VARCHAR(100) NOT NULL,           -- NOT NULL ensures student_name cannot be NULL
    age INT CHECK (age >= 18 AND age <= 60),      -- CHECK ensures age is between 18 and 60
    email VARCHAR(100) UNIQUE,                    -- UNIQUE ensures no duplicate emails
    course_id INT,                                
    FOREIGN KEY(course_id) REFERENCES Course(course_id) ON DELETE CASCADE -- Foreign key with CASCADE
);



-- Inserting Data into Course Table
INSERT INTO Course (course_id, course_name, duration_in_years, course_fee) VALUES
(1, 'Computer Science', 4, 60000),
(2, 'Mechanical Engineering', 4, 55000),
(3, 'Electrical Engineering', 4, 52000),
(4, 'Civil Engineering', 4, 50000),  -- Default fee
(5, 'Business Administration', 3, 48000),
(6, 'Data Science', 2, 60000),
(7, 'Artificial Intelligence', 2, 65000),
(8, 'Cyber Security', 2, 70000);

-- Inserting Data into Students Table
INSERT INTO Students (student_id, student_name, age, email, course_id) VALUES
(1, 'Alice Johnson', 20, 'alice@example.com', 1),
(2, 'Bob Smith', 21, 'bob@example.com', 2),
(3, 'Charlie Brown', 22, 'charlie@example.com', 3),
(4, 'David Wilson', 19, 'david@example.com', 4),
(5, 'Emma Davis', 20, 'emma@example.com', 5),
(6, 'Frank White', 22, 'frank@example.com', 6),
(7, 'Grace Miller', 21, 'grace@example.com', 7),
(8, 'Helen Carter', 23, NULL, NULL); -- Student without email and course for testing joins


-- Selecting Data
SELECT * FROM Course;
SELECT * FROM Students;

-- Renaming Table
ALTER TABLE Students RENAME TO StudentDetails;


-- Deleting a Specific Student
DELETE FROM StudentDetails WHERE student_id = 6;


-- Deleting a Course (Cascade Effect on Students Table)
DELETE FROM Course WHERE course_id = 1;


-- Changing Column Name and Data Type
ALTER TABLE Course CHANGE COLUMN duration_in_years course_duration DECIMAL(10,2);


-- Adding a New Column
ALTER TABLE Course ADD course_email VARCHAR(100);


-- Removing a Column
ALTER TABLE Course DROP COLUMN course_email;


-- Updating a Student Record
UPDATE StudentDetails SET student_name = 'Athena Immortal' WHERE student_id = 3;


-- Modifying Data Type of Age Column
ALTER TABLE StudentDetails MODIFY age DECIMAL(10,0);


-- Selecting Updated Data
SELECT * FROM StudentDetails;
SELECT * FROM Course;



-- INNER JOIN: Matching Records in Both Tables
SELECT s.student_id, s.student_name, s.age, c.course_name, c.course_duration
FROM StudentDetails s
INNER JOIN Course c ON s.course_id = c.course_id;



-- LEFT JOIN: All Students, Even If No Course
SELECT s.student_id, s.student_name, s.age, c.course_name, c.course_duration
FROM StudentDetails s
LEFT JOIN Course c ON s.course_id = c.course_id;



-- RIGHT JOIN: All Courses, Even If No Student Enrolled
SELECT s.student_id, s.student_name, s.age, c.course_name, c.course_duration
FROM StudentDetails s
RIGHT JOIN Course c ON s.course_id = c.course_id;


-- FULL OUTER JOIN: All Students and Courses (Using UNION for MySQL)
SELECT s.student_id, s.student_name, s.age, c.course_name, c.course_duration
FROM StudentDetails s
LEFT JOIN Course c ON s.course_id = c.course_id
UNION
SELECT s.student_id, s.student_name, s.age, c.course_name, c.course_duration
FROM StudentDetails s
RIGHT JOIN Course c ON s.course_id = c.course_id;


-- CROSS JOIN: All Possible Combinations of Students and Courses
SELECT s.student_id, s.student_name, s.age, c.course_name, c.course_duration
FROM StudentDetails s
CROSS JOIN Course c;



-- to create a virtual table (view) from StudentDetails table ---
CREATE VIEW student_details AS
SELECT student_id, student_name, age
FROM StudentDetails;

SELECT *
FROM student_details;



-- to copy the table without data
create table course_new like course;


-- to copy the table as well the data 
create table course_new_table as select * from course;
