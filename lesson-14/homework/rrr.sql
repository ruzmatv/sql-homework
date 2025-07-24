create database uhh
use uhh
-- 1. Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)

select * from [TestMultipleColumns] 

SELECT
  LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
  RIGHT(Name, LEN(Name) - CHARINDEX(',', Name)) AS Surname
FROM TestMultipleColumns;

-- 2. Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)



select * from testPercent
where strs like '%\%%' escape '\'

-- 3. In this puzzle you will have to split a string based on dot(.).(Splitter)


select * from Splitter
SELECT value
FROM Splitter
CROSS APPLY STRING_SPLIT(vals, '.');

-- 4. Write a SQL query to replace all integers (digits) in the string with 'X'.(1234ABC123456XYZ1234567890ADS)

SELECT REPLACE(
        REPLACE(
         REPLACE(
          REPLACE(
           REPLACE(
            REPLACE(
             REPLACE(
              REPLACE(
               REPLACE(
                REPLACE('1234ABC123456XYZ1234567890ADS', '0', 'X'),
                         '1', 'X'),
                        '2', 'X'),
                       '3', 'X'),
                      '4', 'X'),
                     '5', 'X'),
                    '6', 'X'),
                   '7', 'X'),
                  '8', 'X'),
                 '9', 'X') AS replaced_string;

-- 5. Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)




select * from testdots
where len(vals) - len(replace(vals,'.','')) >2

-- 6. Write a SQL query to count the spaces present in the string.(CountSpaces)


select *, len(texts) - len(replace(texts,' ','')) from countspaces

-- 7. write a SQL query that finds out employees who earn more than their managers.(Employee)

select * from Employee

SELECT e.ID, e.Name, e.Salary, m.ID AS ManagerID, m.Name AS ManagerName, m.Salary AS ManagerSalary
FROM Employee e
JOIN Employee m ON e.ManagerID = m.ID
WHERE e.Salary > m.Salary;

-- 8. Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID, First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)


select * from Employees
select employee_ID,
first_Name,
Last_Name,
Hire_Date, 
datediff(year,hire_date,getdate()) as years_of_service 
from Employees
where  datediff(year,hire_date,getdate()) >10 
and    datediff(year,hire_date,getdate()) <15

-- 1.  Write a SQL query to separate the integer values and the character values into two different columns.(rtcfvty34redt)

SELECT
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    'rtcfvty34redt',
    'a', ''), 'b', ''), 'c', ''), 'd', ''), 'e', ''), 'f', ''), 'g', ''), 'h', ''), 'i', ''), 'j', '') AS OnlyDigits,

  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
    'rtcfvty34redt',
    '0', ''), '1', ''), '2', ''), '3', ''), '4', ''), '5', ''), '6', ''), '7', ''), '8', ''), '9', '') AS OnlyChars;

-- 2. write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)

SELECT w1.Id
FROM weather w1
JOIN weather w2 ON w1.recordDate = DATEADD(day, 1, w2.recordDate)
WHERE w1.Temperature > w2.Temperature;

select * from weather

-- 3. Write an SQL query that reports the first login date for each player.(Activity)

select * from activity

select player_id,min(event_date) from activity
group by player_id

-- 4. Your task is to return the third item from that list.(fruits)



select * from fruits 

SELECT TOP 1 *
FROM (
  SELECT ROW_NUMBER() OVER (ORDER BY fruit_list) AS RowNum, *
  FROM fruits
) t
WHERE RowNum = 3;

-- 5. Write a SQL query to create a table where each character from the string will be converted into a row.(sdgfhsdgfhs@121313131)

DECLARE @str VARCHAR(100) = 'sdgfhsdgfhs@121313131';

SELECT SUBSTRING(@str, 1, 1) AS Char
UNION ALL SELECT SUBSTRING(@str, 2, 1)
UNION ALL SELECT SUBSTRING(@str, 3, 1)
UNION ALL SELECT SUBSTRING(@str, 4, 1)
UNION ALL SELECT SUBSTRING(@str, 5, 1)
UNION ALL SELECT SUBSTRING(@str, 6, 1)
UNION ALL SELECT SUBSTRING(@str, 7, 1)
UNION ALL SELECT SUBSTRING(@str, 8, 1)
UNION ALL SELECT SUBSTRING(@str, 9, 1)
UNION ALL SELECT SUBSTRING(@str, 10, 1)
UNION ALL SELECT SUBSTRING(@str, 11, 1)
UNION ALL SELECT SUBSTRING(@str, 12, 1)
UNION ALL SELECT SUBSTRING(@str, 13, 1)
UNION ALL SELECT SUBSTRING(@str, 14, 1)
UNION ALL SELECT SUBSTRING(@str, 15, 1)
UNION ALL SELECT SUBSTRING(@str, 16, 1)
UNION ALL SELECT SUBSTRING(@str, 17, 1)
UNION ALL SELECT SUBSTRING(@str, 18, 1)
UNION ALL SELECT SUBSTRING(@str, 19, 1)
UNION ALL SELECT SUBSTRING(@str, 20, 1)
UNION ALL SELECT SUBSTRING(@str, 21, 1)

-- 6. You are given two tables: p1 and p2. Join these tables on the id column. The catch is: when the value of p1.code is 0, replace it with the value of p2.code.(p1,p2)


select 
p1.id,
case 
    when p1.code =0 then p2.code
	else p1.code
	end as final_code
	from p1join o2 on p1.id =p2.id

-- 7. Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows:

select * from employees

SELECT 
  Employee_ID,
  First_Name,
  Last_Name,
  Hire_Date,
  DATEDIFF(YEAR, Hire_Date, GETDATE()) AS Years_Worked,
  CASE 
    WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) < 1 THEN 'New Hire'
    WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) BETWEEN 1 AND 4 THEN 'Junior'
    WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) BETWEEN 5 AND 9 THEN 'Mid-Level'
    WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) BETWEEN 10 AND 19 THEN 'Senior'
    ELSE 'Veteran'
  END AS Employment_Stage
FROM Employees;

-- 8. Write a SQL query to extract the integer value that appears at the start of the string in a column named Vals.(GetIntegers)

select 
vals,
case
when patindex('[0-9]%', vals) = 1 then 
left(vals, patindex('%[^0-9]%',vals + 'a')-1)
else null
end as leading_integer
from getintegers

-- 1. In this puzzle you have to swap the first two letters of the comma separated string.(MultipleVals)

SELECT
  vals,
  CASE 
    WHEN LEN(vals) >= 2 THEN
      SUBSTRING(vals, 2, 1) + SUBSTRING(vals, 1, 1) + SUBSTRING(vals, 3, LEN(vals))
    ELSE vals
  END AS swapped_vals
FROM MultipleVals;

-- 2. Write a SQL query that reports the device that is first logged in for each player.(Activity)

SELECT 
    A.player_id,
    A.device_id,
    A.event_date
FROM Activity A
INNER JOIN (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
) AS FirstLogins
ON A.player_id = FirstLogins.player_id AND A.event_date = FirstLogins.first_login_date;

select * from activity

-- 3. You are given a sales table. Calculate the week-on-week percentage of sales per area for each financial week. For each week, the total sales will be considered 100%, and the percentage sales for each day of the week should be calculated based on the area sales for that week.(WeekPercentagePuzzle)



;WITH WeeklyTotals AS (
  SELECT
    DATEPART(week, sales_date) AS week_num,
    SUM(sales_amount) AS total_week_sales
  FROM sales
  GROUP BY DATEPART(week, sales_date)
),

AreaDaySales AS (
  SELECT
    area,
    sales_date,
    DATEPART(week, sales_date) AS week_num,
    SUM(sales_amount) AS area_day_sales
  FROM sales
  GROUP BY area, sales_date
)

SELECT
  a.area,
  a.sales_date,
  a.week_num,
  a.area_day_sales,
  w.total_week_sales,
  CAST(a.area_day_sales * 100.0 / w.total_week_sales AS DECIMAL(5,2)) AS percentage_of_week_sales
FROM AreaDaySales a
JOIN WeeklyTotals w ON a.week_num = w.week_num
ORDER BY a.week_num, a.area, a.sales_date;
