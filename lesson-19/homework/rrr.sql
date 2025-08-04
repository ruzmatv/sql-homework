-- 1. Create a stored procedure that:

/*
Creates a temp table #EmployeeBonus
Inserts EmployeeID, FullName (FirstName + LastName), Department, Salary, and BonusAmount into it
(BonusAmount = Salary * BonusPercentage / 100)
Then, selects all data from the temp table.
*/

select * from employees
select * from departmentbonus


   ALTER TABLE employees
ADD bonuspercentage DECIMAL(18,2);

UPDATE employees
SET bonuspercentage = 10;

CREATE PROC getemployeebonuses  
AS  
BEGIN
   CREATE TABLE #employees(
       employeeid INT,
       fullname NVARCHAR(100),
       department NVARCHAR(50),
       salary DECIMAL(18,2),
       bonusamount DECIMAL(18,2)
   );

   INSERT INTO #employees(employeeid, fullname, department, salary, bonusamount)
   SELECT 
       employeeid,
       firstname + ' ' + lastname AS fullname,
       department,
       salary,
       salary * bonuspercentage / 100 AS bonusamount
   FROM employees;

   SELECT * FROM #employees;
END;

-- 2. Create a stored procedure that:

/*
Accepts a department name and an increase percentage as parameters
Update salary of all employees in the given department by the given percentage
Returns updated employees from that department.
*/
select * from Products_Current

select * from Products_New


create proc updateproductsfromnew
as
begin
UPDATE pc
SET 
    pc.ProductName = pn.ProductName,
    pc.Price = pn.Price
FROM Products_Current pc
INNER JOIN Products_New pn ON pc.ProductID = pn.ProductID;

INSERT INTO Products_Current (ProductID, ProductName, Price)
SELECT pn.ProductID, pn.ProductName, pn.Price
FROM Products_New pn
LEFT JOIN Products_Current pc ON pn.ProductID = pc.ProductID
WHERE pc.ProductID IS NULL;
select * from product_current;
end;

-- 3. Perform a MERGE operation that:
/*
Updates ProductName and Price if ProductID matches
Inserts new products if ProductID does not exist
Deletes products from Products_Current if they are missing in Products_New
Return the final state of Products_Current after the MERGE.
*/


select * from products_current
select * from Products_new

MERGE INTO Products_Current AS target
USING Products_New AS source
ON target.ProductID = source.ProductID

WHEN MATCHED THEN
    UPDATE SET 
        target.ProductName = source.ProductName,
        target.Price = source.Price

WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price)
    VALUES (source.ProductID, source.ProductName, source.Price)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;


-- 4. Tree Node
/*

Each node in the tree can be one of three types:

"Leaf": if the node is a leaf node.
"Root": if the node is the root of the tree.
"Inner": If the node is neither a leaf node nor a root node.
*/

create table tree(
id int primary key,
p_id int null
);

select 
t.id,
case
 when t.p_id is null then 'root'
 when not exists(select 1 from tree where p_id = t.id) then 'leaf'
 else 'inner'
 end as nodetype
 from tree t;
 INSERT INTO tree (id, p_id) VALUES (1, NULL);
INSERT INTO tree (id, p_id) VALUES (2, 1);
INSERT INTO tree (id, p_id) VALUES (3, 1);
INSERT INTO tree (id, p_id) VALUES (4, 2);
INSERT INTO tree (id, p_id) VALUES (5, 2);

-- 5. Confirmation Rate
/*
Find the confirmation rate for each user. If a user has no confirmation requests, the rate should be 0.
*/

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Signups')
BEGIN
    CREATE TABLE Signups (
        user_id INT,
        time_stamp DATETIME
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Confirmations')
BEGIN
    CREATE TABLE Confirmations (
        user_id INT,
        time_stamp DATETIME,
        action VARCHAR(10) -- 'confirmed' yoki 'timeout'
    );
END

-- Jadvalni tozalash
TRUNCATE TABLE Signups;
TRUNCATE TABLE Confirmations;

-- Ma'lumotlarni kiritish (ISO 8601 formatdan foydalanamiz)
INSERT INTO Signups (user_id, time_stamp) VALUES 
(3, '2020-03-21T10:16:13'),
(7, '2020-01-04T13:57:59'),
(2, '2020-07-29T23:09:44'),
(6, '2020-12-09T10:39:37');

INSERT INTO Confirmations (user_id, time_stamp, action) VALUES 
(3, '2021-01-06T03:30:46', 'timeout'),
(3, '2021-07-14T14:00:00', 'timeout'),
(7, '2021-06-12T11:57:29', 'confirmed'),
(7, '2021-06-13T12:58:28', 'confirmed'),
(7, '2021-06-14T13:59:27', 'confirmed'),
(2, '2021-01-22T00:00:00', 'confirmed'),
(2, '2021-02-28T23:59:59', 'timeout');

-- Har bir foydalanuvchi uchun Confirmation Rate ni hisoblash
SELECT 
    s.user_id,
    COALESCE(
        CAST(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS FLOAT) 
        / NULLIF(COUNT(c.user_id), 0),
    0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id
ORDER BY s.user_id;

-- 6. Find all employees who have the lowest salary using subqueries.

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select * from employees
where SALARY =(select min(salary) from employees)

-- 7. Create a stored procedure called GetProductSalesSummary that:
/*
Accepts a @ProductID input
Returns:
ProductName
Total Quantity Sold
Total Sales Amount (Quantity × Price)
First Sale Date
Last Sale Date
If the product has no sales, return NULL for quantity, total amount, first date, and last date, but still return the product name.
*/

select * from Products
select * from sales

create proc getproductsalessummery
@productid int
as 
begin
select 
      p.productName,
	  sum(s.quantity) as totalquantitysold,
	  sum(s.quantity*p.price) as totalsalesamount,
	  min(s.saledate) as firstsaledate,
	  max(s.saledate) as lastsaledate
	  from Products p
	  left join sales s on p.productid =s.productid
	  where p.productid =@productid
	  group by p.productname;
	  end


