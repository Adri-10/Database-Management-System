-- Download and Execute the SQL Script file from the link given in Classroom.
-- We shall start our class soon. 

-- Syllabus of the Mid-Term I
-- Chapter 1
-- Chapter 2 
---- Relational Data Model
---- Different Keys -> Primary, Candidate, Alternate, Super key, Foreign key
-- Chapter 6 (Relational Algebra)
---- Projection (PI), Selection (SIGMA), Cartesian Product (CROSS)
---- Natural Join, Set Operations (UNION, INTERSECT, DIFFERENCE)
---- Aggregate Queries (Calligraphic G)
---- PI id, name(SIGMA dept_name = 'CSE' (instructor))
-- Chapter 3 (SQL)
---- DDL: Create table, drop table, alter table
---- DML: Single-table query (SELECT, FROM, WHERE), Multi-table queries
----      Set Operations, Aggregate Queries, DISTINCT, BETWEEN
----      Using AS keyword to rename the column of the result


-- Practicing Aggregate Queries
-- 1. Find the sum of salary of all instructors.
SELECT SUM(salary)
FROM instructor;
-- 2. Find the average credits taken by all students.
SELECT ROUND(AVG(tot_cred),2) as average_total_credit FROM student;
-- 3. Find the maximum and minimum salary among all isntructors.
SELECT MAX(salary) as max_salary, MIN(salary) as min_salary FROM instructor;
-- 4. Find the difference between the maximum and minimum salary among all instructors
SELECT MAX(salary) - MIN(salary) as diff_salary FROM instructor;
-- 5. FInd the monthly salary of all instructors assuming that the given salary is 
-- annual salary
SELECT id, name, ROUND(salary/12,0) as monthly_salary FROM instructor;

-- 6. Find the average salary of instructors of 'Comp. Sci.' department.
SELECT avg(salary) from instructor where dept_name = 'Comp. Sci.';
-- 7. Find the average credits taken by the students of 'Comp. Sci.' department.
SELECT avg(tot_cred) from student where dept_name = 'Comp. Sci.';

-- 8. Find the different between maximum and minimum salary of instructors of
--    'History' and 'Finance' department.

select max(salary) - min(salary) from instructor where dept_name = 'History' or
dept_name = 'Finance';

-- Group by attribute
-- 9. Find average total credit taken by students in each department.
select dept_name, avg(tot_cred) 
from student
group by dept_name;

-- 10. Find maximum and minimum salary of instructors department-wise.
select dept_name, max(salary), min(salary) 
from instructor
group by dept_name;
-- 11. Find number of instructors at each department.
select dept_name, count(*) as num_instructor
from instructor
group by dept_name;
-- 12. Find number of sections offered by each department***.

select dept_name, count(*) 
from course c, section s
where c.course_id = s.course_id
group by dept_name;

-- 13. Find number of section offered by each department during Spring 2010.
select dept_name, count(*) 
from course c, section s
where c.course_id = s.course_id and semester = 'Spring' and year = 2010
group by dept_name;

-- using natural join
select dept_name, count(*) 
from course NATURAL JOIN section 
where semester = 'Spring' and year = 2010
group by dept_name;

-- 14. Find number of students advised by each instructor. 
-- Show instructor id and name. (instructor, advisor)
select id, name, count(*) as num_advisee
from instructor i, advisor a 
where i.id = a.i_id
group by id, name;


-- 15. Find number of students advised by instructors of each department. 
-- (instructor, advisor)

select dept_name, count(*) as num_advisee
from instructor i, advisor a 
where i.id = a.i_id
group by dept_name;






