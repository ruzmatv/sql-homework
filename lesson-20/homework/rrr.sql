-- 1. Find customers who purchased at least one item in March 2024 using EXISTS


select distinct s1.customerName from #sales s1
where exists(select 1  from #sales s2
where s2.customerName =s1.customername
and s2.saledate>='2024-03-01'
and s2.saledate<='2024-04-01'
);

-- 2. Find the product with the highest total sales revenue using a subquery.

select product,totalrevenue from (
select product,sum(quantity*price)as totalrevenue
from #sales
group by product
) as revenueperproduct
where  totalrevenue =(
select max(total)
from(
select sum(quantity*price) as total
from #sales
group by Product
) as totalproduct
);


-- 3. Find the second highest sale amount using a subquery

select max (saleamount)as secondr
from(
select quantity*price as saleamount
from #sales
) as saleamounts
where saleamount<(select max(quantity*price) from #sales
);

-- 4. Find the total quantity of products sold per month using a subquery
select * from #sales

select salemonth,sum(quantity) as total
from(
select  format(saledate,'yyyy-mm')as salemonth,quantity
from #sales
) as monthlysales
group by salemonth
order by salemonth

-- 5. Find customers who bought same products as another customer using EXISTS
select distinct s1.customerName

from #sales s1
where exists(select 1 from #sales s2
where s1.product=s2.product
and s1.customerName<>s2.customerName
);

-- 6.  Return how many fruits does each person have in individual fruit level
select name,fruit,count(*)as total 
from fruits
group by name, fruit
order by name, fruit


-- 7. Return older people in the family with younger ones
select * from family
select distinct parentID as olderperson,childID as youngerPerson from family


-- 8. Write an SQL statement given the following requirements. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas
select * from #orders

select * from customerOrders as tx
where tx.deliverystate ='tx'
and exists(
select 1 from customerOrders as ca
where ca.customerId =tx.customerID
and ca.deliverystate='ca'
);


-- 9. Insert the names of residents if they are missing
select * from #residents
IF NOT EXISTS (
    SELECT 1 FROM #Residents WHERE fullName = 'Ali'
)
BEGIN
    INSERT INTO #Residents (fullName) VALUES ('Ali');
END;


-- 10. Write a query to return the route to reach from Tashkent to Khorezm. The result should include the cheapest and the most expensive routes
select * from #routes

select  * from(select top 1 * from #routes  
where departurecity ='tashkent' and arrivalcity = 'khorezm'
order by cost asc
) as cheapestroute

union all

select *  from (select top 1 * from #routes
where departurecity ='tashkent' and arrivalcity='khorezm'
order by cost desc 
) as mostexpensiveroute

-- 11. Rank products based on their order of insertion.
select * from #RankingPuzzle

select id, vals, 
sum(case when vals ='product' then 1 else 0 end)
over (order by id rows between unbounded preceding and current row)
as productrank
from #RankingPuzzle


-- 12. Find employees whose sales were higher than the average sales in their department
select * from #employeesales 
where  salesamount > (select avg(salesamount) from  #employeesales)


-- 13. Find employees who had the highest sales in any given month using EXISTS
SELECT ES1.EmployeeID, ES1.EmployeeName, ES1.Department, ES1.SalesAmount, ES1.SalesMonth, ES1.SalesYear
FROM #EmployeeSales ES1
WHERE EXISTS (
    SELECT 1
    FROM #EmployeeSales ES2
    WHERE ES2.SalesYear = ES1.SalesYear
      AND ES2.SalesMonth = ES1.SalesMonth
    GROUP BY ES2.SalesYear, ES2.SalesMonth
    HAVING MAX(ES2.SalesAmount) = ES1.SalesAmount
);




-- 14. Find employees who made sales in every month using NOT EXISTS
SELECT DISTINCT ES1.EmployeeID, ES1.EmployeeName
FROM #EmployeeSales ES1
WHERE NOT EXISTS (
    SELECT 1
    FROM (
        SELECT DISTINCT SalesYear, SalesMonth FROM #EmployeeSales
    ) AS AllMonths
    WHERE NOT EXISTS (
        SELECT 1
        FROM #EmployeeSales ES2
        WHERE ES2.EmployeeID = ES1.EmployeeID
          AND ES2.SalesYear = AllMonths.SalesYear
          AND ES2.SalesMonth = AllMonths.SalesMonth
    )
);


-- 15. Retrieve the names of products that are more expensive than the average price of all products.
select * from Products

select Name from products
where price >(select avg(price) from Products)



-- 16. Find the products that have a stock count lower than the highest stock count.
select name,stock from products
where stock<(select max(stock) from Products)

-- 17. Get the names of products that belong to the same category as 'Laptop'.
select name  from products
where category =(select category from products 
where name ='laptop')
and name <> 'laptop';


-- 18. Retrieve products whose price is greater than the lowest price in the Electronics category.
select category,price from Products
where price > ( select min(price) from Products
where category ='electronics');



-- 19. Find the products that have a higher price than the average price of their respective category.
select category , price from Products p1
where price > ( select avg(price) from Products p2
where p2.category = p1.category );



-- 20. Find the products that have been ordered at least once.
select name from products p
where exists(select 1 from  orders o
where o.productID =p.productID
);

-- 21. Retrieve the names of products that have been ordered more than the average quantity ordered.
select * from products
select * from orders

select p.name from products p
join(select productID,sum(quantity) as total
from orders
group by productID
)
o on p.productID =o.productID
where o.total > (select avg(totalquantity) from (select sum(quantity) as totalquantity from orders
group by productID
) as producttotals
);

-- 22. Find the products that have never been ordered.
select name from products p
where not exists(select 1 from orders o
where o.productID=p.productId);


-- 23. Retrieve the product with the highest total quantity ordered. 
SELECT TOP 1 P.Name, SUM(O.Quantity) AS TotalQuantity
FROM Products P
JOIN Orders O ON P.ProductID = O.ProductID
GROUP BY P.Name
ORDER BY TotalQuantity DESC;
