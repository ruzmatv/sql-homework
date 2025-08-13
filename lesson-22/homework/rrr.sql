-- 1. Compute Running Total Sales per Customer

select * from sales_data

SELECT
  customer_id,
  order_date,
  total_amount,
  SUM(total_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM sales_data;

-- 2. Count the Number of Orders per Product Category

select * from sales_data

select 
Product_category,
count(sale_id) as orders from sales_data
group by Product_category,

-- 3. Find the Maximum Total Amount per Product Category
select * from sales_data
select 
Product_category,
max(total_amount) as maxix
from sales_data
group by Product_category


-- 4. Find the Minimum Price of Products per Product Category
select * from sales_data
select 
Product_category,
min(unit_price)as minix
from sales_data

group by Product_category

-- 5. Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)
select * from sales_data
select
order_date,
total_amount,
avg(total_amount) over(order by order_date rows between 1 preceding and  1 following)
AS moving
from sales_data


-- 6. Find the Total Sales per Region

select * from sales_data

select
region,
sum(total_amount) as summa from sales_data
group by region
-- 7. Compute the Rank of Customers Based on Their Total Purchase Amount
select * from sales_data
select 
customer_id,
sum(total_amount) as total_amounts
from sales_data
group by customer_id;

select 
customer_id,
sum(total_amount) as total_p,
rank() over(order by sum(total_amount) desc) 
as customer_r
from sales_data
group by customer_id
-- 8. Calculate the Difference Between Current and Previous Sale Amount per Customer
select * from sales_data
select
customer_id,
order_date,
total_amount,
total_amount - lag(total_amount) over(partition by customer_id order by order_date)
as diff from sales_data


-- 9. Find the Top 3 Most Expensive Products in Each Category
select * from sales_data
select
Product_category,
max(total_amount) as totalr from sales_data
group by Product_category


-- 10. Compute the Cumulative Sum of Sales Per Region by Order Date
select * from sales_data
select 
region,
order_date,
total_amount,
sum(total_amount) over(partition by region order by order_date rows between 
unbounded preceding and current row)
as cumulative from sales_data
order by region,order_date


-- 11. Compute Cumulative Revenue per Product Category
select * from sales_data
select
Product_category,
order_date,
total_amount,
sum(total_amount)over(partition by Product_category order by order_date
rows between unbounded Preceding and current row ) as cum
from sales_data
order by Product_category,order_date


-- 12. Here you need to find out the sum of previous values. Please go through the sample input and expected output.
select * from sales_data
select 
order_date,
total_amount,
coalesce(sum(total_amount) over( order by order_date rows between unbounded preceding and 1 Preceding),0)as sum_of
from sales_data
order by order_date


-- 13. Sum of Previous Values to Current Value

select 
order_date,
total_amount,
sum(total_amount) over(order by order_date rows between unbounded preceding and current row) as sm_p
from sales_data
order by order_date
-- 14. Find customers who have purchased items from more than one product_category
select 
customer_id from sales_data
group by customer_id
having count(distinct Product_category)>1

-- 15. Find Customers with Above-Average Spending in Their Region
with cte as(
select customer_id,
region,
sum(total_amount)  as total_avg from sales_data
group by customer_id,region
)
select * from cte

select 
region,
avg(total_avg) as avg_price from(
select 
customer_id,
region,
sum(total_amount) as totalt from sales_data
group by customer_id,region)
as customer_total
group by region


-- 16. Rank customers based on their total spending (total_amount) within each region. If multiple customers have the same spending, they should receive the same rank.
select * from sales_data
select 
customer_id,
region,
total_amount,
rank() over(partition by region order by total_amount desc) as ranked
from sales_data


-- 17. Calculate the running total (cumulative_sales) of total_amount for each customer_id, ordered by order_date.
select * from sales_data
select
customer_id,
order_date,
total_amount,
sum(total_amount) over(partition by customer_id order by order_date) as summ
from sales_data


-- 18. Calculate the sales growth rate (growth_rate) for each month compared to the previous month.
select * from sales_data
select 
order_date,
quantity_sold,
(quantity_sold -lag(quantity_sold) over(order by order_date))
/ lag(quantity_sold) over(order by order_date) as growth from sales_data.

-- 19. Identify customers whose total_amount is higher than their last order''s total_amount.(Table sales_data)
select * from sales_data
select 
customer_id,
order_date,
total_amount,
prev_total
from(
select 
customer_id,
order_date,
total_amount,
lag(total_amount) over(partition by customer_id order by order_date) as prev_total
from sales_data
) as sub
where total_amount>prev_total


-- 20. Identify Products that prices are above the average product pric
select * from  sales_data
select 
customer_id,
Product_name,
unit_price
from sales_data
where 
     unit_price>(select avg(unit_price) from sales_data);



-- 21. In this puzzle you have to find the sum of val1 and val2 for each group and put that value at the beginning of the group in the new column. The challenge here is to do this in a single select. For more details please see the sample input and expected output.
select * from sales_data
SELECT 
    customer_id,
    val1,
    val2,
    CASE 
        WHEN row_num = 1 THEN group_sum
        ELSE NULL
    END AS group_sum
FROM (
    SELECT 
        customer_id,
        val1,
        val2,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) AS row_num,
        SUM(val1 + val2) OVER (PARTITION BY customer_id) AS group_sum
    FROM 
        sales_data
) AS sub;
-- 22. Here you have to sum up the value of the cost column based on the values of Id. For Quantity if values are different then we have to add those values.Please go through the sample input and expected output for details.
select * from thesumpuzzle
SELECT 
    Id,
    SUM(cost) AS total_cost,
    SUM(DISTINCT Quantity) AS total_quantity
FROM 
  thesumpuzzle
GROUP BY 
    Id;


-- 23. From following set of integers, write an SQL statement to determine the expected outputs
select * from seats
SELECT 
    COUNT(*) AS total_numbers,
    SUM(seatnumber) AS sum_of_numbers,
    AVG(seatnumber) AS average_number
FROM seats

