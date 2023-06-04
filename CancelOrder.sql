# Stored procedure for deleting an order by OrderID
USE littlelemondb;

DELIMITER $$
	CREATE PROCEDURE CancelOrder(IN order_id INT)
		BEGIN
			DELETE FROM orders WHERE OrderID = order_id;
			SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
		END $$
DELIMITER ;