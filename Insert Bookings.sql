# Insert bookings into the booking table
USE littlelemondb;

INSERT INTO bookings VALUES
	(7, 5, TIMESTAMP('2022-10-10', '13:00:00'), 1, 2),
    (8, 3, TIMESTAMP('2022-11-12', '13:30:00'), 3, 2),
    (9, 2, TIMESTAMP('2022-10-11', '15:00:00'), 2, 6),
    (10, 2, TIMESTAMP('2022-10-13', '14:30:00'), 1, 6);