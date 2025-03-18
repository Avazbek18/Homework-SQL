Create database F24_class2 
use F24_class2
create table Employees (EmpID int, [Name] varchar (50), Salary Decimal (10,2))

insert into Employees values (1, 'Nick', 1400)
insert into Employees values (2, 'Alice', 1500)
insert into Employees values (3, 'Alex', 1600)

Select * from Employees 

insert into Employees values (4, 'Ostin', 1550), (5, 'Jack', 1300), (6, 'Joe', 1450)

Update Employees 
Set Salary = 1250
Where EmpID=1

Delete from Employees 
Where EmpID = 2

create table staff (
id int primary key,
first_name Varchar(50),
position varchar (50)
)

Insert into staff ( id, first_name, position) values
(1, 'Alice', 'Manager'),
(2, 'Bob', 'Analyst'),
(3, 'Charlie', 'Clerk');

Select * from staff

Truncate table staff
Select * from staff

Delete from staff where id=2
Select * from staff

Drop table staff 
Select * from staff

Alter table Employees
Alter column Name varchar (100) 
Select * from Employees 


Alter table Employees 
ADD Department varchar (50)
Select * from Employees

Alter table Employees 
Alter column Salary FLOAT;

Select * from Employees

Create table Department (
DepartmentID int primary key,
DepartmentName varchar(50)
);

 Truncate table Employees 
 Select * from Employees 

Alter table Employees 
Drop column EmpID
Select * from Employees

drop table Employees

create table Employees (id int, Department varchar(50))
insert into Employees values (1, 'HR'), (2, 'IT'), (3, 'Finance'), (4, 'Marketing'), (5, 'Sales')
Select * from Employees

insert into Department
Select ID, Department from Employees

Select * from Department

Alter table Department
ADD Salary int

Update Department
Set Salary =
 case 
 when DepartmentID=1 then 6000
 when DepartmentID=2 then 4500
 when DepartmentID=3 then 7000
 when DepartmentID=4 then 5200
 when DepartmentID=5 then 4800
 End;

 Delete from Employees
 Select * from Employees

 Alter table Employees 
 Drop column Department

EXEC sp_rename 'Employees', 'StaffMembers' 

Drop table Department

Create table Products ( ProductID int primary key,
ProductName varchar (50), 
Category varchar(50),
Price decimal (10,2)
check (price>0))

Alter table Products 
Add StockQuantity int default 50

Select * from Products

Exec sp_rename 'Products.Category', 'ProductCategory', 'Column';


 Insert into Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
 Values 
 (1, 'Iphone', 'Electronics', 800.50, 50),
 (2, 'Watch', 'Accessories', 600.50, 600),
 (3, 'Shoes', 'Apparel', 300.50, 45),
 (4, 'Tablet', 'Electronics', 1200.00, 25),
 (5, 'TV', 'Electronics', 1550.50, 20);

 Select * from Products

 Select * into Products_Backup from Products

 Exec sp_rename 'Products', 'Inventory'

 Alter table Inventory
 Alter column Price float

 Alter table Inventory 
 ADD ProductCode int identity(1000, 5);















