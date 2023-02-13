-- Created by Collin Staisak for IT2351, Spring 2023
-- query show order and shipped dates in human friendly format of mm/dd/yy adding their lastname from customers table
SELECT DATE_FORMAT(order_date, "%m/%d/%y") AS "Date Ordered", -- format order_date and create alias
 DATE_FORMAT(shipped_date, "%m/%d/%y") AS "Date Shipped",-- format shipped_date and create alias
 order_id AS "Order ID", -- create alisa for order id
 customer_last_name AS "Customer Lastname" -- create alias for customer_last_name
 FROM orders o JOIN customers c -- sourced from the orders and customers table
 ON c.customer_id = o.customer_id -- join tables using the customer id to match them
 ORDER BY customer_last_name asc; -- sort our results by lastname
 