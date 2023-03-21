-- Created by Collin Staisak for IT2351, Spring 2023
-- query to create view that shows each item ordered's name price and quantity
CREATE VIEW items_ordered AS (
SELECT o.item_price AS "Item Price", o.quantity "Quantity Sold", p.product_name AS "Product Name"
FROM order_items o JOIN products p ON o.product_id = p.product_id);
SELECT * FROM items_ordered;