-- 1.	Show employees along with their managers

SELECT e.employee_name as employee, 
m.employee_name as manager
from departments d left join employees m
on d.manager_employee_id = m.employee_id
join employees e 
on d.department_id = e.department_id
where e.employee_id <> d.manager_employee_id;

--2.	Find employees earning more than average salary

SELECT employee_name , salary
from employees 
where salary > (select AVG(salary)
from employees);

--3.	Display employee name, department, and company

SELECT e.employee_name, 
d.department_name,
c.company_name from companies c
join departments d 
on c.company_id = d.company_id
join employees e
on e.department_id = d.department_id
order by c.company_name, d.department_name;

--4.	Identify the second-highest salary

SELECT employee_name, salary 
as second_highest_salary
from employees 
order by salary desc
offset 1
limit 1;

--5.	Rank employees by salary within departments

SELECT e.employee_name,
d.department_name,
dense_rank() over(partition by 
department_name order by salary desc)
from employees e join departments d 
on e.department_id = d.department_id;

--6.	Categorize employees as Low / Medium / High earners

SELECT employee_name,
CASE 
WHEN salary< 60000 THEN 'low earner'            
WHEN salary between 60000 AND 90000 THEN 'medium earner'
ELSE 'high earner'
END AS earner_category
FROM employees
order by salary;


