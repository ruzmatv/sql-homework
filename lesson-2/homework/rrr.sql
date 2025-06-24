
-- 1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).

create database lesson2

use lesson2

create table Employees (
    EmpID INT,          
    Name VARCHAR(50),    
    Salary DECIMAL(10,2)
)

-- 2.  Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).

insert into Employees(EmpID, Name, Salary)
values 
     (1,'Rashidov Asror', 2400),
	 (2,'Qodirov Abror', 3500),
	 (3,'Qosimov Rashid', 4500),
	 (4,'Umrzoqov Asliddin', 6500);
	
	--DELETE FROM Employees
    --WHERE  EmpID = 1



-- 3. Update the Salary of an employee to 7000 where EmpID = 1.

UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1

-- 4. Delete a record from the Employees table where EmpID = 2.

delete from Employees
where  EmpID = 2

-- 5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.

delete  "malum yozuvlarni o'chiradi qaytarilishi mumkin tuzilma qoladi."

truncate "barcha yozuvlarni tez o'chiradi qaytarilishi qiyin tuzilma qoladi."

drop "butun jadvalni yoki obyektni butunlay yo'q qiladi."

-- 6. Modify the Name column in the Employees table to VARCHAR(100).

alter table Employees                                                                       select * from Employees
alter column Name VARCHAR(100);

-- 7. Add a new column Department (VARCHAR(50)) to the Employees table.

alter table Employees
add department VARCHAR(50);

-- 8. Change the data type of the Salary column to FLOAT

alter table Employees                                    select * from Employees
alter column Salary float;

-- 9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).

  CREATE TABLE Departments (                             select * from Departments
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 10. Remove all records from the Employees table without deleting its structure.

delete * from Employees
truncate table Employees

-- 11. Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).

INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'Buxgalteriya' union all
SELECT 2, 'Marketing' union all
SELECT 3, 'IT Bolimi' union all
SELECT 4, 'Kadrlar' union all
SELECT 5, 'Savdo-sotiq';

-- 12. Update the Department of all employees where Salary > 5000 to 'Management'.

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

-- 13. Write a query that removes all employees but keeps the table structure intact.

delete * from Employees

-- 14. Drop the Department column from the Employees table.

alter table Employees
drop table Department;

-- 15. Rename the Employees table to StaffMembers using SQL commands.

update Employees
set Name  = 'StaffMembers'

-- 16. Write a query to completely remove the Departments table from the database.

drop table  Departments

-- 17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),                       select * from Products
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT,
    Supplier VARCHAR(100)
);

-- 18. Add a CHECK constraint to ensure Price is always greater than 0.
           
alter table Products
add constraint  chk_price_positive check (Price > 0);

-- 19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.

alter table Products
add StockQuantity int default 50;

-- 20. Rename Category to ProductCategory.

alter table Products
change column Category ProductCategory VARCHAR(50);

-- 21. Insert 5 records into the Products table using standard INSERT INTO queries.

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity, Supplier)
VALUES (1, 'Smartphone', 'Elektronika', 299.99, 100, 'TechCorp');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity, Supplier)
VALUES (2, 'Laptop', 'Elektronika', 899.50, 50, 'CompWorld');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity, Supplier)
VALUES (3, 'Coffee Maker', 'Maishiy texnika', 75.00, 70, 'HomeGoods');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity, Supplier)
VALUES (4, 'Desk Chair', 'Mebel', 120.00, 40, 'FurniCo');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity, Supplier)
VALUES (5, 'Bluetooth Speaker', 'Elektronika', 45.75, 80, 'SoundMax');

-- 22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.

SELECT *
INTO Products_Backup
FROM Products;

-- 23. Rename the Products table to Inventory.

EXEC sp_rename 'Products', 'Inventory';

-- 24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.

alter table Inventory
alter column Price float;

-- 25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.

create table Inventory_New (
    ProductCode int identity(1000,5) primary key,
    ProductID int,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price float,
    StockQuantity int,
    Supplier VARCHAR(100)
);
