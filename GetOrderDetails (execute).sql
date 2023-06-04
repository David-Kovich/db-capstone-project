# Script for executing the GetOrderDetails prepared statement for Order #1
USE littlelemondb;

SET @id = 1;
EXECUTE GetOrderDetails USING @id;
