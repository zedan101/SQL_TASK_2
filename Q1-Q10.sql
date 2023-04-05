/****** Script for SelectTopNRows command from SSMS  ******/
/* 
1. Get the firstname and lastname of the employees who placed orders between 15th August,1996 and 15th 
August,1997.
Ans=>	SELECT FirstName , LastName From Employee 
		Where EmployeeId IN 
		(SELECT EmployeeId FROM Orders WHERE OrderDate BETWEEN '1996-08-15' AND '1997-08-15') 
*/

/* 
2. Get the distinct EmployeeIDs who placed orders before 16th October,1996.
Ans=>	SELECT DISTINCT EmployeeId From Orders 
		Where OrderDate < '1996-10-16'
*/

/* 
3. How many products were ordered in total by all employees between 13th of January,1997 and 16th of 
April,1997.
Ans=>	SELECT  COUNT(EmployeeId) AS ProductsOrdered From Orders 
		Where OrderDate BETWEEN '1997-01-13' AND '1997-04-16'
*/

/* 
4. What is the total quantity of products for which Anne Dodsworth placed orders between 13th of 
January,1997 and 16th of April,1997.
Ans=>SELECT SUM(Quantity) FROM OrderDetails
		WHERE OrderId IN (SELECT OrderId FROM Orders
		WHERE EmployeeId = (SELECT EmployeeId FROM Employee 
		WHERE FirstName = 'Anne' AND LastName = 'Dodsworth'))	
*/

/* 
5. How many orders have been placed in total by Robert King
Ans=>SELECT COUNT(OrderId) FROM Orders
		WHERE EmployeeId = (SELECT EmployeeId FROM Employee
		WHERE FirstName='Robert' AND LastName='King')	
*/

/* 
6. How many products have been ordered by Robert King between 15th August,1996 and 15th August,1997
Ans=>SELECT COUNT(OrderId) FROM Orders
		WHERE EmployeeId = (SELECT EmployeeId FROM Employee
		WHERE FirstName='Robert' AND LastName='King') AND 
		OrderDate BETWEEN '1996-08-15' AND '1997-08-15' 	
*/

/* 
7. I want to make a phone call to the employees to wish them on the occasion of Christmas who placed 
orders between 13th of January,1997 and 16th of April,1997. I want the EmployeeID, Employee Full Name, 
HomePhone Number.
Ans=>SELECT EmployeeId , FirstName+''+LastName AS FullName , HomePhone FROM Employee
		WHERE EmployeeId IN (SELECT EmployeeId From Orders
		WHERE OrderDate BETWEEN '1997-01-13' AND '1997-04-16')	
*/	

/* 
8. Which product received the most orders. Get the product's ID and Name and number of orders it received.
Ans=>SELECT TOP 1 p.ProductName, p.ProductId ,Count(od.OrderId) AS RecievedOrders FROM Products p
		JOIN OrderDetails od on od.ProductID = p.ProductID  
		GROUP BY p.ProductId,p.ProductName
		ORDER BY Count(od.OrderId) DESC	
*/

/*
9. Which are the least shipped products. List only the top 5 from your list.
Ans=>SELECT TOP 5 p.ProductName, p.ProductId ,Count(od.OrderId) AS ShippedCount FROM Products p
		JOIN OrderDetails od on od.ProductID = p.ProductID  
		GROUP BY p.ProductId,p.ProductName
		ORDER BY Count(od.OrderId) 		
*/

/*
10. What is the total price that is to be paid by Laura Callahan for the order placed on 13th of January,1997
Ans=>SELECT SUM(UnitPrice*Quantity-Discount) AS Price FROM OrderDetails
		WHERE OrderID IN (SELECT OrderID FROM Orders
		WHERE OrderDate = '1997-01-13' AND EmployeeID = (SELECT EmployeeID FROM Employee
		WHERE FirstName = 'Laura' AND LastName= 'Callahan')) 		
*/

