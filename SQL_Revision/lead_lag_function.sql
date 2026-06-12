create database profit
use profit


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


select * from profitdata;

-- Question 1: To add a new column that shows next month's profit for each product
-- Ans 
select *,  lead(profit) over(partition by product order by monthnumber) as next_month_profit
from Profitdata;

-- Question 2: We don't want product column in the output but we want each month's total profit to be show by monthnumber & monthname,Also a new column should be added to show next month's total profit
-- Ans
select monthnumber,monthname,sum(profit) as total_profit,
lead(sum(profit)) over(order by monthnumber) as next_month_profit
from profitdata
group by monthnumber,monthname
order by monthnumber




















