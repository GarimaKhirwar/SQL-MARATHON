--1. Update salary for a specific department

UPDATE employees
SET salary = 50000
where department_id IN
-- IN is used for multiple values
(select department_id from 
departments where
department_name='Tech Support');

--good practice: first check, what you are going to update
select e.salary, d.department_name
from employees e join departments d
on 
d.department_id =e.department_id where
d.department_name='Tech Support';

--2.	Remove employees from an obsolete department

DELETE from employees
where employee_name in 
(select name  from
(select e.employee_name as name,  
e.department_id,e.salary, 
dense_rank() over (partition by 
e.department_id order by e.salary)
as rn
from employees e
join departments d
on e.department_id=d.department_id
where d.department_name= 'Frontend Engineering' 
and 
e.employee_id <> d.manager_employee_id
order by e.department_id) as table_a
where rn=2);

-- 3.	Create a view for high-earning employees

CREATE VIEW high_earning_employees AS
SELECT employee_name as high_earners from employees
where salary >= (select percentile_disc(0.99) 
within group (order by salary)
from employees);            

--4. Add validation to ensure salary is always positive

ALTER TABLE employees
ADD constraint salary_check CHECK (salary>=0);

-- 5.	Improve search performance using indexing

CREATE index emp_salary
ON employees (salary);

EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- index makes fetching efficient as it allows PostgreSQL to locate the pointer variable referencing the required row

--6.	Create a stored procedure for department-based queries

CREATE PROCEDURE dept_queries(dept_name text) 
LANGUAGE plpgsql
AS $$
BEGIN 
  select  
  AVG(e.salary) as avg_salary,
  MAX(e.salary) as highest_salary,
  MIN(e.salary) as lowest_salary,
  COUNT(e.employee_id) as num_of_employees
  from employees e join departments d
  on e.department_id = d.department_id   
  group by d.department_name;
END;
$$;

CALL dept_queries('Frontend Engineering'); 
---- In PostgreSQL, a SELECT inside a procedure does not return results to the caller

CREATE PROCEDURE dept_salary_update(dept_name text, new_salary int) 
LANGUAGE plpgsql
AS $$
BEGIN  
 UPDATE employees
 SET salary = new_salary
 where department_id IN
 (select department_id from 
 departments where
 department_name=dept_name);
END;
$$;


