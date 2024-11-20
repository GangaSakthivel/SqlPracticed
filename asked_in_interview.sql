show databases;
use ganga;

/* what is sql:
SQL stands for structured query language used to manipulate relational database management system.

what is database:
A database is an organized collection of data that is stored and managed so it can be accessed, updated, and used efficiently. 
It serves as a structured repository for information, allowing users or applications to retrieve and manipulate data quickly and easily. 
Databases are widely used in software applications, websites, business systems, and other areas to store and manage data.

difference between char and varchar2:
In SQL, CHAR and VARCHAR are both data types used to store text or string values. 
However, they differ in how they store the data and how they handle memory usage.


Definition: CHAR is used to store fixed-length strings. If the string is shorter than the defined length, the database will pad it with spaces to reach the specified length.

Storage: It uses a fixed amount of space regardless of the string length.

Definition: VARCHAR is used to store variable-length strings. It only uses as much storage space as needed for the string, plus some extra space for length information.

Storage: It is more efficient for storing strings of varying lengths since it doesn't waste space on padding.

CHAR: When the data has a consistent, fixed length (e.g., a 2-letter country code, a state abbreviation).
VARCHAR: When the data can vary in length (e.g., names, addresses, email addresses).
*/

select * from employees;

#Employees with Salary Greater than 5000:
select * from employees where salary > 5000;

#Employees Without Email IDs:
select employee, email_id where email_id is null;

#Total Salary by Department:
select sum(salary), department
from employees
group by departments;

#Employee Details by Department 10:
select * from employees where departments = 10;

#Average Salary of All Employees:
select avg(salary) from employees;

#Find the Youngest Employee:
select employee, age from employees where age = (select min(age) from employees);

#Employees Sorted by Salary (Highest to Lowest):
select * from employees order by salary desc;

#Count of Employees in Each Department:
SELECT Departments, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Departments;

#Employees Aged Between 25 and 30:
select * from employees where age between 25 and 35;

#employee who are tied to dept 10 and 30
select * from employees where department in(10, 30);

#Employee who has highst salary 
select employee from employees where salary = (select max(salary) from employees);

#or
select employee from employees order by salary desc limit 1;

#employee who gets lowest salary
select employee from employees where salary = (select min(salary) from employees);

#or
select employee
from employees
order by salary asc
limit 1;

#finding the oldest employee

select employee,age 
from employees
order by age desc
limit 1;

##finding the second oldest employee
select employee, age 
from employees where age <> ( select max(age) from employees) limit 1, 1;

#or

select employee, age
from employees 
order by age desc
limit 1 offset 1;