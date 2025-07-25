create database lesson12
use lesson12
-- 1. Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.


select * from Departments
select * from Employees

select e.name,
            e.salary,
      d.departmentName 
from Employees e
join Departments d on e.departmentID =d.departmentID
where e.salary >50000

-- 2. Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.




select * from Customers
select * from Orders

select 
customers.firstName,
customers.lastName,
orders.OrderDate
from
Customers
join 
Orders on customers.customerID = orders.CustomerID
where 
year(Orders.OrderDate)=2023

-- 3. Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.

select * from Departments
select * from Employees

select 
Employees.Name,
Departments.departmentName
from
Employees
left join
Departments on Employees.departmentID = Departments.departmentID

-- 4. Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.


select * from Products
select * from Suppliers

select 
Suppliers.supplierName,
Products.ProductName
from
Suppliers
full join
Products on suppliers.supplierID = Products.supplierID

-- 5. Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.


select * from Orders
select * from Payments

select 
Orders.OrderID,
Orders.OrderDate,
Payments.PaymentDate,
Payments.Amount
from
Orders
full join 
Payments on Orders.OrderID = Payments.OrderID

-- 6. Using the Employees table, write a query to show each employee's name along with the name of their manager.

select * from Employees

SELECT 
    e.Name,
    m.Name AS ManagerName
FROM 
    Employees e
LEFT JOIN 
    Employees m ON e.ManagerID = m.EmployeeID;

-- 7. Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.


select * from Students
select * from Courses
select * from Enrollments

select 
students.Name,
Courses.CourseName
from 
students
join
Enrollments on Students.studentID =Enrollments.StudentID
join
courses on Enrollments.courseID =courses.courseID
where
courses.courseName ='Math 101';

-- 8. Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.

select * from Customers
select * from Orders

select 
Customers.FirstName,
Customers.LastName,
sum(orders.quantity) as Quantity
from 
customers
join
orders on customers.customerID = Orders.customerID
group by Customers.FirstName,
Customers.LastName
having
sum(Orders.Quantity)>3;

-- 9. Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.

Select * from Employees
select * from Departments

select 
Employees.name,
Departments.departmentName
from
Employees
join
Departments on Employees.EmployeeId = Departments.departmentID

-- 10. Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.

select * from Employees
select * from Departments

select 
Departments.DEpartmentName,
count(Employees.EmployeeID) as EmployeeCount
from
departments
join
Employees on departments.departmentID =Employees.departmentId
group by departments.departmentName
having count(Employees.employeeID)>5;

-- 11. Using the Products and Sales tables, write a query to find products that have never been sold.

select * from Products
select * from sales

select 
Products.ProductID,
Products.ProductName
from
Products
left join
sales on products.ProductID = sales.productID
where 
sales.ProductID is null

-- 12. Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.

select * from Customers
select * from Orders

select 
Customers.firstName,
Customers.lastName,
count(Orders.OrderID) as totalOrders
from
customers
join
orders on customers.customerID = Orders.customerID
group by Customers.firstName,
         Customers.lastName
		 having 
count(Orders.OrderID)>=1;

-- 13. Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).

select * from Employees
select * from Departments

select 
Employees.name,
departments.departmentName
from 
Employees
join
Departments on employees.EmployeeID =Departments.departmentID

-- 14. Using the Employees table, write a query to find pairs of employees who report to the same manager.

select * from Employees

select 
e1.Name as Employee1,
e2.Name as Employee2,
e1.managerID 
from
Employees e1
join
Employees e2 on e1.managerID = e2.managerID
where 
e1.EmployeeID < e2.EmployeeID

-- 15. Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.

select * from Orders
select * from Customers

select 
Orders.OrderDate,
Customers.FirstName,
Customers.LastName
from
Orders
join
Customers on Orders.customerID =Customers.customerID
where
year(Orders.OrderDate)  = 2022;

-- 16. Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.

select * from Employees
select * from Departments

select 
Employees.name,
Employees.salary,
departments.departmentName
from 
Employees
join
departments on Employees.departmentID =departments.departmentID
where
    Employees.salary >60000;

-- 17. Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.

select * from Orders
select * from Payments

select 
Orders.OrderID,
Orders.OrderDate,
Payments.PaymentDate,
Payments.Amount
from
Orders
join
Payments on Orders.OrderID = Payments.OrderID

-- 18. Using the Products and Orders tables, write a query to find products that were never ordered.

select * from Products
select * from Orders

select 
Products.ProductID,
Products.ProductName
from 
Products
left join
Orders on Products.ProductID =Orders.ProductID
where 
Orders.ProductID is null

-- 19. Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.

select * from Employees

select 
Name,
salary 
from
Employees e
where
salary >(select avg(salary) from Employees
where DepartmentID =e.DepartmentID
)

-- 20. Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.

select * from Orders
select * from Payments

SELECT 
    Orders.OrderID,
    Orders.OrderDate
FROM 
    Orders
LEFT JOIN 
    Payments ON Orders.OrderID = Payments.OrderID
WHERE 
    Payments.OrderID IS NULL
    AND Orders.OrderDate < '2020-01-01';

-- 21. Using the Products and Categories tables, write a query to return products that do not have a matching category.



select * from Products
select * from Categories

SELECT 
    Products.ProductID,
    Products.ProductName
FROM 
    Products
LEFT JOIN 
    Categories ON Products.ProductID = Categories.CategoryID
WHERE 
    Categories.CategoryID IS NULL;

-- 22. Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.

select * from Employees
SELECT 
    e1.Name AS Employee1,
    e2.Name AS Employee2,
    e1.ManagerID,
    e1.Salary
FROM 
    Employees e1
JOIN 
    Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE 
    e1.EmployeeID < e2.EmployeeID
    AND e1.Salary > 60000
    AND e2.Salary > 60000;

-- 23. Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.

SELECT 
    Employees.Name,
    Departments.DepartmentName
FROM 
    Employees
JOIN 
    Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE 
    Departments.DepartmentName LIKE 'M%';


-- 24. Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.

SELECT 
    Sales.SaleID,
    Products.ProductName,
    Sales.SaleAmount
FROM 
    Sales
JOIN 
    Products ON Sales.ProductID = Products.ProductID
WHERE 
    Sales.SaleAmount > 500;

-- 25. Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.

select * from students
SELECT 
    s.StudentID,
    s.Name
FROM 
    Students s
LEFT JOIN 
    Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN 
    Courses c ON e.CourseID = c.CourseID AND c.CourseName = 'Math 101'
WHERE 
    c.CourseID IS NULL;

-- 26. Using the Orders and Payments tables, write a query to return orders that are missing payment details.

SELECT 
    Orders.OrderID,
    Orders.OrderDate,
    Payments.PaymentID
FROM 
    Orders
LEFT JOIN 
    Payments ON Orders.OrderID = Payments.OrderID
WHERE 
    Payments.PaymentID IS NULL;

-- 27. Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.

SELECT 
    Products.ProductID,
    Products.ProductName,
    Categories.CategoryName
FROM 
    Products
JOIN 
    Categories ON Products.ProductID = Categories.CategoryID
WHERE 
    Categories.CategoryName IN ('Electronics', 'Furniture');
