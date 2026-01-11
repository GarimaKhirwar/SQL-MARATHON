--1.	Display all employees

SELECT employee_name from employees;

--2.	Find employees working in a specific department

SELECT e.employee_name as data_science_employees
from employees e join departments d
on e.department_id = d.department_id
where d.department_name= 'Data Science';

--3.	List unique job titles

SELECT DISTINCT designation as unique_job_titles
from employees;

--4.	Sort employees by salary

SELECT employee_name, salary
from employees order by salary desc;

--5.	Count total employees

SELECT count(employee_id) as totol_employees
from employees;

--6.	Calculate average salary per department

SELECT d.department_name,
round(AVG(e.salary)::numeric,2) as avg_salary
from departments d join employees e
on d.department_id = e.department_id
group by d.department_name
order by avg_salary desc;

--7.	Show employee names along with department names

SELECT e.employee_name,d.department_name
from employees e join departments d
on d.department_id = e.department_id
group by d.department_name, e.employee_name;

-- group by(optional)
