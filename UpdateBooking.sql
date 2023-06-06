# Create procedure for updating an existing bookings date and time
USE littlelemondb;

DELIMITER $$
CREATE PROCEDURE UpdateBooking(
	IN booking_id INT, IN booking_date DATE, IN booking_time CHAR(8))
    BEGIN
		UPDATE bookings
        SET Date = TIMESTAMP(booking_date, booking_time)
		WHERE BookingID = booking_id;
	END $$
DELIMITER ;