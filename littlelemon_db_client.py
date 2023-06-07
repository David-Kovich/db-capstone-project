# Meta Capstone MySQL database client

import mysql.connector as connector

try:
    connection = connector.connect(user='root', password='sdfljk8JH32*&^', port='3306', host='127.0.0.1', database='littlelemondb')
    print('Connection successfully established')
except connector.Error as E:
    print(E) 

# Create a dictionary cursor, run a SELECT query, and return the results
cursor = connection.cursor()
query = """
    SELECT CONCAT(c.FirstName, ' ', c.LastName) AS "Name", c.ContactNumber AS "Phone",
        c.Email, o.TotalCost AS "Bill Amount"
    FROM customer_details AS c INNER JOIN orders AS o
	    ON c.CustomerID = o.CustomerID
    WHERE o.TotalCost > 60;
"""
cursor.execute(query)
result = cursor.fetchall()
print(result)

cursor.close()          # Close the cursor
connection.cmd_quit()   # Close the database connection
print('Connection closed')