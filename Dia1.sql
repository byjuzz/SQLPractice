select * from Customers


select * from Customers where Country = 'Costa Rica' 

select * from Products where UnitPrice > 100

select * from Orders  WHERE OrderDate >= '2025-05-01'

SELECT 
    oi.OrderItemID,
    o.OrderID,
    c.FullName AS Customer,
    p.ProductName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) AS LineTotal
FROM dbo.OrderItems oi
JOIN dbo.Orders    o ON oi.OrderID = o.OrderID
JOIN dbo.Customers c ON o.CustomerID = c.CustomerID
JOIN dbo.Products  p ON oi.ProductID = p.ProductID;


select 
os.orderid, 
os.CustomerID, 
os.OrderDate, 
cs.FullName 
from orders os 
inner join Customers cs 
on os.CustomerID = cs.CustomerID  

select * from Customers cs 
inner join Orders ors on cs.CustomerID = ors.CustomerID 

select  CUS.CustomerID, CUS.FullName, SUM(OIS.Quantity * OIS.UnitPrice) as SumaTotal  
from OrderItems OIS 
inner join Orders ORS on OIS.OrderID = ORS.OrderID
inner join Customers CUS on ORS.CustomerID = CUS.CustomerID
inner join Products PRS on OIs.ProductID = PRS.ProductID
GROUP by CUS.CustomerID, CUS.FullName
order by SumaTotal Desc 

select * from OrderItems a inner join orders b on a.orderId = b.orderid where b.customerid = 1
select * from Products


select * from Orders
select * from Products
