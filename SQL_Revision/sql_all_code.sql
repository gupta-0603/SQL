CREATE TABLE EmployeeRecords (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2)
);


INSERT INTO EmployeeRecords (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Miller', 'HR', 60000),
(2, 'Jane', 'Smith', 'Finance', 75000),
(3, 'John', 'Miller', 'HR', 60000),
(4, 'Emily', 'Davis', 'IT', 85000),
(5, 'Michael', 'Brown', 'Finance', 75000),
(6, 'Jane', 'Smith', 'Finance', 75000);
select * from  EmployeeRecords

Select * from EmployeeRecords
where EmployeeID=2
select EmployeeID,firstname from EmployeeRecords
where EmployeeID=2
select * from EmployeeRecords
where salary>=75000

select * 
from Employees
order by firstname asc ,salary desc

select * from EmployeeRecords
where lastname="Miller" and EmployeeID=3

select * from EmployeeRecords
where department='HR' or department='Finance'

select * from EmployeeRecords
where salary =60000 and (department='HR' or department='Finance')

select * from EmployeeRecords
where not firstname='John' and not salary =60000

select * from EmployeeRecords
where not lastname='Miller' or not department='HR'

select * from EmployeeRecords
where salary between 75000 and 85000

select * from Employees
insert into Employees (EmployeeID,Firstname,Lastname,Department,Salary,HireDate)
values(7,'Rohit','mehera'),(8,'mahesh','narang','hr',73000,'2024-04-20')

select * from INFORMATION_SCHEMA.COLUMNS
where table_name='Employees'

select * from Employees
insert into Employees
values (10,"nitin","shamani","0",54000,'2021-02-20')
set sql_safe_updates=0
create  temporary table temp
select * from Employees
select * from temp
update temp set Department="HR"
where Department is null

select * from Employees
create  temporary table temp_3
select * from Employees
select * from temp_3
-- 
delete from temp_3
where lastname='' or department='0'
truncate table temp_3
drop table temp_3

-- hi we are great single line comments
select * from Employees
/* hello multi line comments */

select * from Employees Limit 2

create database sales
use sales
-- Creating a table with more columns, including a varchar column
CREATE TABLE Sales (
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    CustomerID INT,
    StoreID INT,
    SalespersonID INT,
    PaymentMethod VARCHAR(50)  -- New varchar column for payment method
);

-- Inserting more sample data (10 records), including NULL values
INSERT INTO Sales (ProductID, SaleDate, Quantity, TotalAmount, CustomerID, StoreID, SalespersonID, PaymentMethod)
VALUES 
(1, '2023-08-01', 10, 200.00, 101, 1, 201, 'Credit Card'),
(2, '2023-08-01', 5, 150.00, 102, 1, 202, 'Cash'),
(1, '2023-08-02', 8, 160.00, 103, 2, 203, 'Credit Card'),
(2, '2023-08-02', 7, 210.00, 104, 2, 204, 'Cash'),
(1, '2023-08-03', 6, 120.00, 105, 1, 201, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-04', 12, 300.00, 106, 3, 205, 'Credit Card'),
(1, '2023-08-04', 5, 100.00, 107, 3, 206, 'Debit Card'),
(2, '2023-08-05', 9, 270.00, 108, 1, 202, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-05', 15, 375.00, 109, 3, 207, 'Cash'),
(1, '2023-08-06', 7, 140.00, 110, 2, 203, 'Credit Card');

select * from sales
select max(totalamount) from sales

select max(saledate) as salesDate from sales

select max(paymentmethod) from sales
-- maximum qanitity sold from each productid

select productID,max(quantity) from sales
group by productID -- for each productid there is seeparte group created as we are using aggregate function

select saledate,max(totalamount) from sales
group by saledate

select * from sales
select sum(quantity) from sales
select sum(quantity) as totalquanitity,sum(totalamount) as sumofamount from sales

select avg(quantity) from sales
select avg(quantity) ,avg(totalamount) from sales

select 
sum(quantity) as total_quantity,
sum(totalamount),
avg(quantity),
avg(totalamount),
productID,
storeID
from sales 
group by storeID,productID

select * from sales
select count(*) as number_of_rows from sales

select count(paymentmethod) as no_of_records from sales

select  count(distinct productID) as prodcuts from sales

select * from sales
select paymentmethod,sum(totalamount) as sumofamountsales from sales
group by  paymentmethod

select * from sales
select productID,paymentmethod,sum(totalamount) as sumofamountsales from sales
group by  productID,paymentmethod
order by productID

-- total sales,avg sales, total quantity, avg quantity for each distinct product
select 
productID,
sum(totalamount),
sum(quantity),
avg(totalamount),
avg(quantity)
from sales 
group by productID
having sum(totalamount) <700 and sum(quantity)=21

select * from sales 
where totalamount>=161

use sales
create table table_1 (C1 int, C2 varchar(255))
insert into table_1 values (1,'A'),
(1,'B'),
(2,'C'),
(NULL,'D'),
(3,'E'),
(7,'DA')

create table table_2 (C1 int, C3 varchar(255))
insert into table_2 values (1,'XA'),
(2,'MB'),
(2,'NX'),
(NULL,'MO'),
(4,'XY'),
(5,'TF')

select * from table_1
select * from table_2
select * from table_1 inner join table_2
on table_1.c1=table_2.c1
select table_1.c1,table_1.c2,table_2.c1 
from table_1 inner join table_2
on table_1.c1=table_2.c1

select * from 
table_1 left join table_2
on table_1.c1=table_2.c1

select * from 
table_1 right join table_2
on table_1.c1=table_2.c1

-- left anti join
select * from 
table_1 left join table_2
on table_1.c1=table_2.c1
where table_2.c3 is null

-- right anti join
select * from 
table_1 right join table_2
on table_1.c1=table_2.c1
where table_1.c2 is null

-- full outer join
-- output of inner join,only in left table,only in right table
select * from 
table_1 left join table_2
on table_1.c1=table_2.c1
union
select * from 
table_1 right join table_2
on table_1.c1=table_2.c1

-- self join
select * from table_1 as a inner join table_2 as b
on a.c1=b.c1

use sales 
create table append_1 (c1 int, c2 varchar(255), c3 int)
insert into append_1 values
(2,'b',8),
(3,'c',9);
create table append2(c1 int, c2 varchar(255), c3 int)
insert into append2 values
(2,'b',8),
(33,'c1',91);

-- Create Employees_us table
CREATE TABLE Employees_US (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert sample data into Employees table
INSERT INTO Employees_us (EmployeeID, FirstName, LastName, Department) VALUES
(1, 'Alice', 'Smith', 'Finance'),
(2, 'Bob', 'Johnson', 'Engineering'),
(3, 'Charlie', 'Williams', 'Marketing'),
(4, 'Diana', 'Brown', 'Finance'),
(5, 'Edward', 'Jones', 'Engineering'),
(6, 'Fiona', 'Garcia', 'Marketing'),
(7, 'George', 'Miller', 'Finance'),
(8, 'Hannah', 'Wilson', 'Engineering');

select  * from employees_us
-- where lastname like 's%'
-- where lastname like '%a'
-- where department like '%eng%'
-- where lastname like '_____'
-- where firstname like 'c%' or 'd%'
select  * from employees_us
-- where lastname like '%son%'
-- where firstname like '_i%'
 -- where lastname like 'a%' 
 -- where firstname not like '%o%'
 -- where lastname like '____a'
-- where department like 'mar%ing'
 where left(firstname,1) in ('a','e','i','o','u')


-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(20),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Supplier VARCHAR(50),
    Rating DECIMAL(3, 1)
);

-- Insert data into the Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, Supplier, Rating) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 150, 'Tech Supplies', 4.5),
(2, 'Office Chair', 'Furniture', 120.00, 85, 'Comfort Co', 4.7),
(3, 'Water Bottle', 'Accessories', 15.00, 250, 'AquaGear', 4.3),
(4, 'Laptop Backpack', 'Accessories', 45.99, 200, 'GearUp', 4.6),
(5, 'Gaming Laptop', 'Electronics', 999.99, 45, 'Tech Supplies', 4.8),
(6, 'Desk Lamp', 'Furniture', 35.00, 120, 'LightHouse', 4.2),
(7, 'Bluetooth Speaker', 'Electronics', 59.99, 95, 'SoundWave', 4.4),
(8, 'Standing Desk', 'Furniture', 250.00, 50, 'Comfort Co', 4.9),
(9, 'Fitness Tracker', 'Electronics', 129.99, 180, 'FitTech', 4.7),
(10, 'Coffee Mug', 'Accessories', 9.99, 300, 'MugMasters', 4.1);

select 
*,
case 
    when price > 500 then 'high' 
    when price <=500 and price >=200 then 'medium'
    else 'low'
end as"High/Medium/Low"
from products

select 
*,
case 
    when price > 500 then 'high' 
    when price <=500 and price >=200 then 'medium'
end as"High/Medium/Low"
from products
select * from products
order by
case 
    when category in ('electronics') then 1
    when category in ('furniture') then 2
    else 3
end 

select *,
case 
when category= 'Electronics' then 
    case 
        when price >=300 then 'premium electronics'
		else 'affordable electronics'
    end
when category='furniture'then
	case 
         when price >=250 then 'premium furnitures'
         else 'affordable furniture' 
         end
else 
    case 
        when price >25 then 'premium accessories'
        else 'affordable accessories'
    end
end as 'Groups'
from products
SELECT *,
CASE 
    WHEN category = 'Electronics' THEN
        CASE 
            WHEN price >= 300 THEN 'premium electronics'
            ELSE 'affordable electronics'
        END
    WHEN category = 'Furniture' THEN
        CASE 
            WHEN price >= 250 THEN 'premium furniture'
            ELSE 'affordable furniture'
        END
    ELSE 
        CASE 
            WHEN price > 25 THEN 'premium accessories'
            ELSE 'affordable accessories'
        END
END AS 'Groups'
FROM products;
 select * from sales
 create table new_sales
 select * into new_sales from sales

-- subquery
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



-- Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name, email)
VALUES 
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com');

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES 
(101, 1, '2024-07-15', 250.00),
(102, 1, '2024-08-05', 300.00),
(103, 2, '2024-08-10', 150.00),
(104, 3, '2024-06-25', 100.00);

select * from Customers
where customer_id  in (select distinct customer_id from orders where order_date not  between '2024-08-01' and '2024-08-31')

-- not null constraint
create table not_null (
eid int not null,
age tinyint,
firstname varchar(255)
);
select * from not_null
insert into not_null values(1,34,'aditya')
insert into not_null values(45,34,'gupta')
-- unique constraint
-- check
create table check_test (
eid int,
age tinyint check(age>18),
firstname varchar(255) );
select * from check_test
insert into check_test values(1,17,'mayank')
-- defaulty constriant
create table default_test (
eid int default 5,
firstname varchar(255),
age tinyint 
);
select * from default_test
insert into default_test(firstname,age) values ('aditya',21)

 CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

select * from students
-- assign rank based on marks

select *,row_number() over(order by marks desc) as Row_Number
from students
-- row number in case  of a tie row number are assigned randomly
SELECT *,
       ROW_NUMBER() OVER(ORDER BY marks DESC) AS 'Row_Number' -- No comma here
FROM students;
SELECT *,
       RANK() OVER(ORDER BY marks DESC) AS 'Rank' -- No comma here
FROM students;
-- rank function there is a tie then next rank gets skippped
-- dense rank gives all rank if there is a tie then it will not be skipped
select *,
dense_rank() over(order by marks desc) as "Denserank"
 from students

SELECT *,
       ROW_NUMBER() OVER(ORDER BY marks) AS 'Row_Number' -- No comma here
FROM students;

select *,
row_number() over(partition by subject order by marks desc) as 'row_number'
from students

select *,
row_number() over(partition by subject order by marks ) as 'row_number'
from students

select *,
row_number() over(partition by student_name order by marks desc) as 'row_number'
from students

select *,
dense_rank() over(partition by student_name order by marks desc) as 'row_number'
from students
select *,
row_number() over(partition by subject order by marks) as 'row_number'
from students

create database profitdb
use profitdb
create database [Profit DB]

use [profit db]

-- Create a table to store monthly profit data for different products
CREATE  TABLE ProfitData (
    MonthNumber INT,
    MonthName VARCHAR(3),
    Product VARCHAR(50),
    Profit INT
);

-- Insert data into the ProfitData table
INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
(1, 'Jan', 'Product A', 1000),
(2, 'Feb', 'Product A', 1500),
(3, 'Mar', 'Product A', 1200),
(4, 'Apr', 'Product A', 1700),
(5, 'May', 'Product A', 1300),
(6, 'Jun', 'Product A', 1600),
(1, 'Jan', 'Product B', 2000),
(2, 'Feb', 'Product B', 2500),
(3, 'Mar', 'Product B', 2200),
(4, 'Apr', 'Product B', 2700),
(5, 'May', 'Product B', 2300),
(6, 'Jun', 'Product B', 2600);

-- to design an collumn which shows profut of next month
select *,
lead(profit) over (partition by product order by monthnumber) as "nextmonthprofit"
 from profitdata
 -- we dont want product in output but we want each months total profit to be shown by monthm=number and monthname,also a new column should be added to show next month total profit
 select monthnumber,monthname,sum(profit) as 'totalprofit',lead(sum(profit)) over(order by monthnumber)
 from profitdata
group by monthnumber,monthname
order by monthnumber 

--  lag function
select *,
lag(profit) over (partition by product order by monthnumber) as "nextmonthprofit"
 from profitdata
 
  select monthnumber,monthname,sum(profit) as 'totalprofit',lag(sum(profit)) over(order by monthnumber) as 'prevtotalprofit'
 from profitdata
group by monthnumber,monthname
order by monthnumber 

-- isnull function and coalesce funcction
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
(2, 'Bob', 'Smith', NULL, '555-5678', NULL),
(3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
(4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);

select * from customers
select isnull(null,'ist value null')
select isnull('abx',null)

select isnull(null,null)

--
select coalesce('a','b','c')
select coalesce(null,'b','c')
select coalesce(null,null,'c')
select coalesce(null,null,null)
select * from customers
select customerid,email,phonenumber from customers
select customerid,isnull(email,'email NA'),isnull(phonenumber,'ot avvalable') from customers

select customerid,coalesce(email,phonenumber,'contact NA') as 'coalesce function'from customers

create database windowfun
use windowfun
CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7, 'Grace', 90000, 'IT'),
(8, 'Heidi', 95000, 'IT'),
(9, 'Ivan', 87000, 'IT');

select * from employeesalaries
select *,
first_value(salary) over(order by salary asc) as 'minimum salary'
from employeesalaries

select *,
first_value(employeename) over(order by salary asc) as 'emp with minimum salary'
from employeesalaries

select *,
first_value(employeename) over(partition by department order by salary asc) as 'emp with salary'
from employeesalaries


select *,
last_value(employeename) over(order by salary desc) as 'emp with minimum salary'
from employeesalaries

select * from employeename
select * into #temp_1 from employees

with recursive r_cte as (
select 1 as n -- anchor query

union all
select n+1 from r_cte where n<=4 -- recursive querry 
)
select exp(sum(log(n))) as 'facotial' from r_cte

-- stored procedures
create database testdb

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Doe', 'HR', 50000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 'Finance', 60000.00, '2019-03-23'),
(3, 'Alice', 'Johnson', 'IT', 75000.00, '2021-07-10'),
(4, 'Bob', 'Brown', 'Marketing', 55000.00, '2018-09-30'),
(5, 'Charlie', 'Davis', 'IT', 70000.00, '2022-02-20');
select * from Employees;
delimiter
create procedure sp_test()
begin          
select * from employees;
end
delimiter











