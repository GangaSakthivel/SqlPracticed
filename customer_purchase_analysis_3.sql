show databases;
use n;
show tables;

# Identify NULL Salaries
select * from company_employees where salary is null;

# Count Employees with NULL Salaries
select count(*) as null_salaries from company_employees where salary is null;

/*Update NULL Salaries
Set the salary of all employees with NULL salary to 40000.*/

SET SQL_SAFE_UPDATES = 0;

update company_employees
set salary = 40000
where salary is null;

select * from company_employees;

#Examples of DELETE
#1. Delete a Specific Row
#Query: Remove the employee with emp_id = 2 (Bob).
delete from company_employees where emp_id = 2;

# Delete Rows Based on a Condition
#Query: Remove employees with NULL salary.

#Delete All Rows in a Table
#Query: Remove all employees from the table
delete from company_employees;

select * from company_employees;

/*Truncate vs Delete:
DELETE: Removes specific rows, can have a WHERE clause.
TRUNCATE: Deletes all rows and resets table identity counters but cannot include a WHERE clause.*/

show tables;
select * from employee_records;

#1. Get the Top 3 Highest Paid Employees
SELECT name, salary
FROM employee_records
ORDER BY salary DESC
LIMIT 3;

# fetch the first 4 rows from the employee_records table sorted by the joining_date in ascending order?
select * from employee_records order by joining_date desc;

# Write a query to get the top 2 employees in the IT department based on their salary.
select * from employee_records where department = 'IT' order by salary desc;

/* get employees from the employee_records table, starting from the 6th 
employee and fetching the next 5 employees, how would you write the query?*/
select name, salary 
from employee_records 
limit 5 offset 5;

/*LIMIT 5: Limits the query to return 5 rows.
OFFSET 5: Skips the first 5 rows (starting from the 6th employee).*/

#Write a query to find the top 3 highest-paid employees from the employee_records table.
select * from employee_records order by salary desc limit 3;

# Write a query to get the first 5 employees who joined the company last, based on their joining_date.
select * from employee_records order by joining_date desc limit 5;

/*find the top 10% highest-paid employees from the employee_records table, 
how would you write the query? (Assume there are 10 employees in total.)*/
SELECT name, salary
FROM employee_records
ORDER BY salary DESC
LIMIT 10;

