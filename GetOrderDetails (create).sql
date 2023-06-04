# Prepared statement for getting the details of a customer's order
USE littlelemondb;

PREPARE GetOrderDetails FROM
	'SELECT o.OrderID,
		(SELECT SUM(Quantity) FROM order_line_items AS od
		GROUP BY od.OrderID
		HAVING od.OrderID = o.OrderID) AS "Quantity",
		o.TotalCost
	FROM orders AS o
    WHERE o.CustomerID = ?';