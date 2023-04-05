/****** Script for SelectTopNRows command from SSMS  ******/
/*
21. How many orders are placed for the products supplied from UK and Germany.
Ans=>SELECT COUNT(OrderId) From Orders 
		WHERE ShipCountry = 'UK' OR ShipCountry = 'Germany'
*/

/*
22. How much amount Exotic Liquids received due to the order placed for its products in the month of 
January,1997.
Ans=>SELECT SUM(Quantity*UnitPrice) AS AmountRecieved FROM OrderDetails
		WHERE ProductId IN (SELECT ProductId FROM Products
		WHERE SupplierId IN (SELECT SupplierId FROM Suppliers
		WHERE CompanyName = 'Exotic Liquids'))
		AND OrderID IN (SELECT OrderID FROM Orders
		WHERE OrderDate BETWEEN '1997-01-01' AND '1997-01-31')
*/

/*
23. In which days of January, 1997, the supplier Tokyo Traders haven't received any orders.
Ans=>SELECT DISTINCT OrderDate FROM Orders 
		WHERE OrderDate BETWEEN '1997-01-01' AND '1997-01-31' 
		AND OrderId NOT IN (SELECT OrderId FROM OrderDetails
		WHERE ProductId IN (SELECT ProductId FROM Products
		WHERE SupplierId IN (SELECT SupplierId FROM Suppliers
		WHERE CompanyName = 'Tokyo Traders')))
*/

/*
24. Which of the employees did not place any order for the products supplied by Ma Maison in the month of 
May.
Ans=>SELECT * FROM Employee WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Orders 
		WHERE OrderDate BETWEEN '1997-05-01' AND '1997-05-31' 
		AND OrderId  IN (SELECT OrderId FROM OrderDetails
		WHERE ProductId IN (SELECT ProductId FROM Products
		WHERE SupplierId IN (SELECT SupplierId FROM Suppliers
		WHERE CompanyName = 'Ma Maison'))))
*/

/*
25. Which shipper shipped the least number of products for the month of September and October,1997 
combined.
Ans=> SELECT TOP 1 sh.CompanyName , SUM(od.Quantity) FROM Shippers sh
		JOIN OrderDetails od ON od.OrderId IN (SELECT OrderID FROM Orders 
		WHERE ShipperId = sh.ShipperId AND OrderDate BETWEEN '1997-09-01' AND '1997-10-31')
		GROUP BY sh.CompanyName
		ORDER BY SUM(od.Quantity) 
*/

/*
26. What are the products that weren't shipped at all in the month of August, 1997.
Ans=>SELECT * From Products 
		WHERE ProductId NOT IN (SELECT ProductId FROM OrderDetails 
		WHERE OrderId IN (SELECT OrderId FROM Orders 
		Where OrderDate BETWEEN '1997-08-01' AND '1997-08-31') )
*/

/*
27. What are the products that weren't ordered by each of the employees. List each employee and the 
products that he didn't order.
Ans=> SELECT p.ProductName , ep.FirstName+' '+ep.LastName AS FullName FROM Products p
		JOIN Employee ep ON ep.EmployeeId NOT IN (SELECT EmployeeId FROM Orders 
		WHERE OrderId IN (SELECT OrderId FROM OrderDetails 
		WHERE ProductID = p.ProductId))
		GROUP BY ep.FirstName+' '+ep.LastName,p.ProductName
*/

/*
28. Who is busiest shipper in the months of April, May and June during the year 1996 and 1997.
Ans=>SELECT TOP 1 sh.ShipperId , sh.CompanyName , COUNT(o.OrderId) FROM Orders o
		JOIN Shippers sh ON sh.ShipperId NOT IN (SELECT ShipperId FROM Orders 
		WHERE (OrderDate BETWEEN '1996-04-01' AND '1996-06-30') AND (OrderDate BETWEEN '1997-04-01' AND '1997-06-30')) 
		WHERE o.ShipperId = sh.ShipperId
		GROUP BY sh.ShipperId,sh.CompanyName
		ORDER BY COUNT(o.OrderId) DESC
*/

/*
29. Which country supplied the maximum products for all the employees in the year 1997.
Ans=> SELECT TOP 1 o.ShipCountry , SUM(od.Quantity) FROM Orders o
		JOIN OrderDetails od ON od.OrderId = o.OrderId
		WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
		GROUP BY o.ShipCountry
		ORDER BY SUM(od.Quantity) DESC
*/

/*
30. What is the average number of days taken by all shippers to ship the product after the order has been 
placed by the employees.
Ans=>SELECT sh.ShipperId , sh.CompanyName , AVG(DATEDIFF(DAY,o.OrderDate,o.ShippedDate)) AS DaysTaken FROM Orders o
		JOIN Shippers sh ON sh.ShipperId = o.ShipperId
		GROUP BY sh.ShipperId , sh.CompanyName
		ORDER BY AVG(DATEDIFF(DAY,o.OrderDate,o.ShippedDate))
*/
