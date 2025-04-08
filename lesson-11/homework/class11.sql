create database homework_11

use  class_9
--1. Return: OrderID, CustomerName, OrderDate
--Task: Show all orders placed after 2022 along with the names of the customers who placed them.
--Tables Used: Orders, Customers
Select OrderID, firstname, orderdate
from Customers c
join Orders o
on c.CustomerID=o.CustomerID
And YEAR(OrderDate) > 2022
--2.Display the names of employees who work in either the Sales or Marketing department.
Select e.name, d.departmentname 
from Employees e
join Departments d
on d.DepartmentID=e.DepartmentID
And DepartmentName='Sales' or DepartmentName='Marketing'
--3. #For each department, show the name of the employee who earns the highest salary.
Select distinct Departmentname, Name as TopEmployeename, Max(Salary) as Maxsalary
from Employees e
join Departments d 
on e.DepartmentID=d.DepartmentID
group by DepartmentName, Name

--4. List all customers from the USA who placed orders in the year 2023
Select FirstName, orderid, orderdate 
from Customers c
join orders o 
on c.CustomerID=o.CustomerID
And c.Country ='USA' and Year(OrderDate)>2023
--5. Show how many orders each customer has placed.
Select * from Orders
Select * from Customers
Select firstname, Count(o.Quantity) as TotalOrders
from Orders o
left join customers c
on o.CustomerID=c.CustomerID
group by FirstName
--6. Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
Select * from Products
Select * from Suppliers

Select Productname, Suppliername 
from Products p
join Suppliers s
on p.SupplierID=s.SupplierID
And s.SupplierName='Gadget Supplies' or s.SupplierName= 'Clothing mart'
--7. #For each customer, show their most recent order. Include customers who haven't placed any orders.
SELECT c.FirstName, o1.OrderID, o1.OrderDate as MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o1 ON c.CustomerID = o1.CustomerID
LEFT JOIN Orders o2 
    ON c.CustomerID = o2.CustomerID AND o1.OrderDate < o2.OrderDate
WHERE o2.OrderID IS NULL;
--8. Show the customers who have placed an order where the total amount is greater than 500.
Select * from orders 
Select * from Customers
Select Firstname, orderid, TotalAmount as OrderTotal
from customers c
join orders o
on c.CustomerID=o.CustomerID
And TotalAmount>500 
--9. List product sales where the sale was made in 2022 or the sale amount exceeded 400.
Select * from Sales

Select Productname, Saledate, Saleamount
from Products p
join Sales s
on p.ProductID=s.ProductID
And Year(saledate)=2022 or SaleAmount > '400'
--10. Display each product along with the total amount it has been sold for.
Select productname, Sum(SaleAmount) as TotalSalesAmount
from Products p
join Sales s
on p.ProductID=s.CustomerID
group by ProductName
--11. Show the employees who work in the HR department and earn a salary greater than 50000.
Select * from Employees
Select * from Departments
Select Name, Departmentname, Salary
from Employees e
join Departments d
on e.DepartmentID=d.DepartmentID
Where DepartmentName='Human Resources' and Salary> 50000

--12. List the products that were sold in 2023 and had more than 50 units in stock at the time
Select productname, saledate, stockquantity
from Products p 
join sales s
on p.ProductID=s.ProductID
where Year(Saledate)=2023 and StockQuantity>50
--13. Show employees who either work in the Sales department or were hired after 2020
Select e.Name, DepartmentName, HireDate 
from Employees e
join Departments d
on e.DepartmentID=d.DepartmentID
Where DepartmentName='Sales' AND Year(hiredate)>2020
--14. List all orders made by customers in the USA whose address starts with 4 digits
Select firstname, orderid, orderdate
from Customers c
join Orders o
on c.CustomerID=o.CustomerID
And Country ='USA' where Address like '4%'
--15. Display product sales for items in the Electronics category or where the sale amount exceeded 350

Select productname, category, saleamount 
from products p 
join sales s 
on p.ProductID=s.ProductID
Where Category=1 or SaleAmount> 350
--16. Show the number of products available in each category
Select categoryname, count(productname) as ProductCount
from Categories c
join Products p
on c.CategoryID=p.Category
group by CategoryName
--17. List orders where the customer is from Los Angeles and the order amount is greater than 300
Select firstname, city, orderid, TotalAmount
from customers c
join orders o
on c.CustomerID=o.CustomerID
Where city='Los Angeles' and TotalAmount > 300
--18. #Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels
Select Name, Departmentname 
from Employees e
join Departments d
on e.DepartmentID=d.DepartmentID
Where DepartmentName in ('Human Resources', 'Finance')
or name like '[aoeiu]'
--19.List products that had a sales quantity above 100 and a price above 500
Select productname, StockQuantity, Price
from sales s
join Products p 
on p.ProductID=s.ProductID
where StockQuantity > 100 and price > 500
--20. Show employees who are in the Sales or Marketing department and have a salary above 60000
Select Name, DepartmentName, Salary 
from Employees e 
join Departments d 
on e.DepartmentID=d.DepartmentID
Where DepartmentName in ('Sales', 'Marketing') and Salary >60000






