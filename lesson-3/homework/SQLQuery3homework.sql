BULK INSERT: A T-SQL command in SQL Server to quickly import large amounts of data from a file into a table.
SQL Server can import data from several formats, including CSV, Excel, Text, and XML. 

Create table Products (ProductID int primary key, ProductName varchar(50), Price decimal(10,2))
Insert into Products (ProductID, ProductName, Price) values
(1, 'Laptop', 1200),
(2, 'Shoes', 550),
(3, 'Watch', 400)
Select * from Products

In SQL, NULL represents the absence of a value, while NOT NULL ensures a column always contains a value and cannot be left empty. 
Example:

 CREATE TABLE Employees (
            ID INT,
            Name VARCHAR(255),
            Salary DECIMAL(10, 2),
            MiddleName VARCHAR(255) NULL  -- MiddleName can be NULL
        );
In this table MiddleName column can be left empty;

CREATE TABLE Customers (
            CustomerID INT NOT NULL, -- CustomerID cannot be NULL
            FirstName VARCHAR(255) NOT NULL, -- FirstName cannot be NULL
            LastName VARCHAR(255)
        );
In this table, CustomerID and FirstName are defined as NOT NULL, meaning they cannot be left empty and must always have a value;

Alter table Products
add constraint Uk_name unique(ProductName)
--The purpose of using UNIQUE constraint is that the combination of values in the particular column must be unique accross all rows in the table

Create table Categories (CategoryID int primary key, CategoryName varchar(50) unique)
insert into Categories (CategoryID, CategoryName) values 
(1, 'Electronics'),
(2, 'Apparel'),
(3, 'Clothes')
Select * from Categories

In SQL Server, an identity column automatically generates unique, sequential numeric values for each new row inserted into a table, 
often used as a primary key or unique identifier

Drop table Products
Create table Products (ProductID int, ProductName varchar(50), Price decimal(10,2), CategoryID int)

Insert into Products (ProductID, ProductName, Price, CategoryID) values
(1, 'Laptop', 1200, 1),
(2, 'Shoes', 550, 2),
(3, 'Watch', 400, 3)

Select * from Products

Alter table Products
ADD constraint FK_Products_Categories
Foreign key (CategoryID)
References Categories (CategoryID)

Select * from Products
Select * from Categories


The primary key uniquely identifies each record in the table. The unique key serves as a unique identifier for records when a primary key is absent. 
The primary key cannot store NULL values. The unique key can store a null value, but only one NULL value is allowed
Students Table:
student_id (Primary Key): Each student has a unique ID, and no ID can be null.
email_address (Unique Key): Each students email address is unique, but some students might not have an email address, allowing a null value;

Alter table Products 
ADD constraint CHK_Price_Positive check (Price > 0)

Alter table Products 
ADD Stock int not null default 0;-- default 0 -ensures that existing records receive default value (0) to satisfy the not null constraint


Update Products 
Set Stock = 0
Where Stock is null

In SQL Server, foreign key constraints enforce referential integrity by ensuring that 
values in a column (or columns) in one table (the "child" table) exist as primary or unique key values 
in another table (the "parent" table), preventing data inconsistencies and orphaned records

Create table Customers (
CustomerID int primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Age int constraint CHK_Age_Adult check (Age>=18)
)
Select * from Customers

create table Testidentity (id int identity(100, 10), name varchar(50))

Create table OrderDetails (
OrderID int,
Quantity int,
Price decimal(10,2),
constraint PK_OrderDetails primary key (OrderID, Quantity)
);

Create table Employees ( EmpID int primary key, Email varchar(100) unique)


