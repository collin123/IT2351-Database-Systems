-- Created by Collin Staisak for IT2351, Spring 2023
-- query show order and shipped dates in human friendly format of mm/dd/yy now using customer full name and including the item_id and the order quantity
SELECT DATE_FORMAT(order_date, "%m/%d/%y") AS "Date Ordered", -- format order_date and create and select alias
 DATE_FORMAT(shipped_date, "%m/%d/%y") AS "Date Shipped",-- format shipped_date and create and select alias
 o.order_id AS "Order ID", -- create and select alisa for order id
 Concat(customer_first_name, ' ', customer_last_name) AS "Customer Name", -- create and select alias for customer_last_name
 item_id AS "Item ID", -- create and select alias for item_id
 order_qty AS "Order Quantity" -- create and select alias for order_qty
 FROM orders o JOIN customers c ON c.customer_id = o.customer_id -- join tables using the customer id to match them
 JOIN order_details od ON o.order_id = od.order_id -- join table orders and order_details using matching order_ids
 ORDER BY customer_last_name, order_qty asc; -- sort our results by lastname
 