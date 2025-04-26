create database class17_home
use class17_home
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');

Select * from Products
Select * from Sales
--1. Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
--Return: ProductID, TotalQuantity, TotalRevenue
Select p.ProductID, Sum(Quantity) as TotalQuantity, Sum(price) as TotalRevenue
into #MonthlySales
from Sales s
join Products p 
on p.ProductID=s.productid
where Month(Saledate)=4
group by p.ProductID
 Select * from #MonthlySales
 --2. Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.
--Return: ProductID, ProductName, Category, TotalQuantitySold
create view  vw_ProductSalesSummary as
Select s.productid,p.ProductName,p.category, Sum(Quantity) as TotalQuantitySold 
from Sales s
join Products p 
on p.productid=s.productid
group by s.ProductID, p.ProductName,p.category

Select * from vw_ProductSalesSummary;
--3.Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--Return: total revenue for the given product ID;
create function fn_GetTotalRevenueForProduct (@ProductID INT)
returns table
as 
return
(
Select p.productid, Sum(s.quantity*p.price) TotalRevenue
from sales s
join Products p
on s.ProductID=p.ProductID
where s.ProductID=@ProductID
group by p.productid
)
Select * from fn_GetTotalRevenueForProduct (3)
Select * from Products
--4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.
Create function fn_GetSalesByCategory (@Category VARCHAR(50))
Returns table
as
Return (Select p.ProductName, sum(quantity) TotalQuantity, sum(quantity*price) TotalRevenue from Sales s
Join Products p on s.productID = p.productId
Where category = @category
Group by p.ProductName)
Select * from fn_GetSalesByCategory(Electronics)

--5. You have to create a function that get one argument as input from user and the function should return 'Yes' if the input number is a prime number and 'No' otherwise
Create function dbo.fn_IsPrime (@Number INT)
Returns varchar(10)
as 
begin 
declare @starting_number int =2
declare @prime1 varchar(10)='Yes'
while @starting_number*@starting_number<=@Number
begin 
if @Number% @starting_number=0
begin 
set @prime1 ='No'
break 
end 
set @starting_number = @starting_number + 1
end 
return @prime1
end 

Select  dbo.fn_IsPrime(29)
--6. Create a table-valued function named fn_GetNumbersBetween that accepts two integers
CREATE FUNCTION dbo.fn_GetNumbersBetween (@start INT, @end INT)
RETURNS @Result TABLE (Number INT)
AS
BEGIN
    DECLARE @counter INT = @start
    WHILE @counter <= @end
    BEGIN
        INSERT INTO @Result VALUES (@counter)
        SET @counter = @counter + 1
    END
    RETURN
END

Select * from dbo.fn_GetNumbersBetween(3, 9)
--7. Write a SQL query to return the Nth highest distinct salary from the Employee table. If there are fewer than N distinct salaries, return NULL.
CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT

    IF @N < 1
        RETURN NULL

    SELECT @Result = salary
    FROM (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET @N - 1 ROWS FETCH NEXT 1 ROWS ONLY
    ) AS T

    RETURN @Result
END
--8. Write a SQL query to find the person who has the most friends.
with cte as (
    Select requester_id as id from RequestAccepted
UNION ALL 
Select accepter_id as id from RequestAccepted
)
Select top 1 ID, COUNT(ID) num 
from cte
group by id 
order by num desc

--9. Create a View for Customer Order Summary
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);


Create view vw_CustomerOrderSummary as 
Select c.customer_id, c.name , count(*) TotalOrders, 
Sum(amount) TotalAmount, Max(order_date) Lastorderdate
from Customers c 
join Orders o 
on c.customer_id=o.customer_id
group by c.customer_id, c.name

Select * from vw_CustomerOrderSummary
