--String Patterns , Sorting and Grouping
--Exercise 1: String Patterns

--Retrieve all employees whose address is in Elgin,IL.
SELECT * FROM employees where ADDRESS like '%Elgin,IL';


--Retrieve all employees who were born during the 1970's.
select * from employees where year(B_DATE) like '197%';

--Retrieve all employees in department 5 whose salary is between 60000 and 70000.
select * from employees where DEP_ID = 5 and salary between 60000 and 70000;


--Exercise 2: Sorting

--Retrieve a list of employees ordered by department ID.
select * from employees order by DEP_ID;

--Retrieve a list of employees ordered in descending order by department ID 
--and within each department ordered alphabetically in descending order by last name.
select * from employees order by DEP_ID desc, l_name desc;


--Retrieve a list of employees ordered by department name, 
--and within each department ordered alphabetically in descending order by last name.
select * from employees e, departments d
	where e.DEP_ID = d.DEPT_ID_DEP
	order by DEP_NAME, L_NAME desc;
	
--Exercise 3: Grouping


--For each department ID retrieve the number of employees in the department.	
select dep_id, count(emp_id) from employees
group by dep_id;

--For each department retrieve the number of employees in the department, 
--and the average employee salary in the department..
select dep_id, count(*) as num_employees, avg(salary) as avg_salary from employees group by dep_id;


--order the result set by Average Salary.
-- limit the result to departments with fewer than 4 employees.
select dep_id,count(emp_id) as NUM_EMPLOYEES, avg(salary) as avg_salary from employees 
group by dep_id
having count(emp_id) < 4
order by avg_salary;