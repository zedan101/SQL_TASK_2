/****** Script for SelectTopNRows command from SSMS  ******/
/*
31. Who is the quickest shipper of all.
Ans=>SELECT TOP 1 sh.ShipperId , sh.CompanyName , AVG(DATEDIFF(DAY,o.OrderDate,o.ShippedDate)) AS DaysTaken FROM Orders o
		JOIN Shippers sh ON sh.ShipperId = o.ShipperId
		GROUP BY sh.ShipperId , sh.CompanyName
		ORDER BY AVG(DATEDIFF(DAY,o.OrderDate,o.ShippedDate))
*/

/*
32. Which order took the least number of shipping days. Get the orderid, employees full name, number of 
products, number of days took to ship and shipper company name.
Ans=>SELECT TOP 1 o.OrderId , ep.FirstName+' '+ep.LastName AS FullName,
		od.Quantity AS NoOfProduct,DATEDIFF(DAY,o.OrderDate,o.ShippedDate) AS DaysTaken,sh.CompanyName FROM Orders o
		JOIN Employee ep ON ep.EmployeeId = o.EmployeeId
		Join OrderDetails od ON od.OrderId = o.OrderId
		JOIN Shippers sh ON sh.ShipperId = o.ShipperId
		WHERE DATEDIFF(DAY,o.OrderDate,o.ShippedDate) IS NOT NULL
		ORDER BY DATEDIFF(DAY,o.OrderDate,o.ShippedDate)
*/

/*
33. Which orders took the least number and maximum number of shipping days? Get the orderid, employees 
full name, number of products, number of days taken to ship the product and shipper company name. Use 
1 and 2 in the final result set to distinguish the 2 orders.
Ans=>select * from ( SELECT TOP 1 o.OrderId , ep.FirstName+' '+ep.LastName AS FullName,
		od.Quantity AS NoOfProduct,DATEDIFF(DAY,o.OrderDate,o.ShippedDate) AS DaysTaken,sh.CompanyName FROM Orders o
		JOIN Employee ep ON ep.EmployeeId = o.EmployeeId
		Join OrderDetails od ON od.OrderId = o.OrderId
		JOIN Shippers sh ON sh.ShipperId = o.ShipperId
		WHERE DATEDIFF(DAY,o.OrderDate,o.ShippedDate) IS NOT NULL
		ORDER BY DATEDIFF(DAY,o.OrderDate,o.ShippedDate)) AS s
		union
		select * from (
		SELECT TOP 1 o.OrderId , ep.FirstName+' '+ep.LastName AS FullName,
		od.Quantity AS NoOfProduct,DATEDIFF(DAY,o.OrderDate,o.ShippedDate) AS DaysTaken,sh.CompanyName FROM Orders o
		JOIN Employee ep ON ep.EmployeeId = o.EmployeeId
		Join OrderDetails od ON od.OrderId = o.OrderId
		JOIN Shippers sh ON sh.ShipperId = o.ShipperId
		WHERE DATEDIFF(DAY,o.OrderDate,o.ShippedDate) IS NOT NULL
		ORDER BY DATEDIFF(DAY,o.OrderDate,o.ShippedDate) DESC) AS a
*/

/*
34. Which is cheapest and the costliest of products purchased in the second week of October, 1997. Get the 
product ID, product Name and unit price. Use 1 and 2 in the final result set to distinguish the 2 products.
Ans=>Select * FROM (SELECT TOP 1 od.ProductId , p.ProductName , od.UnitPrice , SUM(od.Quantity*od.UnitPrice) as Cost FROM OrderDetails od
		JOIN Products p ON p.productId = od.ProductId
		JOIN Orders o ON o.orderId =od.OrderId
		WHERE o.OrderDate BETWEEN '1997-10-01' AND '1997-10-07' 
		GROUP BY p.ProductName,od.ProductID,od.UnitPrice
		ORDER BY SUM(od.Quantity*od.UnitPrice)) as a
		UNION
		select * from (SELECT TOP 1 od.ProductId , p.ProductName , od.UnitPrice , SUM(od.Quantity*od.UnitPrice) as Cost FROM OrderDetails od
		JOIN Products p ON p.productId = od.ProductId
		JOIN Orders o ON o.orderId =od.OrderId
		WHERE o.OrderDate BETWEEN '1997-10-01' AND '1997-10-07' 
		GROUP BY p.ProductName,od.ProductID,od.UnitPrice
		ORDER BY SUM(od.Quantity*od.UnitPrice) DESC) as b
*/

/*
35. Find the distinct shippers who are to ship the orders placed by employees with IDs 1, 3, 5, 7
Show the shipper's name as "Express Speedy" if the shipper's ID is 2 and "United Package" if the shipper's 
ID is 3 and "Shipping Federal" if the shipper's ID is 1.
Ans=>SELECT DISTINCT CASE
		WHEN ShipperId  = '2' THEN 'Express Speedy'
		WHEN ShipperId  = '3' THEN 'United Package'
		WHEN ShipperId  = '1' THEN 'Shipping Federal'
		END AS CompanyName , ShipperID,Phone
		FROM Shippers
		WHERE ShipperID IN (SELECT ShipperID FROM Orders 
		WHERE EmployeeID = '1' OR EmployeeID = '3' OR EmployeeID = '5' OR EmployeeID = '7')
*/

