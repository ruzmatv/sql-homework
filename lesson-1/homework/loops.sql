/** medium - 4 - **/
create database school1

/** medium - 5 - **/
CREATE TABLE schoolDb (
    StudentID INT PRIMARY KEY,
    Ism VARCHAR(50),
    Age INT
);
INSERT INTO schoolDb(StudentID, Ism, Age)
VALUES
  (1, 'Ali', 20),
  (2, 'Sabina', 22),
  (3, 'Jasur', 19);

  SELECT * FROM schoolDb;

  /** medium - 6 - **/
  /** SQL SERVER malumotlarni boshqarish ularni tahlil qilish ozgartirish uchun qollaniladi.
      SSMS serverdagi obyektlar bilan ishlanadi yana xavfsizlikni boshqarish uchun ham foydalaniladi. **/

/** hard - 7 - **/
/** 
DQL	Ma’lumotni o‘qish	misol uchun: "select"
DML	Ma’lumotni yozish/o‘zgartirish/o‘chirish misol uchun: "insert","delete"
DDL	Sxemani boshqarish	misol uchun: "create", "alter", "drop", "truncate" 
DCL	Foydalanuvchi huquqlari	
TCL	Tranzaktsiyalarni boshqarish
**/

/** hard - 8 - **/
create database school13

CREATE TABLE school12 (
    StudentID INT PRIMARY KEY,
    Ism VARCHAR(50),
    Age INT
);
insert into school12(StudentID, Ism, Age)
values
(1,'asad',12),
(2,'anvar',13),
(3,'davron',15);

select * from school12;


