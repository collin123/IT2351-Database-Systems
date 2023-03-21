-- Created by Collin Staisak for IT2351, Spring 2023
-- query to create a view that shows customers and all of their unique purchases
DROP VIEW IF EXISTS  customer_purchases;
CREATE VIEW customer_purchases AS
SELECT DISTINCT o.order_id, CONCAT(c.first_name, " ",  c.last_name) AS customer_name, p.product_name
FROM orders o JOIN order_items oi ON o.order_id = oi.order_id 
JOIN products p ON oi.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id;
SELECT * FROM customer_purchases;