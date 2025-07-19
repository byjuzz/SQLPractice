SELECT
    C.CustomerID,
    C.FullName,
    SUM(OI.Quantity * OI.UnitPrice) AS TotalSpent
FROM Customers  AS C
JOIN Orders     AS O  ON O.CustomerID = C.CustomerID
JOIN OrderItems AS OI ON OI.OrderID   = O.OrderID
GROUP BY C.CustomerID, C.FullName
ORDER BY TotalSpent DESC;

select FORMAT(OrderDate, '2025-05-03') as resultado from Orders 


SELECT
    FORMAT(O.OrderDate,'yyyy-MM')  AS YearMonth,
    SUM(OI.Quantity * OI.UnitPrice) AS TotalSales,
    COUNT(DISTINCT O.OrderID)       AS OrderCount,
    CAST(SUM(OI.Quantity * OI.UnitPrice) / COUNT(DISTINCT O.OrderID) AS DECIMAL(10,2)) AS AvgTicket
FROM Orders O
JOIN OrderItems OI ON OI.OrderID = O.OrderID
GROUP BY FORMAT(O.OrderDate,'yyyy-MM')
ORDER BY YearMonth;



SELECT TOP 3 P.ProductID, P.ProductName, 
SUM(OI.Quantity*OI.UnitPrice) AS Revenue 
FROM OrderItems OI JOIN Products P ON P.ProductID = OI.ProductID 
GROUP BY P.ProductID, P.ProductName ORDER BY Revenue DESC;



select * from Customers
select * from OrderItems
select * from Orders
select * from Products


--CREATE VIEW CountryTotalSpending AS

SELECT
    C.CustomerID,
    C.Country,
    SUM(OI.Quantity * OI.UnitPrice) AS TotalSpent,
    COUNT(DISTINCT O.OrderID) AS OrdersCount
FROM Customers  AS C
JOIN Orders     AS O  ON O.CustomerID = C.CustomerID
JOIN OrderItems AS OI ON OI.OrderID   = O.OrderID
GROUP BY C.CustomerID, C.Country
HAVING COUNT(DISTINCT O.OrderID) > 1;

--select * from CountryTotalSpending 
