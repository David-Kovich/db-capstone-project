# Create procedure for cancelling bookings
USE littlelemondb;

DELIMITER $$
CREATE PROCEDURE CancelBooking(
	IN booking_id INT)
    BEGIN
		DELETE FROM bookings
		WHERE BookingID = booking_id;
	END $$
DELIMITER ;