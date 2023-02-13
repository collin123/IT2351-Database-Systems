-- Created by Collin Staisak for IT2351, Spring 2023
-- query to show total price of all unshipped orders 
SELECT DATE_FORMAT(order_date, "%m/%d/%y") AS "Date Ordered", -- format order_date and create and select alias
 DATE_FORMAT(shipped_date, "%m/%d/%y") AS "Date Shipped",-- format shipped_date and create and select alias
 o.order_id AS "Order ID", -- create and select alisa for order id
 Concat(customer_first_name, ' ', customer_last_name) AS "Customer Name", -- create and select alias for customer_last_name
 i.artist AS "Arist", -- create and select alias for artist
 unit_price AS "Unit Price", -- include unit_price field as Unit Price
 order_qty AS "Order Quantity", -- create and select alias for order_qty
 unit_price * order_qty AS "Total"
 FROM orders o JOIN customers c ON c.customer_id = o.customer_id -- join tables using the customer id to match them
 JOIN order_details od ON o.order_id = od.order_id -- join order_detials using the order_id to match with orders table
 JOIN items i ON i.item_id = od.item_id -- join table items and order_details using matching item_ids
 WHERE  shipped_date IS null
 ORDER BY customer_last_name, order_qty asc; -- sort our results by lastname and order quantity
 