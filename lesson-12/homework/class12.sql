create database homework_class12
use homework_class12

Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

Select * from Person
Select * from Address
--1.Combine Two Tables
Select firstname, lastname,city, state from person p 
left join address a 
on p.personId=a.personId

--2. Employees Earning More Than Their Managers
Create table Employee (id int, name varchar(255), salary int, managerId int)
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

Select * from Employee

Select e2.name from employee e1
join Employee e2
on e1.id=e2.managerId
where e1.salary<e2.salary
--3. Duplicate Emails
Create table People (id int, email varchar(255)) 
insert into People (id, email) values ('1', 'a@b.com') 
insert into People(id, email) values ('2', 'c@d.com') 
insert into People(id, email) values ('3', 'a@b.com')
Select * from People

Select * from People 
SELECT email
From People
Group BY email
Having Count(*) > 1

--4. Delete Duplicate Emails

DELETE FROM People WHERE id NOT IN (SELECT MIN(id) FROM People GROUP BY email)

--5. Find those parents who has only girls.


Select distinct g.parentname 
 from boys b
 right join girls g
 on b.ParentName=g.ParentName
 where b.ParentName is null

 --6. 
 --7. CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO
INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

Select * from Cart1
select * from Cart2

Select a.Item C1,b.Item C2 from Cart1 a   full join Cart2 b on a.Item=b.Item
order by a.Item,b.Item
 --9
 Create table  Customers (id int, name varchar(255))
Create table  Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

select * from Customers
select * from Orders

select name from Customers c left join Orders o on c.id=o.customerId
where  o.customerId is null
--10
Create table  Students (student_id int, student_name varchar(20))
Create table  Subjects (subject_name varchar(20))
Create table  Examinations (student_id int, subject_name varchar(20))
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
Truncate table Subjects
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
Truncate table Examinations
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')

Select * from Students
select * from Subjects
select * from Examinations

Select s.student_id,student_name,sb.subject_name,count(e.subject_name) as attended_exams from Students s cross join Subjects sb 
left join Examinations e on s.student_id=e.student_id and sb.subject_name=e.subject_name
Group by s.student_id,student_name,sb.subject_name


select * FROM Students s CROSS JOIN Subjects 

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;