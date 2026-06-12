create database SQL_Basics_Questions;

use SQL_Basics_Questions;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);


-- 1) How do you select all columns from the Employees table?
select * from Employees;

-- 2) How do you select only the FirstName and Last Name columns from the Employees table?
select FirstName,LastName from Employees;

-- 3) How do you find all employees who work in the 'IT' department?
select * from Employees where Department = 'IT';
-- or
select * from Employees where Department like 'IT'

-- 4) How do you select employees with a salary greater than 70,000?
select * from Employees where Salary>70000

-- 5) How do you sort the results by Last Name in ascending order?
select * from Employees order by LastName asc;
 -- or
select * from Employees order by LastName;


-- 6) How do you select distinct departments from the Employees table?
select distinct Department from Employees;

-- 7) How do you count the number of employees in each department?
select Department,count(*) Employees from Employees group by Department;
--
select department,count(employeeid) as number_of_employees from Employees group by Department;

-- 8) How do you find the maximum salary in the Employees table?
select max(salary)  from Employees;

-- 9) How do you find the average salary of employees in the 'Finance' department?
select avg(Salary) as Finance_Average from Employees where Department like 'Finance';

-- 10) How do you select employees whose last name starts with 'M'?
select * from Employees where LastName like 'm%';

-- 11. How do you select employees who work in the 'IT' department and have a salary greater than 75,000? 
select * from Employees where department='IT' and salary>=75000;

-- 12. How do you find employees who work in the 'HR' department or have a salary less than 60,000? 
select * from Employees where department='HR' OR salary>60000;

-- 13. How do you select employees who do not work in the 'Finance' department?
select * from Employees where department not in ('Finance');
 
-- 14. How do you find employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department? 
select * from Employees where salary between 60000 and 70000 and department='Finance';

-- 15. How do you find employees who work in the 'IT' department and do not have a salary greater than 80,000? 
select * from Employees where department='IT' and salary <=80000;

-- 16. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65,000? 
select * from Employees where department in ('hr','finance') and salary>=65000;

-- 17 How do you select employees whose last name starts with 'D' and do not work in the 'HR' department? 
select * from Employees where lastname like 'd%' and department not in ('hr');

-- 18. How do you find employees who do not work in the 'IT' department and have a salary greater than 70,000? 
select * from employees where department not in ('it') and salary >=70000;

-- 19. How do you select employees who work in the 'IT' department and either have a salary greater than 75,000 or have the first name 'Laura'? 
select * from Employees where department='it' and (salary>75000 or firstname like 'laura');

-- 20. How do you find employees who do not work in the 'HR' or 'IT' departments? 
select * from Employees where department not in ('hr','it')


















