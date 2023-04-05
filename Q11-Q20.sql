/****** Script for SelectTopNRows command from SSMS  ******/
/* 
11. How many number of unique employees placed orders for Gorgonzola Telino or Gnocchi di nonna Alice or 
Raclette Courdavault or Camembert Pierrot in the month January,1997.
Ans=>SELECT  COUNT(DISTINCT EmployeeID) FROM Orders 
		WHERE OrderDate BETWEEN '1997-01-01' AND '1997-01-31'
		AND OrderId IN (SELECT OrderId FROM OrderDetails 
		Where ProductId IN (SELECT ProductId FROM Products 
		WHERE ProductName = 'Gorgonzola Telino' OR ProductName ='Gnocchi di nonna Alice'
		OR ProductName ='Raclette Courdavault' OR ProductName='Camembert Pierrot'))
*/

/* 
12. What is the full name of the employees who ordered Tofu between 13th of January,1997 and 30th of 
January,1997.
Ans=>SELECT FirstName+' '+LastName AS FullName FROM Employee
		WHERE EmployeeId IN (SELECT EmployeeId FROM Orders
		WHERE OrderDate BETWEEN '1997-01-13' AND '1997-01-30' AND OrderId IN (SELECT OrderId FROM OrderDetails
		WHERE ProductId In (SELECT ProductId FROM Products
		WHERE ProductName = 'Tofu')))
*/

/* 
13. What is the age of the employees in days, months and years who placed orders during the month of 
August. Get employeeID and full name as well.
Ans=>SELECT EmployeeID , FirstName+' '+LastName AS FullName ,DATEDIFF(yy,BirthDate,GETDATE()) AS AgeInYears,
		DATEDIFF(MONTH,BirthDate,GETDATE()) AS AgeInMonths, DATEDIFF(DAY,BirthDate,GETDATE())
		AS AgeInDays FROM Employee
		WHERE EmployeeID IN (SELECT EmployeeId FROM Orders WHERE OrderDate BETWEEN '1997-08-01' AND '1997-08-30')
*/

/* 
14. Get all the shipper's name and the number of orders they shipped.
Ans=>SELECT sh.CompanyName, Count(o.OrderId) AS OrderShipped FROM Shippers sh 
		JOIN Orders o ON o.ShipperId = sh.ShipperId
		GROUP BY CompanyName
*/

/*
15. Get the all shipper's name and the number of products they shipped.
Ans=>SELECT SUM(od.Quantity) AS NoOfProduct,sh.CompanyName FROM Shippers sh
		JOIN OrderDetails od ON od.OrderId IN (SELECT OrderId FROM Orders WHERE ShipperId = sh.ShipperId)
		GROUP BY sh.CompanyName
*/

/*
16. Which shipper has bagged most orders. Get the shipper's id, name and the number of orders.
Ans=>SELECT TOP 1  sh.CompanyName,sh.ShipperId, Count(o.OrderId) AS OrderCount FROM Shippers sh 
		JOIN Orders o ON o.ShipperId = sh.ShipperId
		GROUP BY sh.CompanyName,sh.ShipperId
		ORDER BY Count(o.OrderId) DESC
*/

/*
17. Which shipper supplied the most number of products between 10th August,1996 and 20th 
September,1998. Get the shipper's name and the number of products.
Ans=>SELECT TOP 1  sh.CompanyName,sh.ShipperId, Count(o.OrderId) AS OrderCount FROM Shippers sh 
		JOIN Orders o ON o.ShipperId = sh.ShipperId
		WHERE o.OrderDate BETWEEN '1996-08-10' AND '1998-09-20'
		GROUP BY sh.CompanyName,sh.ShipperId
		ORDER BY Count(o.OrderId) DESC
*/

/*
18. Which employee didn't order any product 4th of April 1997.
Ans=>SELECT * FROM Employee
		WHERE EmployeeID NOT IN (SELECT EmployeeId FROM Orders
		WHERE OrderDate = '1997-04-04')
*/

/*
19. How many products where shipped to Steven Buchanan.
Ans=>SELECT SUM(Quantity) FROM OrderDetails
		WHERE OrderID IN (SELECT OrderID FROM Orders 
		WHERE EmployeeID IN 
		(SELECT EmployeeID FROM Employee WHERE FirstName = 'Steven' AND LastName = 'Buchanan'))
*/

/*
20. How many orders where shipped to Michael Suyama by Federal Shipping.
Ans=>SELECT SUM(Quantity) FROM OrderDetails
		WHERE OrderID IN (SELECT OrderID FROM Orders 
		WHERE EmployeeID IN (SELECT EmployeeID FROM Employee WHERE FirstName = 'Michael' AND LastName = 'Suyama')
		AND ShipperID = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Federal Shipping'))
*/
