-- 1. Compute Running Total Sales per Customer
select * from sales_data
with cte as(
select customer_id,Order_date,total_amount, sum(total_amount) over(partition by customer_id order by order_date) as run
from sales_data
)
select * from cte
-- 2. Count the Number of Orders per Product Category
select * from sales_data
with cte as (
select product_category, count(quantity_sold) as runtimes
from sales_data
group by Product_category
)
select * from cte
-- 3. Find the Maximum Total Amount per Product Category
select * from sales_data

WITH 
cte AS (
    SELECT 
        product_category, 
        COUNT(quantity_sold) AS runtimess
    FROM sales_data
    GROUP BY product_category
),
ctes AS (
    SELECT 
        product_category,
        MAX(quantity_sold) AS runes
    FROM sales_data
    GROUP BY product_category
)

SELECT 
    cte.product_category,
    cte.runtimess,
    ctes.runes
FROM 
    cte
JOIN 
    ctes ON cte.product_category = ctes.product_category;

-- 4. Find the Minimum Price of Products per Product Category

select * from sales_data

with cte as(
select Product_category, min(unit_price) as runum
from sales_data
group by product_category
)
select * from cte

-- 5. Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)
select * from sales_data
select 
order_Date,
quantity_sold,
round(avg(quantity_sold) over(order by order_date rows between 1 preceding and 1 following),2) as moving 
from sales_data
-- 6. Find the Total Sales per Region
select * from sales_data
with cte as(
select
region,
sum(total_amount) as runtiem
from sales_data
group by region
)
select * from cte

-- 7. Compute the Rank of Customers Based on Their Total Purchase Amount
select * from sales_data
with cte as(
select customer_id,
sum(total_Amount) as total,
rank() over(order by sum(total_amount)desc) as purchase
from sales_data
group by customer_id

)
select * from cte
order by purchase

-- 8. Calculate the Difference Between Current and Previous Sale Amount per Customer
select * from sales_data

with cte as (
select 
customer_id,
order_date,
total_amount,
total_amount -lag(total_amount) over(partition by customer_id order by order_date) as diff
from sales_data
)
select * from cte
order by customer_id,order_Date

-- 9. Find the Top 3 Most Expensive Products in Each Category
select * from sales_data
with cte as(
select 
Product_category,
PRoduct_name,
unit_price,
row_number() over(partition by Product_category order by unit_price desc) as nom
from sales_data

)
select * from cte
where nom <=3
order by product_category,unit_price desc;

-- 10. Compute the Cumulative Sum of Sales Per Region by Order Date

select * from sales_data

with cte as(
select region,order_date,total_amount,sum(total_amount) over(partition by region order by order_date rows between 
unbounded preceding and current row) as cumulative
from sales_data
)
select* from cte
order by region, order_date

-- 11. Compute Cumulative Revenue per Product Category
select * from sales_Data


SELECT
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY product_category
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM sales_data
ORDER BY product_category, order_date;
-- 12. Here you need to find out the sum of previous values. Please go through the sample input and expected output. 
select * from sales_data
SELECT
    customer_id,
    total_amount,
    COALESCE(
        SUM(total_amount) OVER (
            ORDER BY customer_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
        ), 0
    ) AS sum_of_previous
FROM sales_Data
ORDER BY customer_id;

-- 13. Sum of Previous Values to Current Value

select * from sales_Data
select 
customer_id,
total_amount,
sum(total_amount) over (order by customer_id rows unbounded preceding) as sum_of
from sales_data
order by customer_id
-- 14. Find customers who have purchased items from more than one product_category

select * from sales_data
select customer_id from sales_data
group by customer_id
having count(distinct Product_category)>1;

-- 15. Find Customers with Above-Average Spending in Their Region
WITH customer_totals AS (
    SELECT
        customer_id,
        region,
        SUM(total_amount) AS total_spent
    FROM sales_data
    GROUP BY customer_id, region
),
region_avg AS (
    SELECT
        region,
        AVG(total_spent) AS avg_spent
    FROM customer_totals
    GROUP BY region
)
SELECT
    ct.customer_id,
    ct.region,
    ct.total_spent
FROM customer_totals ct
JOIN region_avg ra ON ct.region = ra.region
WHERE ct.total_spent > ra.avg_spent
ORDER BY ct.region, ct.total_spent DESC;


-- 16. Rank customers based on their total spending (total_amount) within each region. If multiple customers have the same spending, they should receive the same rank.

SELECT
    customer_id,
    region,
    total_spent,
    RANK() OVER (
        PARTITION BY region
        ORDER BY total_spent DESC
    ) AS rank_in_region
FROM (
    SELECT
        customer_id,
        region,
        SUM(total_amount) AS total_spent
    FROM sales_data
    GROUP BY customer_id, region
) AS customer_totals
ORDER BY region, rank_in_region;
-- 17. Calculate the running total (cumulative_sales) of total_amount for each customer_id, ordered by order_date.

select 
customer_id,
order_date,
total_amount,
sum(total_amount) over(partition by customer_id order by order_date 
rows between unbounded preceding and current row) as cum
from sales_data
order by customer_id,order_date
-- 18. Calculate the sales growth rate (growth_rate) for each month compared to the previous month.

WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', order_date) AS sales_month,
        SUM(total_amount) AS total_sales
    FROM sales_data
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
    sales_month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY sales_month) AS prev_month_sales,
    ROUND(
        CASE
            WHEN LAG(total_sales) OVER (ORDER BY sales_month) IS NULL THEN NULL
            ELSE (total_sales - LAG(total_sales) OVER (ORDER BY sales_month)) * 100.0 / LAG(total_sales) OVER (ORDER BY sales_month)
        END
    , 2) AS growth_rate
FROM monthly_sales
ORDER BY sales_month;
-- 19. Identify customers whose total_amount is higher than their last order''s total_amount.(Table sales_data)

WITH last_order AS (
    SELECT
        customer_id,
        total_amount AS last_order_amount
    FROM sales_data s1
    WHERE order_date = (
        SELECT MAX(order_date)
        FROM sales_data s2
        WHERE s2.customer_id = s1.customer_id
    )
),
total_spent AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_amount_sum
    FROM sales_data
    GROUP BY customer_id
)
SELECT
    t.customer_id,
    t.total_amount_sum,
    l.last_order_amount
FROM total_spent t
JOIN last_order l ON t.customer_id = l.customer_id
WHERE t.total_amount_sum > l.last_order_amount;
-- 20. Identify Products that prices are above the average product price
select * from sales_data
where unit_price>(select avg(unit_price) from sales_data)

-- 21. In this puzzle you have to find the sum of val1 and val2 for each group and put that value at the beginning of the group in the new column. The challenge here is to do this in a single select. For more details please see the sample input and expected output.
SELECT
    customer_id,
    product_category,
    total_amount,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) = 1 THEN
            SUM(total_amount) OVER (PARTITION BY customer_id)
        ELSE NULL
    END AS sum_total_amount_first_row
FROM sales_data
ORDER BY customer_id, order_date;

-- 22. Here you have to sum up the value of the cost column based on the values of Id. For Quantity if values are different then we have to add those values.Please go through the sample input and expected output for details.
select
customer_id,
sum(total_amount) as total_am,
sum(quantity_sold) as quan_t
from sales_data
group by customer_id


-- 23. From following set of integers, write an SQL statement to determine the expected outputs
WITH Bounds AS (
    SELECT MIN(SeatNumber) AS MinSeat, MAX(SeatNumber) AS MaxSeat FROM Seats
),
AllSeats AS (
    SELECT MinSeat AS SeatNumber FROM Bounds
    UNION ALL
    SELECT SeatNumber + 1 FROM AllSeats, Bounds WHERE SeatNumber < Bounds.MaxSeat
),
Gaps AS (
    SELECT SeatNumber
    FROM AllSeats
    WHERE SeatNumber NOT IN (SELECT SeatNumber FROM Seats)
),
GroupedGaps AS (
    SELECT
        SeatNumber,
        SeatNumber - ROW_NUMBER() OVER (ORDER BY SeatNumber) AS grp
    FROM Gaps
)
SELECT
    MIN(SeatNumber) AS [Gap Start],
    MAX(SeatNumber) AS [Gap End]
FROM GroupedGaps
GROUP BY grp
ORDER BY [Gap Start]
OPTION (MAXRECURSION 0);
