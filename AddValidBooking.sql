# Create stored procedure for adding a booking
# Only allows bookings for date/time slots that have 1 full hour both before & after any other booking for that table
USE littlelemondb;

DELIMITER $$
CREATE PROCEDURE AddValidBooking(
	IN booking_date DATE, IN booking_time CHAR(8), IN table_number INT, IN customer_id INT)
    BEGIN
        DECLARE result INT;
		START TRANSACTION;
		INSERT INTO bookings (TableNumber, Date, CustomerID, StaffID)
			VALUES
			(table_number, TIMESTAMP(booking_date, booking_time), customer_id, 6);
        SELECT COUNT(*) INTO result FROM bookings
			WHERE ((TableNumber = table_number) AND (DATE(Date) = booking_date)
				AND (TIME(Date) BETWEEN SUBTIME(booking_time, '1:00:00') AND ADDTIME(booking_time, '1:00:00')));
		IF result > 1 THEN
			ROLLBACK;
            SELECT CONCAT('Table ', table_number, ' is already booked! Booking cancelled.') AS 'Booking Status';
		ELSEIF result <= 1 THEN
			COMMIT;
            SELECT CONCAT('Table ', table_number, ' booked successfully!') AS 'Booking Status';
		ELSE
			SELECT "Error";
		END IF;
	END $$
DELIMITER ;