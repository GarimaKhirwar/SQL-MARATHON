--1.	Perform a salary transfer using transactions

create table employees_account (
employee_id int primary key, 
salary_month text,
salary int default null);

insert into employees_account
values( 12, 'january', 0);

create table companies_account (
department_id int primary key, 
monthly_salary_budget int not null );

insert into companies_account
values(119, 1000000);
   
BEGIN;
UPDATE employees_account
SET salary = salary + 60000
where employee_id= 12;

UPDATE companies_account
SET monthly_salary_budget = monthly_salary_budget - 60000
where department_id = 119;
COMMIT;

--logic: 
--you only choose one commit or rollback
--if something fails before commit and PostgreSQL marks the transaction as failed, 
--then execute rollback


--2.	Identify departments that have employees

SELECT d.department_name from 
departments d join employees e
on d.department_id = e.department_id
where e.employee_name is not null
group by d.department_name;

-- 3.	Display employee–manager hierarchy

SELECT m.employee_name as manager, e.employee_name as employee
from  departments d left join employees m
on d.manager_employee_id = m.employee_id
join employees e 
on e.department_id=d.department_id
where e.employee_id <> d.manager_employee_id;

--4.	Compare previous and next salaries

select employee_name, designation,
lag(salary) over(partition by designation order by salary) 
as previous_salary,
lead(salary) over(partition by designation order by salary) 
as next_salary
from employees
group by designation, employee_name,salary;

--5.	Generate department-wise salary totals

select c.company_name, d.department_name, 
SUM(e.salary) as salary_total
from companies c join departments d
on c.company_id = d.company_id
join employees e
on d.department_id = e.department_id
group by c.company_name, d.department_name
order by salary_total desc;

--6.	Export database structure and data


