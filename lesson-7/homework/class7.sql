create database class_7
use class_7

DROP TABLE IF EXISTS Employees

 CREATE TABLE Employees (
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
 INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentName, Salary, HireDate, Age, Email, Country) VALUES
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
 (13, 'Karen', 'White', 'HR', 59000.00, '2018-06-10', 33, 'karenw@example.com', 'USA'),
 (14, 'Steven', NULL, 'IT', 71000.00, '2021-07-15', 24, NULL, 'Germany'),
 (15, 'Nancy', 'Clark', 'Finance', 45000.00, '2020-02-20', 27, 'nancyc@example.com', 'Canada'),
 (16, 'George', 'Lewis', 'Marketing', 80000.00, '2019-11-10', 36, 'georgel@example.com', 'UK'),
 (17, 'Betty', NULL, 'HR', 55000.00, '2017-04-05', 41, NULL, 'USA'),
 (18, 'Samuel', 'Walker', 'IT', 72000.00, '2021-03-22', 23, 'samuelw@example.com', 'Germany'),
 (19, 'Helen', 'Hall', 'Finance', 49000.00, '2018-10-16', 34, 'helenh@example.com', 'Canada'),
 (20, NULL, 'Allen', 'Marketing', 90000.00, '2015-08-11', 50, NULL, 'UK'),
 (21, 'Betty', 'Young', 'HR', 53000.00, '2020-05-17', 28, 'bettyy@example.com', 'USA'),
 (22, 'Frank', NULL, 'IT', 67000.00, '2021-02-02', 26, 'frankk@example.com', 'Germany'),
 (23, 'Deborah', 'Scott', 'Finance', 47000.00, '2019-07-09', 29, NULL, 'Canada'),
 (24, 'Matthew', 'Green', 'Marketing', 76000.00, '2021-01-15', 30, 'matthewg@example.com', 'UK'),
 (25, NULL, 'Adams', 'HR', 54000.00, '2020-06-21', 27, NULL, 'USA'),
 (26, 'Paul', 'Nelson', 'IT', 71000.00, '2018-12-03', 37, 'pauln@example.com', 'Germany'),
 (27, 'Margaret', NULL, 'Finance', 46000.00, '2020-08-19', 25, 'margaretc@example.com', 'Canada'),
 (28, 'Anthony', 'Mitchell', 'Marketing', 82000.00, '2021-04-10', 29, NULL, 'UK'),
 (29, 'Lisa', 'Perez', 'HR', 60000.00, '2021-03-05', 24, 'lisap@example.com', 'USA'),
 (30, NULL, 'Roberts', 'IT', 69000.00, '2019-09-24', 32, NULL, 'Germany'),
 (31, 'Jessica', 'Gonzalez', 'Finance', 47000.00, '2017-12-13', 38, 'jessicag@example.com', 'Canada'),
 (32, 'Brian', NULL, 'Marketing', 85000.00, '2018-11-05', 35, NULL, 'UK'),
 (33, 'Dorothy', 'Evans', 'HR', 59000.00, '2019-06-11', 31, 'dorothye@example.com', 'USA'),
 (34, 'Matthew', 'Carter', 'IT', 70000.00, '2020-01-29', 29, 'matthewc@example.com', 'Germany'),
 (35, NULL, 'Martinez', 'Finance', 51000.00, '2021-06-06', 22, NULL, 'Canada'),
 (36, 'Daniel', 'Perez', 'Marketing', 83000.00, '2021-07-01', 30, 'danielp@example.com', 'UK'),
 (37, 'Catherine', 'Roberts', 'HR', 60000.00, '2020-09-19', 27, 'catheriner@example.com', 'USA'),
 (38, 'Ronald', NULL, 'IT', 68000.00, '2017-02-04', 39, NULL, 'Germany'),
 (39, 'Angela', 'Jenkins', 'Finance', 52000.00, '2018-04-23', 34, 'angelaj@example.com', 'Canada'),
 (40, 'Gary', 'Wright', 'Marketing', 87000.00, '2021-01-10', 29, NULL, 'UK');
 Select * from Employees
 --2. Write a query to find the maximum (MAX) Salary from the Employees table.
 Select Max(Salary) from Employees
 --3. Write a query to count the number of rows in the Customers table using COUNT(*)
 Select * from [F24_class5]. [dbo].[Customers]
Select count(*) from [F24_class5]. [dbo].[Customers]
--4 Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table
Select * from  [F24_class5]. [dbo].[Products]
Select count(distinct Category) from [F24_class5]. [dbo].[Products]
--5. Write a query to find the total (SUM) sales for a particular product in the Sales table.
Select * from F24_class5. [dbo].[Sales]
Select ProductID, SUM (SaleAmount) from F24_class5. [dbo].[Sales]
GROUP BY ProductID
--5. Write a query to find the total (SUM) sales amount for the product with id 7 in the Sales table.
Select ProductID, Sum (SaleAmount) from F24_class5. [dbo].[Sales]
Group by ProductID
having ProductID = 7;
--6.Write a query to calculate the average (AVG) age of employees in the Employees table.
Select AVG(Age) from Employees;
--7. Write a query that uses GROUP BY to count the number of employees in each department.
Select * from Employees
Select DepartmentName, count(DepartmentName) from Employees
group by DepartmentName
--8.Write a query to show the minimum and maximum Price of products grouped by Category.
Select Category,  Min(Price) , Max(Price) from[F24_class5]. [dbo].[Products]
group by Category
--9.  Write a query to calculate the total (SUM) sales per Customer in the Sales table.
Select CustomerID, Sum(SaleAmount) from [F24_class5]. [dbo].[Sales]
Group by CustomerID;
--10. Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.
SELECT DepartmentName, COUNT(*) AS employee_count
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5

--11.  Write a query to calculate the total sales and average sales for each product category from the Sales table.
Select * from [F24_class5]. [dbo].[Sales]

Select ProductID, SUM(SaleAmount), AVG(SaleAmount)
from [F24_class5]. [dbo].[Sales]
Group by ProductID
--12. Write a query that uses COUNT(columnname) to count the number of employees from the Department HR.
Select count(DepartmentName) from Employees
Group by DepartmentName
Having DepartmentName= 'HR'

--13. Write a query that finds the highest (MAX) and lowest (MIN) Salary by department in the Employees table.
Select DepartmentName, Max(Salary), Min(Salary) from Employees
group by DepartmentName;
--14.Write a query that uses GROUP BY to calculate the average salary per Department
Select DepartmentName, AVG(Salary) from Employees
Group by DepartmentName
--15.  Write a query to show the AVG salary and COUNT(*) of employees working in each department.
Select DepartmentName, Avg(Salary), Count(*)
from Employees
Group by DepartmentName
--16. Write a query that uses HAVING to filter product categories with an average price greater than 400.
Select *from [F24_class5]. [dbo].[Products]
Select Category, AVG(Price) from [F24_class5]. [dbo].[Products]
Group by Category
Having AVG(Price) > 400
--17.  Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.
Select *from [F24_class5]. [dbo].[Sales]
Select  Year(SaleDate) as SalesYear, SUM(SaleAmount) from [F24_class5]. [dbo].[Sales]
Group by Year (SaleDate) 
order by SalesYear
--18. Write a query that uses COUNT to show the number of customers who placed at least 3 orders.
Select * from [F24_class5]. [dbo].[Orders]

SELECT CustomerID, SUM(Quantity) AS TotalItemsOrdered  
FROM [F24_class5].[dbo].[Orders]  
GROUP BY CustomerID  
HAVING SUM(Quantity) >= 3;
--19. Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 500,000.
Select * from Employees
Select DepartmentName, Sum(Salary) from Employees
Group by DepartmentName
Having Sum(Salary) > 500000
--20. Write a query that shows the average (AVG) sales for each product category, and then uses HAVING to filter categories with an average sales amount greater than 200
Select * from [F24_class5]. [dbo].[Products]
Select Category, AVG(Price) from [F24_class5]. [dbo].[Products] 
Group by Category 
Having AVG(Price) > 200;

--21.Write a query to calculate the total (SUM) sales for each Customer, then filter the results using HAVING to include only Customers with total sales over 1500
Select CustomerID, SUM(SaleAmount) from [F24_class5]. [dbo].[Sales]
Group by CustomerID
Having SUM(SaleAMount) > 1500;

--22. Write a query to find the total (SUM) and average (AVG) salary of 
--employees grouped by department, and use HAVING to include only 
--departments with an average salary greater than 65000
Select DepartmentName, SUM(Salary), AVG(Salary) from Employees
Group by DepartmentName
Having AVG(Salary) > 65000;
--23. Write a query that finds the maximum (MAX) and minimum (MIN) order value for each customer, and then applies HAVING to exclude customers with an order value less than 50
Select * from [F24_class5]. [dbo].[Orders]
Select CustomerID, Max(TotalAmount), Min(TotalAmount) from [F24_class5]. [dbo].[Orders]
Group by CustomerID
Having Min(TotalAmount) > 50;

--24.  Write a query that calculates the total sales (SUM) and counts 
--distinct products sold in each month, and then applies HAVING to filter 
--the months with more than 8 products sold.
SELECT 
    YEAR(OrderDate) AS SalesYear,  
    MONTH(OrderDate) AS SalesMonth,  
    SUM(TotalAmount) AS TotalSales,  
    COUNT(DISTINCT ProductID) AS UniqueProductsSold  
FROM [F24_class5].[dbo].[Orders]  
GROUP BY YEAR(OrderDate), MONTH(OrderDate)  
HAVING COUNT(DISTINCT ProductID) > 8  
ORDER BY SalesYear, SalesMonth;
--25. Write a query to find the MIN and MAX order quantity per Year. From orders table.
Select OrderID, Min(Quantity), Max(Quantity) from [F24_class5]. [dbo].[Orders]
Group by OrderID
