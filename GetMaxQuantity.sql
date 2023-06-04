# Stored procedure for returning the maximum quantity ordered of any single item
USE littlelemondb;

DELIMITER $$
	CREATE PROCEDURE GetMaxQuantity()
		BEGIN
			SELECT MAX(Quantity) AS "Max Quantity Ordered"
			FROM order_line_items;
		END $$
DELIMITER ;
