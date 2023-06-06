# Create procedure for adding a new booking
USE littlelemondb;

DELIMITER $$
CREATE PROCEDURE AddBooking(
	IN booking_id INT, IN customer_id INT, IN booking_date DATE, IN booking_time CHAR(8), IN table_number INT)
    BEGIN
		INSERT INTO bookings (BookingID, TableNumber, Date, CustomerID, StaffID)
			VALUES
			(booking_id, table_number, TIMESTAMP(booking_date, booking_time), customer_id, 6);
	END $$
DELIMITER ;