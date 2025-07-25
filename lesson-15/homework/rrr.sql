 -- 1. Task: Retrieve employees who earn the minimum salary in the company. Tables: employees (columns: id, name, salary)
 

select * from employees
where salary=(SELECT min(salary) FROM employees)

-- 2. Task: Retrieve products priced above the average price. Tables: products (columns: id, product_name, price)

select * from products
where  price>(select avg(price) from products)

-- 3. Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department. Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)


select * from departments
select * from employees

select e.id,e.name from employees e
join departments d on e.department_id =d.id
where d.department_name ='sales'

-- 4. Task: Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)


select * from customers
select * from orders

SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 5. Task: Retrieve products with the highest price in each category. Tables: products (columns: id, product_name, price, category_id)



select * from products
where price =(select max(price) from Products)

-- 6. Task: Retrieve employees working in the department with the highest average salary. Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)


select * from Employees
select * from departments

WITH AvgSalaryPerDept AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),

MaxAvgSalary AS (
    SELECT MAX(avg_salary) AS max_avg_salary
    FROM AvgSalaryPerDept
)

SELECT e.*
FROM employees e
JOIN AvgSalaryPerDept a ON e.department_id = a.department_id
JOIN MaxAvgSalary m ON a.avg_salary = m.max_avg_salary;

-- 7. Task: Retrieve employees earning more than the average salary in their department. Tables: employees (columns: id, name, salary, department_id)


select * from employees e
where salary >(select avg(salary) from employees where department_id =e.department_id)

-- 8. Task: Retrieve students who received the highest grade in each course. Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade)


select * from students
select * from grades

WITH MaxGrades AS (
    SELECT course_id, MAX(grade) AS max_grade
    FROM grades
    GROUP BY course_id
)
SELECT s.student_id, s.name, g.course_id, g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN MaxGrades mg ON g.course_id = mg.course_id AND g.grade = mg.max_grade;

-- 9. Find Third-Highest Price per Category Task: Retrieve products with the third-highest price in each category. Tables: products (columns: id, product_name, price, category_id)



select * from Products

WITH RankedProducts AS (
    SELECT
        id,
        product_name,
        price,
        category_id,
        ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY price DESC) AS price_rank
    FROM products
)
SELECT
    id,
    product_name,
    price,
    category_id
FROM RankedProducts
WHERE price_rank = 3;

-- 10. Task: Retrieve employees with salaries above the company average but below the maximum in their department. Tables: employees (columns: id, name, salary, department_id)


select * from employees

where salary>(select avg(salary) from employees)

  AND salary < (
      SELECT MAX(salary)
      FROM employees e
      WHERE department_id = e.department_id
  );


