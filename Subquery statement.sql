# Find all items for which more than 2 orders have been placed
USE littlelemondb;

SELECT m.ItemName
FROM menu as m
WHERE m.MenuItemID IN (
	SELECT od.MenuItem 
    FROM order_line_items AS od
    GROUP BY od.MenuItem
    HAVING SUM(od.Quantity) > 2);