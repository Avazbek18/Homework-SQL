create database homework_class20
use homework_class20

CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');



--1.Find customers who purchased at least one item in March 2024 using EXISTS
Select * from #Sales s1
where exists (
Select * from #Sales s2
where SaleDate between '2024-03-01' and '2024-03-31'
and s1.SaleID=s2.SaleID
)

--2. Find the product with the highest total sales revenue using a subquery.
Select Product from #Sales
group by Product
having sum(quantity*price) = 
(Select max(total_revenue) from (Select product, sum(quantity*price) Total_revenue
from #Sales
group by product) as Revenue_total)
Select * from #Sales
--3. Find the second highest sale amount using a subquery
Select * from #Sales
where price =
(Select min(price) from #Sales where price in 
(
Select top 2 max(price) from #Sales 
group by Price
order by price desc
)
)
--4.Find the total quantity of products sold per month using a subquery
Select salemonth, sum(totalquantity) as Monthlyquantity
from (
Select format(saledate, 'yyyy-MM') as Salemonth,
Quantity as TotalQuantity
from #Sales
) as sub
Group by Salemonth
order by Salemonth
--5.Find customers who bought same products as another customer using EXISTS
Select * from #Sales
Select distinct CustomerName
from #Sales c1
where exists (
select * from #Sales c2 
where c2.SaleID<>c1.SaleID
and c2.Product=c1.Product
)
--6. Return how many fruits does each person have in individual fruit level
create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')
Select * from Fruits

SELECT
  name,
  (SELECT COUNT(*) FROM Fruits WHERE name = pf.name AND fruit = 'Apple') AS Apple,
  (SELECT COUNT(*) FROM Fruits WHERE name = pf.name AND fruit = 'Banana') AS Banana,
  (SELECT COUNT(*) FROM Fruits WHERE name = pf.name AND fruit = 'Orange') AS Orange
FROM (
  SELECT DISTINCT name
  FROM Fruits
) AS pf;
--7. Return older people in the family with younger ones

create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)
Select * from Family;

WITH Ancestors AS (
    -- Base case: direct parent-child pairs
    SELECT ParentId AS PID, ChildID AS CHID
    FROM Family

    UNION ALL

    -- Recursive step: extend the chain
    SELECT a.PID, f.ChildID
    FROM Ancestors a
    JOIN Family f ON a.CHID = f.ParentId
)
SELECT *
FROM Ancestors
ORDER BY PID, CHID;
--8. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas
CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

Select o.*
from #Orders o
where o.CustomerID in (
Select distinct CustomerID
from #Orders
where DeliveryState='CA'
)
AND o.DeliveryState='TX'

--9. Insert the names of residents if they are missing
create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')

Select * from #residents
UPDATE #residents
SET fullname = 
    CASE
        WHEN fullname IS NULL AND CHARINDEX('name=', address) > 0 
        THEN SUBSTRING(address, CHARINDEX('name=', address) + 5, CHARINDEX('age=', address) - CHARINDEX('name=', address) - 6)
        ELSE fullname
    END
WHERE fullname IS NULL;

--10. Write a query to return the route to reach from Tashkent to Khorezm. The result should include the cheapest and the most expensive routes

CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

Select * from #Routes;

WITH RouteDetails AS (
    -- Direct route from Tashkent to Khorezm
    SELECT DepartureCity, ArrivalCity, Cost
    FROM #Routes
    WHERE DepartureCity = 'Tashkent' AND ArrivalCity = 'Khorezm'
    
    UNION ALL
    
    -- Indirect route: Tashkent -> [intermediate city] -> Khorezm
    SELECT r1.DepartureCity, r2.ArrivalCity, r1.Cost + r2.Cost AS Cost
    FROM #Routes r1
    JOIN #Routes r2 ON r1.ArrivalCity = r2.DepartureCity
    WHERE r1.DepartureCity = 'Tashkent' AND r2.ArrivalCity = 'Khorezm'
    
    UNION ALL
    
    -- Further indirect route: Tashkent -> [city1] -> [city2] -> Khorezm
    SELECT r1.DepartureCity, r3.ArrivalCity, r1.Cost + r2.Cost + r3.Cost AS Cost
    FROM #Routes r1
    JOIN #Routes r2 ON r1.ArrivalCity = r2.DepartureCity
    JOIN #Routes r3 ON r2.ArrivalCity = r3.DepartureCity
    WHERE r1.DepartureCity = 'Tashkent' AND r3.ArrivalCity = 'Khorezm'
)
-- Now, select the cheapest and most expensive route from the possible routes
SELECT
    -- Cheapest route
    (SELECT TOP 1 DepartureCity + ' - ' + ArrivalCity + ' with cost ' + CAST(Cost AS VARCHAR) AS RouteInfo
     FROM RouteDetails
     ORDER BY Cost ASC) AS CheapestRoute,

    -- Most expensive route
    (SELECT TOP 1 DepartureCity + ' - ' + ArrivalCity + ' with cost ' + CAST(Cost AS VARCHAR) AS RouteInfo
     FROM RouteDetails
     ORDER BY Cost DESC) AS MostExpensiveRoute;


--11. Rank products based on their order of insertion.
CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

Select *from #RankingPuzzle
SELECT 
    ID,
    Vals,
    ROW_NUMBER() OVER (PARTITION BY Vals ORDER BY ID ASC) AS RankWithinGroup
FROM #RankingPuzzle;

--12. You have to return Ids, what number of the letter would be next if inserted, the maximum length of the consecutive occurence of the same digit
CREATE TABLE #Consecutives
(
     Id VARCHAR(5)  
    ,Vals INT /* Value can be 0 or 1 */
)
 
INSERT INTO #Consecutives VALUES
('a', 1),
('a', 0),
('a', 1),
('a', 1),
('a', 1),
('a', 0),
('b', 1),
('b', 1),
('b', 0),
('b', 1),
('b', 0)
Select * from #Consecutives;

WITH ConsecutiveData AS (
    -- Create a sequence of IDs with their order in the list
    SELECT 
        Id,
        Vals,
        ROW_NUMBER() OVER (PARTITION BY Id ORDER BY (SELECT NULL)) AS RowNum,
        LAG(Vals) OVER (PARTITION BY Id ORDER BY (SELECT NULL)) AS PrevVal
    FROM #Consecutives
),
ConsecutiveGroups AS (
    -- Group consecutive Vals based on the changes between them (using PrevVal to detect changes)
    SELECT 
        Id,
        Vals,
        RowNum,
        CASE 
            WHEN Vals = PrevVal THEN 0 -- Consecutive, so keep the group as same
            ELSE 1 -- New group due to value change
        END AS IsNewGroup
    FROM ConsecutiveData
),
GroupedConsecutives AS (
    -- Group by Id and consecutive groups to calculate the consecutive length
    SELECT 
        Id,
        Vals,
        COUNT(*) AS ConsecutiveLength,
        MIN(RowNum) AS StartRow -- Store the starting row of the consecutive sequence
    FROM ConsecutiveGroups
    GROUP BY Id, Vals, IsNewGroup
)
-- Final Query to return the required results
SELECT 
    Id,
    MAX(ConsecutiveLength) AS MaxConsecutiveLength,
    CASE 
        WHEN Vals = 1 THEN 0 -- If the last value is 1, next will be 0
        ELSE 1 -- If the last value is 0, next will be 1
    END AS NextValue
FROM GroupedConsecutives
GROUP BY Id, Vals
ORDER BY Id;

--13.Find employees whose sales were higher than the average sales in their department

CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

Select e.EmployeeID, e.EmployeeName, e.Department, e.SalesAmount
from #EmployeeSales e 
join (
Select department, avg(salesamount) as Avgsales
from #EmployeeSales
group by Department
) d_avg
on e.Department=d_avg.Department
where E.SalesAmount> d_avg.Avgsales

--14.Find employees who had the highest sales in any given month using EXISTS
Select * from #EmployeeSales e
where exists 
( Select * from #EmployeeSales e2 
where e2.SalesMonth=e.SalesMonth
and e2.SalesAmount=(select max(salesamount) from #EmployeeSales
where SalesMonth=e.SalesMonth)
and e2.EmployeeID=e.EmployeeID
)

--15. Find employees who made sales in every month using NOT EXISTS

SELECT e.EmployeeID, e.EmployeeName
FROM #EmployeeSales e
WHERE NOT EXISTS (
    -- Subquery to check if the employee is missing sales in any month
    SELECT 1
    FROM (
        SELECT DISTINCT SalesMonth, SalesYear
        FROM #EmployeeSales
    ) months
    WHERE NOT EXISTS (
        -- Check if the employee has sales for the month
        SELECT 1
        FROM #EmployeeSales es
        WHERE es.EmployeeID = e.EmployeeID
        AND es.SalesMonth = months.SalesMonth
        AND es.SalesYear = months.SalesYear
    )
);



--16. 
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

Select * from Products





