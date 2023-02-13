-- Created by Collin Staisak for IT2351, Spring 2023
-- query show order and shipped dates in human friendly format of mm/dd/yy
SELECT DATE_FORMAT(order_date, "%m/%d/%y") AS "Date Ordered", -- format order_date and create alias
 DATE_FORMAT(shipped_date, "%m/%d/%y") AS "Date Shipped",-- format shipped_date and create alias
 order_id AS "Order ID", -- create alisa for order id
 customer_id AS "Customer ID" -- create alias for customer_id
 FROM orders; -- sourced from the orders table
 