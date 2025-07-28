

-- easy
-- 1. Create a numbers table using a recursive query from 1 to 1000.

WITH numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 1000
)
SELECT * FROM numbers
OPTION (MAXRECURSION 0);

-- 2. Write a query to find the total sales per employee using a derived table.(Sales, Employees)

select * from sales 
select * from employees

SELECT 
    e.employeeid,
    e.firstName,
    s.TotalSales
FROM 
    Employees e
LEFT JOIN 
    (
        SELECT 
            employeeid,
            SUM(salesamount) AS TotalSales
        FROM 
            Sales
        GROUP BY 
            employeeid
    ) s ON e.employeeid = s.employeeid;

-- 3. Create a CTE to find the average salary of employees.(Employees)

CREATE FUNCTION dbo.Factorial (@n INT)
RETURNS BIGINT
AS
BEGIN
    DECLARE @result BIGINT = 1;
    DECLARE @i INT = 1;

    WHILE @i <= @n
    BEGIN
        SET @result = @result * @i;
        SET @i = @i + 1;
    END

    RETURN @result;
END;
SELECT 
    number,
    dbo.Factorial(number) AS factorial
FROM Numbers1;

-- 4. Write a query using a derived table to find the highest sales for each product.(Sales, Products)

select * from sales 
select * from products

SELECT 
    p.product_id,
    p.name AS product_name,
    max_sales.max_price
FROM Products p
LEFT JOIN (
    SELECT 
        product_id,
        MAX(price) AS max_price
    FROM Sales
    GROUP BY product_id
) AS max_sales ON p.product_id = max_sales.product_id;

-- 5. Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.

with numbers as(
select 1 as number
union all
select number * 2
from numbers
where number * 2<1000000
)
select * from numbers

-- 6. Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)

select * from employees
select * from sales

;with salescount as(
select 
employeeid,
count(*) as total_sales
from sales 
group by employeeID
)
select 
e.employeeid,
e.firstName
from employees e
join salescount sc on e.employeeid =sc.employeeID
where sc.total_sales >5

-- 7. Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

select * from Products
select * from sales

;WITH SalesAmounts AS (
    SELECT 
        product_id,
        SUm(salesamount) AS total_amount
    FROM sales
    GROUP BY product_id
)
SELECT 
    p.product_id,
    p.name,
    sa.total_amount
FROM products p
JOIN SalesAmounts sa ON p.product_id = sa.product_id
WHERE sa.total_amount > 500;

-- 8. Create a CTE to find employees with salaries above the average salary.(Employees)

select * from employees
;with avghub as(
select avg(salary) as avg_salary from employees
)
select 
e.employeeId,
e.firstName,
e.salary
from employees e
cross join avghub a
where e.salary >a.avg_salary

-- medium
-- 1. Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

select  top 5
e.employeeid,
e.firstName,
dt.order_count
from employees e
join(
select 
employeeID,
count(*) as order_count
from sales
group by employeeid
)
dt on e.employeeID =dt.employeeID
order by dt.order_count desc;

-- 2. Write a query using a derived table to find the sales per product category.(Sales, Products)

select * from Products

select * from sales

select 
p.category,
dt.total
from(
select product_ID,
sum(SALESAMOUNT) as total
from sales
group by product_ID
) dt 
join  products p on dt.Product_ID =p.Product_ID
group by p.category, dt.total

-- 3. Write a script to return the factorial of each value next to it.(Numbers1)

;WITH FactorialCTE AS (
    SELECT 
        number,
        CAST(1 AS BIGINT) AS factorial,
        number AS orig_number
    FROM Numbers1
    WHERE number = 1

    UNION ALL

    SELECT 
        n.number,
        f.factorial * n.number,
        f.orig_number
    FROM FactorialCTE f
    JOIN Numbers1 n ON n.number = f.number + 1
)
SELECT 
    orig_number AS number,
    MAX(factorial) AS factorial
FROM FactorialCTE
GROUP BY orig_number
ORDER BY number
OPTION (MAXRECURSION 1000);  -- yoki kerak bo‘lsa ko‘proq


-- 4. This script uses recursion to split a string into rows of substrings for each character in the string.(Example)



;WITH SplitCTE AS (
    SELECT 
        1 AS position,
        SUBSTRING('hello', 1, 1) AS character
    UNION ALL
    SELECT 
        position + 1,
        SUBSTRING('hello', position + 1, 1)
    FROM SplitCTE
    WHERE position + 1 <= LEN('hello')
)
SELECT character
FROM SplitCTE
OPTION (MAXRECURSION 0);

-- 5. Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)

;WITH MonthlySales AS (
    SELECT 
        FORMAT(sale_date, 'yyyy-MM') AS sales_month,
        SUM(salesamount) AS total_sales
    FROM Sales
    GROUP BY FORMAT(sale_date, 'yyyy-MM')
)
SELECT 
    sales_month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY sales_month) AS previous_month_sales,
    total_sales - LAG(total_sales) OVER (ORDER BY sales_month) AS sales_difference
FROM MonthlySales;

-- 6. Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)

SELECT 
    e.employeeid,
    e.name,
    q.year,
    q.quarter,
    q.total_sales
FROM Employees e
JOIN (
    SELECT 
        employeeid,
        YEAR(sale_date) AS year,
        DATEPART(QUARTER, sale_date) AS quarter,
        SUM(salesamount) AS total_sales
    FROM Sales
    GROUP BY employeeid, YEAR(sale_date), DATEPART(QUARTER, sale_date)
    HAVING SUM(salesamount) > 45000
) q ON e.employeeid = q.employeeid
ORDER BY e.employeeid, q.year, q.quarter;

-- 1. This script uses recursion to calculate Fibonacci numbers

;WITH FibonacciCTE AS (
    SELECT 0 AS position, 0 AS value
    UNION ALL
    SELECT 1, 1
    UNION ALL
    SELECT position + 1, 
           (SELECT value FROM FibonacciCTE WHERE position = f.position - 1) + value
    FROM FibonacciCTE f
    WHERE position + 1 < @n
)
SELECT position, value
FROM FibonacciCTE
ORDER BY position
OPTION (MAXRECURSION 1000);

-- 2. Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')

select * from FindSameCharacters

select vals from FindSameCharacters
where len(vals)>1
and vals not like '%[^' + left(vals,1) + ']%'

-- 3. Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)
DECLARE @n INT = 5;

;WITH NumbersCTE AS (
    SELECT 1 AS order_num, CAST('1' AS VARCHAR(MAX)) AS sequence
    UNION ALL
    SELECT order_num + 1,
           sequence + CAST(order_num + 1 AS VARCHAR)
    FROM NumbersCTE
    WHERE order_num < @n
)
SELECT * FROM NumbersCTE
ORDER BY order_num
OPTION (MAXRECURSION 0);

-- 4. Write a query using a derived table to find the employees who have made the most sales in the last 6 months.(Employees,Sales)
select * from employees
SELECT 
    e.employee_id,
    e.name,
    s.total_sales
FROM Employees e
JOIN (
    SELECT 
        employee_id,
        SUM(salary) AS total_sales
    FROM Sales
    WHERE sale_date >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY employee_id
) s ON e.employee_id = s.employee_id
WHERE s.total_sales = (
    SELECT MAX(total_sales)
    FROM (
        SELECT 
            employee_id,
            SUM(salary) AS total_sales
        FROM Sales
        WHERE sale_date >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY employee_id
    ) AS sub
)
ORDER BY e.employee_id;

-- 5. Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)

WITH SplitChars AS (
    SELECT
        id,
        SUBSTRING(name, number, 1) AS ch
    FROM RemoveDuplicateIntsFromNames
    CROSS APPLY (
        SELECT TOP (LEN(name)) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS number
        FROM sys.all_objects -- har qanday katta jadval
    ) AS numbers
    WHERE number <= LEN(name)
),
-- Sanab chiqamiz raqamlarni
DigitCounts AS (
    SELECT
        id,
        ch,
        COUNT(*) OVER (PARTITION BY id, ch) AS char_count
    FROM SplitChars
    WHERE ch LIKE '[0-9]'
),
-- Har bir belgini olib, raqamlarni shart bo‘yicha olib tashlaymiz
FilteredChars AS (
    SELECT DISTINCT
        sc.id,
        sc.ch,
        dc.char_count
    FROM SplitChars sc
    LEFT JOIN DigitCounts dc ON sc.id = dc.id AND sc.ch = dc.ch
    WHERE 
        -- raqam emas bo‘lsa, qoladi
        (sc.ch NOT LIKE '[0-9]')
        OR
        -- raqam bo‘lsa va char_count > 1 bo‘lsa bittadan qoldiramiz
        (sc.ch LIKE '[0-9]' AND dc.char_count > 1)
)
SELECT
    id,
    STRING_AGG(ch, '') WITHIN GROUP (ORDER BY (SELECT NULL)) AS new_name
FROM FilteredChars
GROUP BY id;
