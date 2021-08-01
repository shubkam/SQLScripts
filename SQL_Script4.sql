--Working with Multiple Tables

select * from employees;

select * from jobs;

--Exercise 1: Accessing Multiple Tables with Sub-Queries

--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees where job_id in (Select job_ident from jobs);

--Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select *  from employees where job_id in (select job_ident from jobs where job_title = 'Jr. Designer');

--Retrieve JOB information and list of employees who earn more than $70,000.
select * from jobs where job_ident in
	(select job_id from employees where salary>70000);

--Retrieve JOB information and list of employees whose birth year is after 1976.
select  *	from jobs where job_ident in
		(select job_id from employees where year(b_date) > 1976);

--Retrieve JOB information and list of female employees whose birth year is after 1976.		
select * from jobs where job_ident in (select job_id from employees where sex = 'F' and year(b_date)>1976);



--Exercise 2: Accessing Multiple Tables with Implicit Joins

--Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from employees, jobs;

--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees, jobs where employees.job_id=jobs.job_ident;


--Redo the previous query, using shorter aliases for table names.
select * from employees as e, jobs as j where e.job_id=j.job_ident;

--Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select emp_id, f_name, l_name, job_title from employees e, jobs j where e.job_id=j.job_ident;


--Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
select e.emp_id, e.f_name, e.l_name, j.job_title from employees e, jobs j where e.job_id=j.job_ident;



