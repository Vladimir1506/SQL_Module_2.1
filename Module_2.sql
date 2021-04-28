/*Задание 1
SCHEMA:

Create table Person (PersonId int, FirstName varchar(255), LastName varchar(255))
Create table Address (AddressId int, PersonId int, City varchar(255), State varchar(255))
Truncate table Person
insert into Person (PersonId, LastName, FirstName) values ('1', 'Wang', 'Allen')
Truncate table Address
insert into Address (AddressId, PersonId, City, State) values ('1', '2', 'New York City', 'New York')

Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
FirstName, LastName, City, State*/

SELECT Person.FirstName, Person.LastName, Address.City, Address.State
FROM Person
LEFT JOIN ADDRESS
ON Person.PersonId=Address.PersonId

/*Задание 2
SCHEMA:

Create table If Not Exists Employee (Id int, Salary int)
Truncate table Employee
insert into Employee (Id, Salary) values ('1', '100')
insert into Employee (Id, Salary) values ('2', '200')
insert into Employee (Id, Salary) values ('3', '300')

Write a SQL query to get the second highest salary from the Employee table.*/

SELECT MAX(Salary) 
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee)

/*Задание 3
SCHEMA:

Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, ManagerId int)
Truncate table Employee
insert into Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3')
insert into Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4')
insert into Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', 'None')
insert into Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', 'None')
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.*/

SELECT Name 
FROM Employee 
LEFT JOIN Manager 
ON Employee.ManagerId=Manager.Id 
WHERE Employee.Salary > Manager.Salary

/*Задание 4
SCHEMA:

Create table If Not Exists Person (Id int, Email varchar(255))
Truncate table Person
insert into Person (Id, Email) values ('1', 'a@b.com')
insert into Person (Id, Email) values ('2', 'c@d.com')
insert into Person (Id, Email) values ('3', 'a@b.com')

Write a SQL query to find all duplicate emails in a table named Person.
Note: All emails are in lowercase.*/

SELECT Email 
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1

/*Задание 5
SCHEMA:

Create table If Not Exists Customers (Id int, Name varchar(255))
Create table If Not Exists Orders (Id int, CustomerId int)
Truncate table Customers
insert into Customers (Id, Name) values ('1', 'Joe')
insert into Customers (Id, Name) values ('2', 'Henry')
insert into Customers (Id, Name) values ('3', 'Sam')
insert into Customers (Id, Name) values ('4', 'Max')
Truncate table Orders
insert into Orders (Id, CustomerId) values ('1', '3')
insert into Orders (Id, CustomerId) values ('2', '1')

Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.*/

SELECT Name 
FROM Customers 
WHERE Name 
NOT IN (SELECT Name FROM Customers 
JOIN Orders ON Customers.Id = Orders.Id)

/*Задание 6
SCHEMA:

Create table If Not Exists courses (student varchar(255), class varchar(255))
Truncate table courses
insert into courses (student, class) values ('A', 'Math')
insert into courses (student, class) values ('B', 'English')
insert into courses (student, class) values ('C', 'Math')
insert into courses (student, class) values ('D', 'Biology')
insert into courses (student, class) values ('E', 'Math')
insert into courses (student, class) values ('F', 'Computer')
insert into courses (student, class) values ('G', 'Math')
insert into courses (student, class) values ('H', 'Math')
insert into courses (student, class) values ('I', 'Math')

There is a table courses with columns: student and class
Please list out all classes which have more than or equal to 5 students.*/

SELECT class 
FROM courses
GROUP BY class 
HAVING COUNT(class) >= 5
