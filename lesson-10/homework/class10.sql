create database class_10 
use class_10
 --Questions 
 --1. Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
 Select e.Name, e.Salary, d.DepartmentName
 from [class_9]. [dbo].[Employees] e
 join [class_9]. [dbo].[Departments] d
 on e.DepartmentID=d.DepartmentID
 and e.Salary>50000
 --2. Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
 Select c.firstname, c.lastname, o.orderdate
 from [class_9]. [dbo].[Customers] c
 join [class_9].[dbo].[Orders] o
 on c.CustomerID=o.CustomerID
 And Year(o.OrderDate) >2023
 --3. Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
 Select e.name, d.departmentname 
 from [class_9]. [dbo].[Employees] e 
 left join [class_9]. [dbo].[Departments] d
 on e.DepartmentID=d.DepartmentID
 --4. Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product
 Select s.suppliername, p.productname 
 from class_9. [dbo].[Suppliers] s
 left join [class_9]. [dbo].[Products] p
 on s.SupplierID=p.SupplierID
 --5. Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
 Select * from [class_9]. [dbo].[Payments]
 Select o.orderid, o.orderdate, p.paymentdate, p.amount
 from [class_9].[dbo].[Orders] o 
 left join [class_9]. [dbo].[Payments] p
 on o.orderid=p.OrderID
 --6. Using the Employees table, write a query to show each employee's name along with the name of their manager.
 Select * from  [class_9]. [dbo].[Employees] e
 Select e.name, m.Name as managername from [class_9]. [dbo].[Employees] e
 left join  [class_9]. [dbo].[Employees] m 
 on e.ManagerID=m.EmployeeID
 --7. Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'
 Select s.name, c.coursename
 from [class_9].[dbo].[Students] s
 join [class_9].[dbo].[Enrollments] e
 on s.StudentID=e.studentid
 join [class_9].[dbo].[Courses] c
 on c.CourseID=e.CourseID
 where c.CourseName='math 101'
 --8. Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
 Select c.firstname, c.lastname, o.Quantity
 from [class_9]. [dbo].[Customers] c
 join [class_9].[dbo].[Orders] o
 on c.CustomerID=o.CustomerID
 where o.Quantity > 3
 --9. Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
 Select e.name, d.departmentname
 from [class_9]. [dbo].[Employees] e 
 join [class_9]. [dbo].[Departments] d
 on e.DepartmentID=d.DepartmentID
 where d.DepartmentName = 'human resources'
 --10. Using the Employees and Departments tables, write a query to return department names that have more than 10 employees.
 Select * from [class_9]. [dbo].[Employees]
 Select * from [class_9]. [dbo].[Departments]

 Select d.departmentname, count(e.departmentID) as EmployeeCount 
 from [class_9]. [dbo].[Employees] e
 join [class_9]. [dbo].[Departments] d
 on e.DepartmentID=d.DepartmentID
 group by d.DepartmentName
 having count(e.departmentID) >= 10
 --11. Using the Products and Sales tables, write a query to find products that have never been sold.
 Select * from [class_9]. [dbo].[Products]
 Select * from [class_9]. [dbo].[Sales]

 Select s.productid, p. productname 
 from [class_9]. [dbo].[Products] p
 left join [class_9]. [dbo].[Sales] s
 on p.ProductID=s.ProductID
 where s.ProductID is null
 --12. Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
 Select * from [class_9]. [dbo].[Customers]
 Select * from [class_9]. [dbo].[Orders]
 Select c.firstname, c.lastname, o.quantity as TotalOrders
 from [class_9]. [dbo].[Customers] c
 join [class_9]. [dbo].[Orders] o 
 on c.CustomerID=o.CustomerID
 Where o.Quantity > 1
 --13. Using the Employees and Departments tables, write a query to show only those records where both employee and department exist
 Select * from [class_9]. [dbo].[Employees]
 Select * from [class_9]. [dbo].[Departments]
 Select e.name, d.departmentname 
 from [class_9]. [dbo].[Employees] e
 join [class_9]. [dbo].[Departments] d
 on e.DepartmentID=d.DepartmentID
 --14. Using the Employees table, write a query to find pairs of employees who report to the same manager.
 Select * from [class_9]. [dbo].[Employees]
SELECT 
    E1.Name AS Employee1,
    E2.Name AS Employee2,
    E1.ManagerID
FROM 
   [class_9]. [dbo].[Employees]  E1
JOIN 
    [class_9]. [dbo].[Employees] E2 
    ON E1.ManagerID = E2.ManagerID
    AND E1.EmployeeID < E2.EmployeeID
WHERE 
    E1.ManagerID IS NOT NULL;
	--15. Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
	Select o.orderid, o.orderdate, c.firstname, c.lastname 
	from [class_9]. [dbo].[Orders] o 
	join [class_9]. [dbo].[Customers] c
	on o.CustomerID=c.CustomerID
	And Year(o.OrderDate) = 2022
	--16. Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
	Select e.name, e.salary, d.departmentname
	from [class_9]. [dbo].[Employees] e
	join [class_9]. [dbo].[Departments] d
	on e.DepartmentID=d.DepartmentID
	where d.DepartmentName ='Sales'
	And e.Salary >=60000

--17. Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
Select * from [class_9]. [dbo].[Orders]
select * from [class_9]. [dbo].[Payments]
Select o.orderid, o.OrderDate, p.paymentdate, p.amount
from [class_9]. [dbo].[Orders] o
join [class_9]. [dbo].[Payments] p
on o.orderid=p.OrderID 

--18. Using the Products and Orders tables, write a query to find products that were never ordered.
Select * from [class_9]. [dbo].[Orders]
Select * from [class_9]. [dbo].[Products]

Select p.productid, p.productname 
from [class_9]. [dbo].[Products] p 
left join [class_9]. [dbo].[Orders] o
on p.ProductID=o.ProductID
where o.ProductID is null
--20. Using the Employees table, write a query to find employees whose salary is greater than the average salary of all employees.
Select * from [class_9]. [dbo].[Employees]
SELECT name, salary FROM [class_9]. [dbo].[Employees]
WHERE salary > (SELECT avg(salary) FROM [class_9]. [dbo].[Employees])
--21. Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
Select * from [class_9]. [dbo].[Orders]
select * from [class_9]. [dbo].[Payments]
--Note2
Select o.orderid, o.OrderDate
from [class_9]. [dbo].[Orders] o
left join [class_9]. [dbo].[Payments] p
on o.orderid=p.OrderID 
Where p.OrderID is null
and Year(o.OrderDate) < 2022 
--22. Using the Products and Categories tables, write a query to return products that do not have a matching category.
Select * from [class_9]. [dbo].[Products]
Select * from [class_9].[dbo].[Categories]

Select p.productid, p.productname 
from [class_9]. [dbo].[Products] p
left join [class_9].[dbo].[Categories] c
on c.CategoryID=p.Category
where c.CategoryID is null
--23. Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
Select * from [class_9]. [dbo].[Employees]
Select e1.name Employee1, e2.name Employee2, e1.managerid, e1.Salary
	from [class_9]. [dbo].[Employees] e1
	join [class_9]. [dbo].[Employees] e2
	on e1.ManagerID=e2.ManagerID
	where e1.Salary >=60000
And	e1.EmployeeID < e2.EmployeeID
--24. Using the Employees and Departments tables, write a query to return employees who work in departments whose name starts with the letter 'M'.
Select e.name, d.departmentname 
from [class_9]. [dbo].[Employees] e
join [class_9]. [dbo].[Departments] d
on e.DepartmentID=d.DepartmentID
Where d.DepartmentName like 'M%'
--25. Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
Select * from [class_9]. [dbo].[Products]
Select * from [class_9]. [dbo].[Sales]
Select s.saleid, p.productname, s.saleamount
from [class_9]. [dbo].[Sales] s
join [class_9]. [dbo].[Products] p
on s.ProductID=p.ProductID
where s.SaleAmount>500
--26. Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'
Select * from [class_9]. [dbo].[Students]
Select * from [class_9]. [dbo].[Enrollments]
Select * from [class_9]. [dbo].[Courses]
SELECT s.StudentID, s.Name
FROM [class_9].[dbo].[Students] s
LEFT JOIN [class_9].[dbo].[Enrollments] e ON s.StudentID = e.StudentID
LEFT JOIN [class_9].[dbo].[Courses] c ON e.CourseID = c.CourseID
GROUP BY s.StudentID, s.Name
HAVING SUM(CASE WHEN c.CourseName = 'Math 101' THEN 1 ELSE 0 END) = 0;
--27. Using the Orders and Payments tables, write a query to return orders that are missing payment details.
Select o.orderID, o.OrderDate, p.paymentid
from [class_9]. [dbo].[Orders] o
left join [class_9]. [dbo].[Payments] p
on o.OrderID=p.OrderID
Where p.PaymentID is null
--28. Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
Select p.productid, p.productname, c.categoryname 
from [class_9]. [dbo].[Products] p
join [class_9].[dbo].[Categories] c
on p.Category=c.CategoryID
where c.CategoryName = 'Electronics' or c.CategoryName='Furniture'







