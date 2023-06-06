# Create stored procedure to check whether or not a table is already booked
USE littlelemondb;

DELIMITER $$
	CREATE PROCEDURE CheckBooking(
		IN booking_date DATE, IN table_number INT)
		BEGIN
			SELECT IF(
				EXISTS(SELECT * FROM bookings
					WHERE (TableNumber = table_number) AND (DATE(Date) = booking_date)),
                CONCAT('Table ', table_number, ' is already booked!'),
                CONCAT('Table ', table_number, ' is available!')) AS 'Booking Status';
		END $$
DELIMITER ;
