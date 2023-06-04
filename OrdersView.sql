# A view for summarizing order data
USE littlelemondb;

CREATE VIEW OrdersView AS
SELECT o.OrderID, 
	(SELECT SUM(od.Quantity)
	FROM order_line_items AS od
    WHERE od.OrderID = o.OrderID
	GROUP BY OrderID) AS Qty,
    o.TotalCost
FROM orders as o
WHERE (SELECT SUM(od.Quantity)
	FROM order_line_items AS od
    WHERE od.OrderID = o.OrderID
	GROUP BY OrderID) > 2;