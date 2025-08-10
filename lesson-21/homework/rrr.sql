
-- 1. Write a query to assign a row number to each sale based on the SaleDate.
select * from Productsales
with cte as(
select *,row_number() over( order by saledate desc) as rownums from Productsales
)
select * from cte

SELECT 
    SaleID,
    CustomerID,
    SaleDate,
    saleAmount,
    ROW_NUMBER() OVER (ORDER BY SaleDate) AS RowNum
FROM 
    productSales;

-- 2. Write a query to rank products based on the total quantity sold. give the same rank for the same amounts without skipping numbers.
select * from Productsales
with cte as (

select saleID,
sum(quantity) as total,
dense_rank() over( order by sum(quantity) desc) as rio from productsales
group by saleID

)
select * from cte 


-- 3. Write a query to identify the top sale for each customer based on the SaleAmount.
select * from Productsales
with cte as(
select *, row_number() over(partition by customerID order by saleamount desc) as rios from Productsales
)
select * from cte
where rios=1


-- 4. Write a query to display each sale's amount along with the next sale amount in the order of SaleDate.
select * from Productsales
with cte as(
 select *, lead(saleamount)over(order by saledate) as nextday
 from productsales
)
select * from cte


-- 5. Write a query to display each sale's amount along with the previous sale amount in the order of SaleDate.
with cte as(
 select *, lag(saleamount)over(order by saledate) as nextday
 from productsales
)
select * from cte

-- 6. Write a query to identify sales amounts that are greater than the previous sale's amount
with cte as(
select *, lag(saleamount) over(order by saledate) as nextmonth from productsales
)
select * from cte
where saleamount >nextmonth

-- 7. Write a query to calculate the difference in sale amount from the previous sale for every product
with cte as(
select *, lag(saleamount) over(partition by customerID order by saledate) as monthnext from ProductSales

)
select * from cte

-- 8. Write a query to compare the current sale amount with the next sale amount in terms of percentage change.
WITH cte AS (
    SELECT 
        *,
        LEAD(saleamount) OVER (ORDER BY saledate) AS nxet,
        ROUND(
            CASE 
                WHEN saleamount = 0 THEN NULL
                ELSE ((LEAD(saleamount) OVER (ORDER BY saledate) - saleamount) * 100.0) / saleamount
            END, 2
        ) AS percentage_change
    FROM productsales
)
SELECT * FROM cte;

-- 9. Write a query to calculate the ratio of the current sale amount to the previous sale amount within the same product.
with cte as (
select *, lag(saleamount) over(partition by customerID order by saledate) as previos
from Productsales
)

select *, 
   case  
      when previos is null or previos = 0 then null
    else cast(saleamount as float)/previos
    end as saleamountratio
    from cte



-- 10. Write a query to calculate the difference in sale amount from the very first sale of that product.
WITH FirstSale AS (
    SELECT 
        customerID,
        MIN(SaleDate) AS FirstSaleDate
    FROM ProductSales
    GROUP BY customerID
),
FirstSaleAmounts AS (
    SELECT 
        ps.customerID,
        ps.SaleAmount AS FirstSaleAmount
    FROM ProductSales ps
    JOIN FirstSale fs
        ON ps.customerID = fs.customerID AND ps.SaleDate = fs.FirstSaleDate
)
SELECT
    ps.customerID,
    ps.SaleID,
    ps.SaleDate,
    ps.SaleAmount,
    fsa.FirstSaleAmount,
    ps.SaleAmount - fsa.FirstSaleAmount AS DifferenceFromFirstSale
FROM ProductSales ps
JOIN FirstSaleAmounts fsa
    ON ps.CustomerID = fsa.customerID
ORDER BY ps.customerID, ps.SaleDate;

-- 11. Write a query to find sales that have been increasing continuously for a product (i.e., each sale amount is greater than the previous sale amount for that product).
select * from Productsales

SELECT
    saleid,
    customerID,
    saledate,
    saleamount,
    prv
FROM (
    SELECT
        saleid,
        customerID,
        saledate,
        saleamount,
        LAG(saleamount) OVER (PARTITION BY customerID ORDER BY saledate) AS prv
    FROM productsales
) AS t
WHERE saleamount > prv



-- 12. Write a query to calculate a "closing balance"(running total) for sales amounts which adds the current sale amount to a running total of previous sales.
select * from productsales
with cte as(
select *, sum(saleamount) over(order by saledate) as closing_balance from Productsales
)
select * from cte
-- 13. Write a query to calculate the moving average of sales amounts over the last 3 sales.
with cte as(
select *, avg(saleamount) over(order by saledate rows between 2 preceding and current row) as moving_avg
from Productsales
)
select * from  cte
-- 14. Write a query to show the difference between each sale amount and the average sale amount.
with cte as(
select *, avg(saleamount) over() as avg_sale,
saleamount - avg(saleamount) over() as difference from Productsales
)
select * from cte
-- 15. Find Employees Who Have the Same Salary Rank
select * from Employees1
select 
employeeID,
Name,
salary,
dense_rank() over(order by salary desc) as salaryrank from employees1

-- 16. Identify the Top 2 Highest Salaries in Each Department

with cte as(
select *, row_number() over(partition by EmployeeID order by salary desc) as rn from Employees1
)
select * from cte 
where rn<=2
order by employeeID,rn;
-- 17. Find the Lowest-Paid Employee in Each Department
with cte as(
select *, min(salary) over(partition by department order by salary) as minx from Employees1
)
select * from cte
where salary=minx


-- 18. Calculate the Running Total of Salaries in Each Department
with cte as(
select*, sum(salary) over (partition by department order by EmployeeID rows unbounded preceding) as running from Employees1
)
select * from cte
order by department,employeeID


-- 19. Find the Total Salary of Each Department Without GROUP BY
with cte as(
select *, sum(salary) over (partition by department) as total from Employees1
)
select * from cte
order by department



-- 20. Calculate the Average Salary in Each Department Without GROUP BY
with cte as (
select*, avg(salary) over(partition by department) as totalavg from EMployees1
)
select * from cte
order by department
-- 21. Find the Difference Between an Employee’s Salary and Their Department’s Average
with cte as(
select*, avg(salary) over (partition by department) as avgdept,
salary - avg(salary) over (partition by department) as salarydiff
from employees1
)
select * from cte
order by department,EmployeeID

-- 22. Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
with cte as(
select *, avg(salary) over(order by employeeID rows between 1 preceding and 1 following) as mov
from Employees1
)
select * from cte
order by employeeID
-- 23. Find the Sum of Salaries for the Last 3 Hired Employees

select  sum(salary) as sumlast
from (
select top 3 salary from employees1
order by hiredate desc
)
as last3
