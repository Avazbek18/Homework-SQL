create database home_class16
use home_class16
DROP TABLE IF EXISTS Grouped;
--1. De-Group the data 
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil',3),('Eraser',4),('Notebook',2);
Select * from Grouped;

with cte as (
Select Product, Quantity from Grouped
union all
Select Product, Quantity - 1 from cte where Quantity - 1 > 0
)
Select Product, 1 as Quantity from cte ;
--2. Region Sales Report
DROP TABLE IF EXISTS #RegionSales;
CREATE TABLE #RegionSales
(
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10),
('South','ACE',67),
('East','ACE',54),
('North','ACME',65),
('South','ACME',9),
('East','ACME',1),
('West','ACME',7),
('North','Direct Parts',8),
('South','Direct Parts',7),
('West','Direct Parts',12);

Select * from #RegionSales;
with Allregions as (
Select distinct region from #RegionSales
)
, Alldistributors as 
(
Select DISTINCT Distributor from #RegionSales
)
Select allregions.region, Alldistributors.distributor,
isnull (#RegionSales.sales, 0) from Allregions 
cross join Alldistributors left join #RegionSales
on Allregions.region= #RegionSales.Region
and Alldistributors.Distributor=#RegionSales.Distributor
--3. Managers With At Least 5 Reports
CREATE TABLE Employee (
  id INT,
  name VARCHAR(255),
  department VARCHAR(255),
  managerId INT
);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

--Task 3: Managers With At Least 5 Reports
Select * from Employee;
with cte as  (
    Select managerid, count(managerid) as countemp
from Employee 
group by managerid
having count(managerid)>=5
)
Select name from employee e 
join cte c
on e.id=c.managerid
--Task4. Products Ordered in February 2020 (>= 100 units)
CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(40),
  product_category VARCHAR(40)
);
CREATE TABLE Orders (
  product_id INT,
  order_date DATE,
  unit INT
);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

Select * from Products
Select * from Orders;
WITH February2020Orders AS (
    SELECT
        product_id,
        SUM(unit) AS unit_feb_2020
    FROM
        Orders
    WHERE
        YEAR(order_date) = 2020 AND MONTH(order_date) = 2
    GROUP BY
        product_id
    HAVING
        SUM(unit) >= 100
)
SELECT
    p.product_name,
    f.unit_feb_2020 AS unit
FROM
    Products p
JOIN
    February2020Orders f ON p.product_id = f.product_id;
--7. 
CREATE TABLE Device (
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Hosur'),
(12, 'Hosur'),
(13, 'Hyderabad'),
(13, 'Hyderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad');
Select * from Device
Select device_id , count(locations) no_of_location, 
max(locations) max_signal_location, count(device_id) no_of_signals
from Device
group by Device_id
--8. 
Drop table if exists Employee
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001, 'Mark', 60000, 2),
(1002, 'Antony', 40000, 2),
(1003, 'Andrew', 15000, 1),
(1004, 'Peter', 35000, 1),
(1005, 'John', 55000, 1),
(1006, 'Albert', 25000, 3),
(1007, 'Donald', 35000, 3);
Select * from Employee;
with cte_Avg_salary as (
Select DeptID, Avg(salary) as Avg_salary
from Employee
group by DeptID
)
Select Empid, Empname, Salary 
from Employee e 
join cte_Avg_salary cas 
on e.DeptID=cas.DeptID
and e.Salary>cas.Avg_salary
order by EmpID asc
--9. Office Lottery Winnings
-- Winning Numbers
CREATE TABLE WinningNumbers (Number INT);
INSERT INTO WinningNumbers VALUES (25), (45), (78);

-- Tickets
CREATE TABLE WinningNumbers (Number INT);
INSERT INTO WinningNumbers VALUES (25), (45), (78);
Select * from WinningNumbers
CREATE TABLE Tickets (TicketID VARCHAR(10), Number INT);
INSERT INTO Tickets VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);
Select * from Tickets
Select * from WinningNumbers;

with TicketMatchCounts as (
    Select t.TicketID, count(t.Number) as matching_numbers,
	(select count(*) From WinningNumbers) as total_winning_numbers
    from Tickets t
    join WinningNumbers w on t.Number = w.Number
    group by t.TicketID
)
Select
sum(
case when tmc.matching_numbers=tmc.total_winning_numbers 
then 100
when tmc.matching_numbers>0 then 10
else 0
end) as Totalwinnings
from 
TicketMatchCounts tmc
--10. 
    CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

Select * from Spending;

