

create database SQL_joins;

use SQL_joins;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);
 

-- Question 1: Write an SQL query to find the names of customers who have placed an order. 

-- ans inner join 
select distinct customername from customers as c 
inner join orders as o
on c.customerid=o.customerid

-- Question 2: Find the list of customers who have not placed any orders. 

-- Ans left anti join
select * from customers as c 
left join orders as o
on c.customerid=o.customerid
where o.orderid is null

-- Question 3: List all orders along with the product name and price. 

-- Ans inner join
select distinct productname,price from products
inner join orders 
on products.productid=orders.productid

-- Question 4: Find the names of customers and their orders, including customers who haven't placed any orders. 

-- Ans left join
select distinct customername, orderid from customers as c
left join orders as o
on c.customerid=o.customerid

-- Question 5: Retrieve a list of products that have never been ordered. 

-- Ans left anti join
select  distinct p.productid,productname from products as p
left join orders as o
on p.productid=o.productid
where o.productid is null

-- Question 6: Find the total number of orders placed by each customer. 
-- Ans 
select distinct customername, count(orderid) from customers as c
left join orders as o
on c.customerid=o.customerid
group by customername

-- Question 7: Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders. 
-- Ans
select distinct customername, p.productid,productname,orderdate from customers as c
left join orders as o
on c.customerid=o.customerid
left join products as p
on o.productid=p.productid

-- Question 8: Identify pairs of customers who live in the same country. 
-- Ans (self join)
select c1.customername,c2.customername from customers  as c1
inner join customers as c2
on c1.country=c2.country
and c1.customerid <> c2.customerid
and c1.customerid>c2.customerid

-- Question 9: Find the customer who has spent the most on their orders. 
-- Ans (all three tables inner join)
select customername from 
(select customername,sum(price), dense_rank() over(order by sum(price) desc) as rk from customers as c
inner join orders as o
on c.customerid=o.customerid
inner join products as p
on o.productid=p.productid
group by customername) as m
where rk=1


-- Question 10: Find customers who have ordered more than one type of products. 
select customername from customers as c
inner join orders as o
on c.customerid=o.customerid
group by customername
having count(productid)>1

-- Question 11: List all products and their corresponding orders, using a RIGHT JOIN, including products that have never been ordered. 
select orderid,p.productid,productname from orders as o
right join products as p
on o.productid=p.productid

-- Question 12: Retrieve all orders placed by customers from the USA. 
 select * from customers as c
 inner join orders as o
 on c.customerid=o.customerid
 where country like 'usa'
 
-- Question 13: Find the names of customers who have ordered a product priced above $500. 
 select * from customers as c
 inner join orders as o
 on c.customerid=o.customerid
 inner join products as p
 on p.productid=o.productid
 where price>500

-- Question 14: Find customers who have ordered the same product more than once. 
select distinct m.customername from
 (select customername,productid,count(orderid) from customers as c
 inner join orders as o
 on c.customerid=o.customerid
 group by customername,productid
 having count(orderid)>1) as m


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
