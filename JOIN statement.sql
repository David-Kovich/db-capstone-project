# Show customer and order info for orders over $40
USE littlelemondb;

SELECT c.CustomerID, concat(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderID, o.TotalCost,
	(SELECT m.ItemName FROM menu AS m JOIN order_line_items as od
		ON m.MenuItemID = od.MenuItem
	WHERE od.OrderID = o.OrderID
    ORDER BY m.Cost DESC LIMIT 1) AS CourseName
FROM customer_details as c JOIN orders as o
	ON c.CustomerID = o.CustomerID
WHERE o.TotalCost > 40
ORDER BY o.TotalCost ASC;