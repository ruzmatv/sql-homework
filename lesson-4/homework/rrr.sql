-- 1. Write a query to select the top 5 employees from the Employees table.

create database les1
use les1
create table workers(empID int,name varchar(50),age int)
select * from workers
insert into workers 
values
(1,'Nodir',23),
(2,'Umid',34),
(3,'rustam',32),
(4,'ali',25),
(5,'furqat',43),
(6,'elyor',31),
(7,'raim',32);

SELECT TOP 5 * FROM workers
ORDER BY name DESC;

-- 2. Use SELECT DISTINCT to select unique Category values from the Products table.

create table mahsulotlar(product_id int, products varchar(40),price int)
select * from mahsulotlar

insert into mahsulotlar
values
(1,'olma',23000),
(2,'ananas',21000),
(3,'kivi',12000),
(4,'anor',43000),
(5,'nok',54000);
SELECT DISTINCT products
FROM mahsulotlar;

-- 3. Write a query that filters the Products table to show products with Price > 100.

create table mahsulot(product_id int, products varchar(40),price int)
select * from mahsulot

insert into mahsulot
values
(1,'olma',239),
(2,'ananas',21),
(3,'kivi',121),
(4,'anor',443),
(5,'nok',23);
select * from mahsulot
where price>100;.

-- 4. Write a query to select all Customers whose FirstName start with 'A' using the LIKE operator.

create table worker(empID int,name varchar(50),age int)
select * from worker
insert into worker
values
(1,'Nodir',23),
(2,'Asror',34),
(3,'rustam',32),
(4,'ali',25),
(5,'furqat',43),
(6,'akobir',31),
(7,'raim',32);

select *from worker
where name like 'A%';

-- 5. Order the results of a Products table by Price in ascending order.

create table mahsulot_1(product_id int, products varchar(40),price int)
select * from mahsulot_1

insert into mahsulot_1
values
(1,'olma',239),
(2,'ananas',21),
(3,'kivi',121),
(4,'anor',443),
(5,'nok',23);

select * from mahsulot_1
order by price asc;

-- 6. Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.

create table work(empID int,name varchar(50),age int,salary int,department varchar(30))
select*from work

insert into work
values
(1,'shokir',21,67000,'HR'),
(2,'ali',32,67000,'market'),
(3,'umida',23,76000,'runner'),
(4,'muslima',19,55000,'kassir'),
(5,'muhammad',33,60000,'HR');

select * from work
where salary >=60000
and department='HR';

-- 7. Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table

create table employed(employeeID int , firstname varchar(30),lastname varchar(40),salary int,department varchar(50),email varchar(20))
select * from employed

insert into employed
values
(1,'ali','amirov',2300,'HR',NULL),
(2,'maqsud','ashrafov',3400,'market','maqsud@gmail.com'),
(3,'asror','yorqulov',2301,'kassir','asrory@gmail.com'),
(4,'mohina','masudjanova',4300,'runner',NULL),
(5,'umida','umrzoqov',5600,'HR','umi@gmail.com')

select
employeeID,
firstname,
lastname,
salary,
department,
isnull(email, 'no_email@gmail.com')as email 
from employed

-- 8. Write a query that shows all products with Price BETWEEN 50 AND 100.

create table pprice(ID int, price integer)
select * from pprice
insert into pprice
values
(1,23),
(2,45),
(3,76),
(4,58),
(5,34),
(6,89),
(7,21);

select * from pprice
where price between 50 and 100

-- 9. Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.

create table vegetables(id int, category varchar(100), productname varchar(50), price decimal(10,2))

select * from vegetables

insert into vegetables
values
(1,'sharbat','ranner',123.3),
(2,'anor','kassir',234.2),
(3,'nokli sok','sharbatchi',2134.3),
(4,'banan','bananchi',345.21),
(5,'olcha','bogbon',23.45);

select distinct category,productname
from vegetables
order by productname desc;

-- 10. After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.


create table vegetable(id int, category varchar(100), productname varchar(50), price decimal(10,2))

select * from vegetable

insert into vegetable
values
(1,'sharbat','ranner',123.3),
(2,'anor','kassir',234.2),
(3,'nokli sok','sharbatchi',2134.3),
(4,'banan','bananchi',345.21),
(5,'olcha','bogbon',23.45);

select distinct category,productname
from vegetable
order by productname desc;

-- 11. Write a query to select the top 10 products from the Products table, ordered by Price DESC.

create table mahsulot_2(product_id int, products varchar(40),price int)
select * from mahsulot_2

insert into mahsulot_2
values
(1,'olma',239),
(2,'ananas',21),
(3,'kivi',121),
(4,'anor',443),
(5,'nok',23),
(6,'olcha',34),
(7,'malina',23),
(8,'mango',45),
(9,'marakuya',32),
(10,'shaftoli',456);

SELECT TOP 10 *
FROM mahsulot_2
ORDER BY price DESC;

-- 12. Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.

create table nrw1(employeID int, firstname varchar(50),lastname varchar(100),salary int,displayname varchar(50),department varchar(40))
select * from nrw1

insert into nrw1
values
(1,null,'ruzmatv',234.4,'rrr','HR'),
(2,'munira','rashidova',345.2,'aaa','kassa'),
(3,'asila',null,436.1,'eee','marketolog'),
(4,null,'hoshimova',456.3,'sss','meneger');

SELECT 
  employeID,
  COALESCE(firstName, lastName) AS displayname,
  salary,
  department
FROM nrw1;

-- 13. Write a query that selects distinct Category and Price from the Products table.


create table vegetableg(id int, category varchar(100), productname varchar(50), price decimal(10,2))

select * from vegetableg

insert into vegetableg
values
(1,'sharbat','ranner',123.3),
(2,'anor','kassir',234.2),
(3,'nokli sok','sharbatchi',2134.3),
(4,'banan','bananchi',345.21),
(5,'olcha','bogbon',23.45);

select distinct category,productname
from vegetableg;

-- 14. Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.

create table emptyed(id int, age int,department varchar(50))


insert into emptyed
values
(1,34,'marketing'),
(2,56,'kassir'),
(3,35,'marketing'),
(4,39,'runner'),
(5,46,'director');

select *from emptyed
where (age between 30 and 40)
or department ='marketing';

-- 15. Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC

CREATE TABLE Employing (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50)
);
INSERT INTO Employing (EmployeeID, FirstName, LastName, Age, Salary, Department) VALUES
(1, 'Ali', 'Karimov', 31, 65000, 'IT'),
(2, 'Umida', 'Tursunova', 28, 72000, 'HR'),
(3, 'Shokir', 'Nematov', 35, 80000, 'Finance'),
(4, 'Muslima', 'Yuldasheva', 26, 54000, 'Marketing'),
(5, 'Asad', 'Salimov', 39, 69000, 'Sales'),
(6, 'Dilnoza', 'Xoliqova', 24, 58000, 'Support'),
(7, 'Muhammad', 'Sobirov', 33, 90000, 'IT'),
(8, 'Zafar', 'Qurbonov', 38, 61000, 'Marketing'),
(9, 'Nilufar', 'Shodieva', 29, 63000, 'HR'),
(10, 'Sarvar', 'Abdullaev', 30, 50000, 'Finance'),
(11, 'Komil', 'Xamidov', 36, 62000, 'Sales'),
(12, 'Madina', 'Sattorova', 27, 55000, 'Support'),
(13, 'Sherzod', 'Toirov', 32, 75000, 'IT'),
(14, 'Rayhon', 'Sodiqova', 34, 67000, 'Marketing'),
(15, 'Ziyod', 'Ismoilov', 40, 70000, 'Finance'),
(16, 'Kamola', 'Ergasheva', 25, 53000, 'Support'),
(17, 'Javohir', 'Murodov', 30, 60000, 'Sales'),
(18, 'Aziza', 'Xolmirzayeva', 37, 72000, 'HR'),
(19, 'Bekzod', 'Nasriddinov', 29, 66000, 'IT'),
(20, 'Malika', 'Raximova', 26, 51000, 'Marketing'),
(21, 'Otabek', 'Rashidov', 31, 80000, 'Finance'),
(22, 'Zarina', 'Olimova', 27, 68000, 'Support');

SELECT *
FROM Employing
ORDER BY Salary DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

-- 16. Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Laptop Bag', 'Accessories', 850.00, 120),
(2, 'Wireless Mouse', 'Electronics', 450.00, 80),
(3, 'Smartphone', 'Electronics', 1200.00, 30),
(4, 'Notebook', 'Stationery', 25.00, 200),
(5, 'Pen Set', 'Stationery', 15.00, 45),
(6, 'Bluetooth Speaker', 'Electronics', 950.00, 55),
(7, 'Office Chair', 'Furniture', 980.00, 65),
(8, 'Desk Lamp', 'Furniture', 500.00, 70),
(9, 'USB Flash Drive', 'Electronics', 300.00, 150),
(10, 'Monitor', 'Electronics', 1050.00, 40);

SELECT *
FROM Products
WHERE Price <= 1000
  AND Stock > 50
ORDER BY Stock ASC;

-- 17. Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.

create table usman(
EmpID integer,
Fullname varchar(50),
Productname varchar(100)
);
insert into usman(EmpID,Fullname,Productname) values
(1,'shokirov asror','mercedes benz'),
(2,'asadova mohira','macleren'),
(3,'uzoqov ozod','bmw'),
(4,'shousmonov nuriddin','bugatti chiron'),
(5,'qodirov rashid','mercedes benz G63');

select * from usman
where Productname like '%e%';

-- 18. Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.

create table duman(
EmpID integer,
salary int,
department varchar(100)
);


insert into duman(EmpID,salary,department)VALUES
(1,1200,'finance'),
(2,3400,'IT'),
(3,4500,'HR'),
(4,4600,'manager'),
(5,5600,'director'),
(6,8600,'smm'),
(7,3420,'HR'),
(8,2100,'IT'),
(9,7800,'security');

select*from duman
where department in ('HR','IT','FINANCE');

-- 19. Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'janesmith@yahoo.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Alice', 'Johnson', 'alicej@outlook.com', '555-3456', '789 Pine St', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(4, 'Bob', 'Brown', 'bobbrown@hotmail.com', '555-4567', '101 Maple St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(5, 'Charlie', 'Davis', 'charliedavis@gmail.com', '555-5678', '202 Birch St', 'Sydney', 'NSW', '2000', 'Australia'),
(6, 'David', 'Martinez', 'davidm@live.com', '555-6789', '303 Cedar St', 'Melbourne', 'VIC', '3000', 'Australia'),
(7, 'Emily', 'Garcia', 'emilyg@yahoo.com', '555-7890', '404 Redwood St', 'London', 'England', 'SW1A 1AA', 'UK'),
(8, 'Frank', 'Hernandez', 'frankh@outlook.com', '555-8901', '505 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(9, 'Grace', 'Lopez', 'gracel@gmail.com', '555-9012', '606 Aspen St', 'Birmingham', 'England', 'B1 1AA', 'UK'),
(10, 'Helen', 'Gonzalez', 'heleng@yahoo.com', '555-0123', '707 Fir St', 'Berlin', 'BE', '10117', 'Germany'),
(11, 'Irene', 'Perez', 'irenep@hotmail.com', '555-1234', '808 Maple Ave', 'Munich', 'BY', '80331', 'Germany'),
(12, 'Jack', 'Wilson', 'jackw@live.com', '555-2345', '909 Oak Ave', 'Hamburg', 'HH', '20095', 'Germany'),
(13, 'Kim', 'Anderson', 'kima@gmail.com', '555-3456', '111 Pine Ave', 'Paris', '�le-de-France', '75001', 'France'),
(14, 'Liam', 'Thomas', 'liamt@yahoo.com', '555-4567', '222 Cedar Ave', 'Lyon', 'Auvergne-Rh�ne-Alpes', '69001', 'France'),
(15, 'Megan', 'Taylor', 'megant@outlook.com', '555-5678', '333 Redwood Ave', 'Marseille', 'Provence-Alpes-C�te Azur', '13001', 'France'),
(16, 'Nathan', 'Moore', 'nathanm@hotmail.com', '555-6789', '444 Willow Ave', 'Tokyo', 'TK', '100-0001', 'Japan'),
(17, 'Olivia', 'Jackson', 'oliviaj@gmail.com', '555-7890', '555 Birch Ave', 'Osaka', 'OS', '530-0001', 'Japan'),
(18, 'Paul', 'White', 'paulw@yahoo.com', '555-8901', '666 Maple Blvd', 'Kyoto', 'KY', '600-8001', 'Japan'),
(19, 'Quincy', 'Lee', 'quincyl@outlook.com', '555-9012', '777 Oak Blvd', 'Seoul', 'SO', '04547', 'South Korea'),
(20, 'Rachel', 'Harris', 'rachelh@hotmail.com', '555-0123', '888 Pine Blvd', 'Busan', 'BU', '48058', 'South Korea'),
(21, 'Sam', 'Clark', 'samc@gmail.com', '555-1234', '999 Cedar Blvd', 'Incheon', 'IC', '22382', 'South Korea'),
(22, 'Tina', 'Allen', 'tinaallen@yahoo.com', '555-2345', '1010 Redwood Blvd', 'Mexico City', 'CMX', '01000', 'Mexico'),
(23, 'Ursula', 'Scott', 'ursulas@outlook.com', '555-3456', '1111 Willow Blvd', 'Guadalajara', 'JAL', '44100', 'Mexico'),
(24, 'Victor', 'Adams', 'victora@hotmail.com', '555-4567', '1212 Birch Blvd', 'Monterrey', 'NLE', '64000', 'Mexico'),
(25, 'Walter', 'Baker', 'walterb@live.com', '555-5678', '1313 Oak Blvd', 'New York', 'NY', '10001', 'USA'),
(26, 'Xander', 'Nelson', 'xandern@gmail.com', '555-6789', '1414 Cedar Blvd', 'Los Angeles', 'CA', '90001', 'USA'),
(27, 'Yvonne', 'Carter', 'yvonnec@yahoo.com', '555-7890', '1515 Maple Dr', 'Chicago', 'IL', '60601', 'USA'),
(28, 'Zane', 'Mitchell', 'zanem@outlook.com', '555-8901', '1616 Redwood Dr', 'Houston', 'TX', '77001', 'USA'),
(29, 'Anna', 'Roberts', 'annar@hotmail.com', '555-9012', '1717 Willow Dr', 'Sydney', 'NSW', '2000', 'Australia'),
(30, 'Ben', 'King', 'benk@live.com', '555-0123', '1818 Birch Dr', 'Melbourne', 'VIC', '3000', 'Australia'),
(31, 'Chloe', 'Green', 'chloeg@gmail.com', '555-1234', '1919 Oak Dr', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(32, 'Daniel', 'Evans', 'daniele@yahoo.com', '555-2345', '2020 Cedar Dr', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(33, 'Ella', 'Collins', 'ellac@outlook.com', '555-3456', '2121 Redwood Dr', 'London', 'England', 'SW1A 1AA', 'UK'),
(34, 'Finn', 'Morris', 'finnm@hotmail.com', '555-4567', '2222 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(35, 'Grace', 'Lee', 'gracel@live.com', '555-5678', '2323 Birch St', 'Berlin', 'BE', '10117', 'Germany'),
(36, 'Holly', 'Martinez', 'hollym@gmail.com', '555-6789', '2424 Oak St', 'Munich', 'BY', '80331', 'Germany'),
(37, 'Ian', 'Robinson', 'ianr@yahoo.com', '555-7890', '2525 Cedar St', 'Warsaw', 'WA', '00-001', 'Poland'),
(38, 'Jasmine', 'Walker', 'jasminew@outlook.com', '555-8901', '2626 Redwood St', 'Lisbon', 'LI', '1100-148', 'Portugal'),
(39, 'Kyle', 'Young', 'kyley@hotmail.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201','USA'),
(40, 'Liam', 'Harris', 'liamh@live.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220','USA');

SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;

-- 20. Write a query that selects the top 5 products with the highest sales, using TOP(5) and ordered by SalesAmount DESC.

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);


select top  (5)*
from Sales
order by SaleAmount desc;

-- 21. Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)

CREATE TABLE Employes (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NULL,
    LastName VARCHAR(50) NULL,
    DepartmentName VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    Age INT,
    Email VARCHAR(100) NULL,
    Country VARCHAR(50)
);

INSERT INTO Employes(EmployeeID, FirstName, LastName, DepartmentName, Salary, HireDate, Age, Email, Country) VALUES
(1, 'John', 'Doe', 'IT', 55000.00, '2020-01-01', 30, 'johndoe@example.com', 'USA'),
(2, 'Jane', 'Smith', 'HR', 65000.00, '2019-03-15', 28, 'janesmith@example.com', 'USA'),
(3, NULL, 'Johnson', 'Finance', 45000.00, '2021-05-10', 25, NULL, 'Canada'),
(4, 'James', 'Brown', 'Marketing', 60000.00, '2018-07-22', 35, 'jamesbrown@example.com', 'UK'),
(5, 'Patricia', NULL, 'HR', 70000.00, '2017-08-30', 40, NULL, 'USA'),
(6, 'Michael', 'Miller', 'IT', 75000.00, '2020-12-12', 27, 'michaelm@example.com', 'Germany'),
(7, 'Linda', NULL, 'Finance', 48000.00, '2016-11-02', 42, NULL, 'Canada'),
(8, 'David', 'Moore', 'Marketing', 85000.00, '2021-09-01', 29, 'davidm@example.com', 'UK'),
(9, 'Elizabeth', 'Taylor', 'HR', 60000.00, '2019-05-18', 31, 'elizabetht@example.com', 'USA'),
(10, 'William', NULL, 'IT', 64000.00, '2020-04-10', 26, NULL, 'Germany'),
(11, NULL, 'Thomas', 'Finance', 47000.00, '2017-01-25', 38, NULL, 'Canada'),
(12, 'Joseph', 'Jackson', 'Marketing', 78000.00, '2016-09-30', 44, 'josephj@example.com', 'UK'),
(13, 'Karen', 'White', 'HR', 59000.00, '2018-06-10', 33, 'karenw@gmail.com', 'USA'),
(14, 'Steven', NULL, 'IT', 71000.00, '2021-07-15', 24, NULL, 'Germany'),
(15, 'Nancy', 'Clark', 'Finance', 45000.00, '2020-02-20', 27, 'nancyc@example.com', 'Canada'),
(16, 'George', 'Lewis', 'Marketing', 80000.00, '2019-11-10', 36, 'georgel@example.com', 'UK'),
(17, 'Betty', NULL, 'HR', 55000.00, '2017-04-05', 41, NULL, 'USA'),
(18, 'Samuel', 'Walker', 'IT', 72000.00, '2021-03-22', 23, 'samuelw@example.com', 'Germany'),
(19, 'Helen', 'Hall', 'Finance', 49000.00, '2018-10-16', 34, 'helenh@example.com', 'Canada'),
(20, NULL, 'Allen', 'Marketing', 90000.00, '2015-08-11', 50, NULL, 'UK'),
(21, 'Betty', 'Young', 'HR', 53000.00, '2020-05-17', 28, 'bettyy@gmail.com', 'USA'),
(22, 'Frank', NULL, 'IT', 67000.00, '2021-02-02', 26, 'frankk@example.com', 'Germany'),
(23, 'Deborah', 'Scott', 'Finance', 47000.00, '2019-07-09', 29, NULL, 'Canada'),
(24, 'Matthew', 'Green', 'Marketing', 76000.00, '2021-01-15', 30, 'matthewg@example.com', 'UK'),
(25, NULL, 'Adams', 'HR', 54000.00, '2020-06-21', 27, NULL, 'USA'),
(26, 'Paul', 'Nelson', 'IT', 71000.00, '2018-12-03', 37, 'pauln@example.com', 'Germany'),
(27, 'Margaret', NULL, 'Finance', 46000.00, '2020-08-19', 25, 'margaretc@example.com', 'Canada'),
(28, 'Anthony', 'Mitchell', 'Marketing', 82000.00, '2021-04-10', 29, NULL, 'UK'),
(29, 'Lisa', 'Perez', 'HR', 60000.00, '2021-03-05', 24, 'lisap@example.com', 'USA'),
(30, NULL, 'Roberts', 'IT', 69000.00, '2019-09-24', 32, NULL, 'Germany'),
(31, 'Jessica', 'Gonzalez', 'Finance', 47000.00, '2017-12-13', 38, 'jessicag@gamil.com', 'Canada'),
(32, 'Brian', NULL, 'Marketing', 85000.00, '2018-11-05', 35, NULL, 'UK'),
(33, 'Dorothy', 'Evans', 'HR', 59000.00, '2019-06-11', 31, 'dorothye@example.com', 'USA'),
(34, 'Matthew', 'Carter', 'IT', 70000.00, '2020-01-29', 29, 'matthewc@example.com', 'Germany'),
(35, NULL, 'Martinez', 'Finance', 51000.00, '2021-06-06', 22, NULL, 'Canada'),
(36, 'Daniel', 'Perez', 'Marketing', 83000.00, '2021-07-01', 30, 'danielp@example.com', 'UK'),
(37, 'Catherine', 'Roberts', 'HR', 60000.00, '2020-09-19', 27, 'catheriner@gmail.com', 'USA'),
(38, 'Ronald', NULL, 'IT', 68000.00, '2017-02-04', 39, NULL, 'Germany'),
(39, 'Angela', 'Jenkins', 'Finance', 52000.00, '2018-04-23', 34, 'angelaj@example.com', 'Canada'),
(40, 'Gary', 'Wright', 'Marketing', 87000.00, '2021-01-10', 29, NULL, 'UK');

SELECT 
  EmployeeID,
  FirstName + ' ' + LastName AS FullName,
  DepartmentName,
  Salary
FROM Employes;

-- 22. Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.

create table cabage(empID int, category varchar(50),price int, Products varchar(100))

insert into cabage(empID,category,price,Products)values
(1,'runner',60,'stol'),
(2,'sniper',55,'stul'),
(3,'teacher',67,'parta'),
(4,'sportsmen',87,'daraxt'),
(5,'singer',34,'dengiz'),
(6,'admination',56,'kurator');

select distinct category,Products,price
from cabage
where price>50;

-- 23. Write a query that selects products whose Price is less than 10% of the average price in the Products table. (Do some research on how to find average price of all products)

CREATE TABLE Productses (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Price DECIMAL(10,2),
  Stock INT
);

INSERT INTO Productses VALUES
(1,'Laptop Bag','Accessories',850.00,120),
(2,'Wireless Mouse','Electronics',450.00,80),
(3,'Smartphone','Electronics',1200.00,30),
(4,'Notebook','Stationery',25.00,200),
(5,'Pen Set','Stationery',15.00,45),
(6,'Bluetooth Speaker','Electronics',950.00,55),
(7,'Office Chair','Furniture',980.00,65),
(8,'Desk Lamp','Furniture',500.00,70),
(9,'USB Flash Drive','Electronics',300.00,150),
(10,'Monitor','Electronics',1050.00,40);

SELECT *
FROM Productses
WHERE Price < (SELECT AVG(Price) * 0.1 FROM Productses);

-- 24. Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.

create table clothes(empID int, age int,department varchar (50))
insert into clothes(empID,age,department)values
(1,23,'IT'),
(2,34,'HR'),
(3,21,'HR'),
(4,35,'IT'),
(5,45,'Finance');
select *from clothes
where age<30
and department in ('HR','IT');

-- 25. Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'janesmith@yahoo.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Alice', 'Johnson', 'alicej@outlook.com', '555-3456', '789 Pine St', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(4, 'Bob', 'Brown', 'bobbrown@hotmail.com', '555-4567', '101 Maple St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(5, 'Charlie', 'Davis', 'charliedavis@gmail.com', '555-5678', '202 Birch St', 'Sydney', 'NSW', '2000', 'Australia'),
(6, 'David', 'Martinez', 'davidm@live.com', '555-6789', '303 Cedar St', 'Melbourne', 'VIC', '3000', 'Australia'),
(7, 'Emily', 'Garcia', 'emilyg@yahoo.com', '555-7890', '404 Redwood St', 'London', 'England', 'SW1A 1AA', 'UK'),
(8, 'Frank', 'Hernandez', 'frankh@outlook.com', '555-8901', '505 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(9, 'Grace', 'Lopez', 'gracel@gmail.com', '555-9012', '606 Aspen St', 'Birmingham', 'England', 'B1 1AA', 'UK'),
(10, 'Helen', 'Gonzalez', 'heleng@yahoo.com', '555-0123', '707 Fir St', 'Berlin', 'BE', '10117', 'Germany'),
(11, 'Irene', 'Perez', 'irenep@hotmail.com', '555-1234', '808 Maple Ave', 'Munich', 'BY', '80331', 'Germany'),
(12, 'Jack', 'Wilson', 'jackw@live.com', '555-2345', '909 Oak Ave', 'Hamburg', 'HH', '20095', 'Germany'),
(13, 'Kim', 'Anderson', 'kima@gmail.com', '555-3456', '111 Pine Ave', 'Paris', '�le-de-France', '75001', 'France'),
(14, 'Liam', 'Thomas', 'liamt@yahoo.com', '555-4567', '222 Cedar Ave', 'Lyon', 'Auvergne-Rh�ne-Alpes', '69001', 'France'),
(15, 'Megan', 'Taylor', 'megant@outlook.com', '555-5678', '333 Redwood Ave', 'Marseille', 'Provence-Alpes-C�te Azur', '13001', 'France'),
(16, 'Nathan', 'Moore', 'nathanm@hotmail.com', '555-6789', '444 Willow Ave', 'Tokyo', 'TK', '100-0001', 'Japan'),
(17, 'Olivia', 'Jackson', 'oliviaj@gmail.com', '555-7890', '555 Birch Ave', 'Osaka', 'OS', '530-0001', 'Japan'),
(18, 'Paul', 'White', 'paulw@yahoo.com', '555-8901', '666 Maple Blvd', 'Kyoto', 'KY', '600-8001', 'Japan'),
(19, 'Quincy', 'Lee', 'quincyl@outlook.com', '555-9012', '777 Oak Blvd', 'Seoul', 'SO', '04547', 'South Korea'),
(20, 'Rachel', 'Harris', 'rachelh@hotmail.com', '555-0123', '888 Pine Blvd', 'Busan', 'BU', '48058', 'South Korea'),
(21, 'Sam', 'Clark', 'samc@gmail.com', '555-1234', '999 Cedar Blvd', 'Incheon', 'IC', '22382', 'South Korea'),
(22, 'Tina', 'Allen', 'tinaallen@yahoo.com', '555-2345', '1010 Redwood Blvd', 'Mexico City', 'CMX', '01000', 'Mexico'),
(23, 'Ursula', 'Scott', 'ursulas@outlook.com', '555-3456', '1111 Willow Blvd', 'Guadalajara', 'JAL', '44100', 'Mexico'),
(24, 'Victor', 'Adams', 'victora@hotmail.com', '555-4567', '1212 Birch Blvd', 'Monterrey', 'NLE', '64000', 'Mexico'),
(25, 'Walter', 'Baker', 'walterb@live.com', '555-5678', '1313 Oak Blvd', 'New York', 'NY', '10001', 'USA'),
(26, 'Xander', 'Nelson', 'xandern@gmail.com', '555-6789', '1414 Cedar Blvd', 'Los Angeles', 'CA', '90001', 'USA'),
(27, 'Yvonne', 'Carter', 'yvonnec@yahoo.com', '555-7890', '1515 Maple Dr', 'Chicago', 'IL', '60601', 'USA'),
(28, 'Zane', 'Mitchell', 'zanem@outlook.com', '555-8901', '1616 Redwood Dr', 'Houston', 'TX', '77001', 'USA'),
(29, 'Anna', 'Roberts', 'annar@hotmail.com', '555-9012', '1717 Willow Dr', 'Sydney', 'NSW', '2000', 'Australia'),
(30, 'Ben', 'King', 'benk@live.com', '555-0123', '1818 Birch Dr', 'Melbourne', 'VIC', '3000', 'Australia'),
(31, 'Chloe', 'Green', 'chloeg@gmail.com', '555-1234', '1919 Oak Dr', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(32, 'Daniel', 'Evans', 'daniele@yahoo.com', '555-2345', '2020 Cedar Dr', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(33, 'Ella', 'Collins', 'ellac@outlook.com', '555-3456', '2121 Redwood Dr', 'London', 'England', 'SW1A 1AA', 'UK'),
(34, 'Finn', 'Morris', 'finnm@hotmail.com', '555-4567', '2222 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(35, 'Grace', 'Lee', 'gracel@live.com', '555-5678', '2323 Birch St', 'Berlin', 'BE', '10117', 'Germany'),
(36, 'Holly', 'Martinez', 'hollym@gmail.com', '555-6789', '2424 Oak St', 'Munich', 'BY', '80331', 'Germany'),
(37, 'Ian', 'Robinson', 'ianr@yahoo.com', '555-7890', '2525 Cedar St', 'Warsaw', 'WA', '00-001', 'Poland'),
(38, 'Jasmine', 'Walker', 'jasminew@outlook.com', '555-8901', '2626 Redwood St', 'Lisbon', 'LI', '1100-148', 'Portugal'),
(39, 'Kyle', 'Young', 'kyley@hotmail.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201','USA'),
(40, 'Liam', 'Harris', 'liamh@live.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220','USA');

select *from Customer
where Email like '%@gmail.com%';

-- 26. Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.

CREATE TABLE Employeeses (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50)
);


INSERT INTO Employeeses(EmployeeID, FirstName, LastName, Age, Salary, Department) VALUES
(1, 'Ali', 'Khan', 28, 55000, 'HR'),
(2, 'Sara', 'Smith', 34, 70000, 'Sales'),
(3, 'John', 'Doe', 30, 48000, 'IT'),
(4, 'Anna', 'Brown', 25, 62000, 'Sales'),
(5, 'Mike', 'Davis', 40, 80000, 'Marketing'),
(6, 'Linda', 'Wilson', 29, 72000, 'IT'),
(7, 'James', 'Taylor', 31, 60000, 'Sales');

SELECT *
FROM Employeeses
WHERE Salary > ALL (
    SELECT Salary
    FROM Employeeses
    WHERE Department = 'Sales'
);

-- 27. Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and LATEST_DATE in the table. (Search how to get the current date and latest date)

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    LATEST_DATE DATE
);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, LATEST_DATE) VALUES
(1, 101, '2025-01-01', '2025-06-01'),
(2, 102, '2025-04-01', '2025-06-01'),
(3, 103, '2025-05-15', '2025-06-01'),
(4, 104, '2025-02-20', '2025-06-01'),
(5, 105, '2025-06-01', '2025-06-01');

SELECT *
FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, (SELECT MAX(LATEST_DATE) FROM Orders))
                    AND (SELECT MAX(LATEST_DATE) FROM Orders);
