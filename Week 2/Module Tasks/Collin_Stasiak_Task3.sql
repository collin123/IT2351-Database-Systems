-- Created by Collin Staisak for IT2351, Spring 2023
-- Query to join order_date and shipped_date with their respective customers
SELECT customer_last_name, order_date, shipped_date -- select our three columns
FROM customers JOIN orders -- join data from both tables
ON customers.customer_id = orders.customer_id -- only join when ids match
ORDER BY customer_last_name asc; -- sort ascending poggerby last name 