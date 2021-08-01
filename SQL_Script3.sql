
--Execute a working query using a sub-select to retrieve all employees records 
--whose salary is lower than the average salary.
select emp_id,f_name,l_name,salary, (select avg(salary) from employees) as avg_salary 
from employees where salary < (select avg(salary) from employees);

--Execute a Column Expression that retrieves all employees records with
-- EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select emp_id, salary, max(salary) as max_salary from employees;


--Execute a Column Expression that retrieves all employees records with 
--EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select emp_id, salary,(select max(salary) as max_salary from employees) from employees;


--Execute a Table Expression for the EMPLOYEES table that excludes columns with 
--sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
select * from (select emp_id, f_name, l_name, dep_id, manager_id from employees);

