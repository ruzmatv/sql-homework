-- 1. Define and explain the purpose of BULK INSERT in SQL Server.

BULK INSERT buyrugi  bu SQL Server tizimida ishlatiladigan T-SQL Transact-SQL 
operatori bolib, u orqali tashqi fayldan masalan CSV, TXT katta hajmdagi 
malumotlarni togridan-togri jadvalga yuklash mumkin.

BULK INSERT quyidagi vazifalar uchun ishlatiladi:
Katta hajmdagi malumotlarni tez va samarali import qilish.
Fayllardan jadvalga avtomatik malumot yuklashni tashkil qilish.
Malumot omboriga tashqi manbadan malumot olib kirishda vaqt va resurslarni tejash.

-- 2. List four file formats that can be imported into SQL Server.

CSV (Comma-Separated Values)
Malumotlar vergul (,) bilan ajratilgan fayl.
Eng kop ishlatiladigan format bolib, BULK INSERT orqali oson yuklanadi.
Har bir qator va malumotlar yozuvi, har bir ustun — vergul bilan ajratiladi.

TXT (Matnli fayl)
Oddiy matn fayli bolib, odatda maydonlar maxsus belgilar bilan ajratilgan boladi (masalan: tab, nuqta-vergul).
Moslashtirilgan (custom) formatlar uchun ishlatiladi.

XML (eXtensible Markup Language)
Tuzilgan (strukturali) malumotlarni saqlash uchun ishlatiladi.
OPENXML yoki XML malumot turi yordamida import qilinadi.

JSON (JavaScript Object Notation)
Veb ilovalarda keng ishlatiladigan yengil va oqilishi oson format.
SQL Server 2016 va undan keyingi versiyalarda OPENJSON funksiyasi orqali import qilinadi.

-- 3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).

create database Producted
use Producted

create table Products(
ProductID int primary key,                                   select * from Products
ProductName Varchar(50),
Price Decimal(10,2),
)

-- 4. Insert three records into the Products table using INSERT INTO.

INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
    (1, 'Noutbuk', 750.00),
    (2, 'Printer', 150.50),
    (3, 'Sichqoncha', 25.99);

-- 5. Explain the difference between NULL and NOT NULL.

NOT NULL bu ustun bosh qolmasligi kerak, yani qiymat kiritilishi majburiy.
Bu cheklov ustunga malumot kiritilishini majbur qiladi.

NULL  bu hech qanday qiymat yoq degani.
Bu ustunda malumot kiritilmagan, nomalum yoki hozircha mavjud emas degan ma’noni anglatadi.
NULL nol (0) yoki bosh matn ('') bilan bir xil emas.

-- 6. Add a UNIQUE constraint to the ProductName column in the Products table.

alter table Products
add constraint Uq_products unique (ProductName)

-- 7. Write a comment in a SQL query explaining its purpose.

Bu sorov Products jadvalidan barcha malumotlarni tanlaydi
select * from Products

/* va */
/*
Bu so‘rov Products jadvalidan barcha ma’lumotlarni oladi
va ularning narxlarini ko‘rsatadi.
*/

-- 8. Add CategoryID column to the Products table.

alter table Products
add CategoryID int ;

-- 9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.

create table Categories(
CategoryID int primary key,
CategoryName Varchar(100) unique                 select * from Categories
);

-- 10. Explain the purpose of the IDENTITY column in SQL Server.

Yagona (unique) identifikatorlarni avtomatik yaratish uchun ishlatiladi.
Yangi satr qoshilganda, IDENTITY ustuni avtomatik ravishda oz qiymatini oshirib boradi.
Shuning uchun, odatda asosiy kalit (PRIMARY KEY) sifatida qollaniladi.

Afzalliklari:
Qolda ID kiritish shart emas, tizim ozi yaratadi.
Takrorlanmas, unik raqamlar avtomatik taqdim etiladi.
Kodni soddalashtiradi va xatoliklarni kamaytiradi.

-- 11. Use BULK INSERT to import data from a text file into the Products table.

BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

-- 12. Create a FOREIGN KEY in the Products table that references the Categories table.

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

-- 13. Explain the differences between PRIMARY KEY and UNIQUE KEY.

PRIMARY KEY  har bir yozuvni noyob aniqlovchi ustun, jadvalda faqat bitta boladi, NULL qiymatga yol qoyilmaydi.

UNIQUE KEY  ustundagi qiymatlar takrorlanmasligi kerak, lekin jadvalda bir nechta bolishi mumkin va NULL qiymatlar (odatda bitta) ruxsat etiladi.

-- 14. Add a CHECK constraint to the Products table ensuring Price > 0.

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

-- 15. Modify the Products table to add a column Stock (INT, NOT NULL).

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

-- 16. Use the ISNULL function to replace NULL values in Price column with a 0.

Use the ISNULL function to replace NULL values in Price column with a 0.

-- 17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.

Malumotlar yaxlitligini taminlash  yani bir jadvaldagi malumotlar faqat boglangan jadvaldagi mavjud qiymatlarga mos kelishi kerak.

Boglangan jadvalga asoslangan mantiqiy aloqalarni saqlash.

-- 18. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    CONSTRAINT CHK_Customer_Age CHECK (Age >= 18)
);

-- 19. Create a table with an IDENTITY column starting at 100 and incremen

CREATE TABLE Orders (
    OrderID INT IDENTITY(100,10) PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE
);

select * from Orders

-- 20. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID)
);

-- 21. Explain the use of COALESCE and ISNULL functions for handling NULL values.

1. ISNULL funksiyasi
Agar qiymat NULL bo‘lsa, uni berilgan bitta muqobil qiymat bilan almashtiradi.
2. COALESCE funksiyasi
Bir nechta qiymat ko‘rsatilganda, ularning birinchi NULL bo‘lmaganini tanlab qaytaradi.

-- 22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.

create table Employees(
EmpID int primary key,
Email Varchar(50) unique,
);

select * from Employees

-- 23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
