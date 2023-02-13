-- Created by Collin Staisak for IT2351, Spring 2023
-- edited query 4 to include customer_ids to each respective order and item
SELECT customer_id, title, artist, order_qty -- Select three relevant columns
FROM items i JOIN order_details od -- join items table and order_details table, using aliases i and od
ON i.item_id = od.item_id -- join the columns by matching item_id
JOIN orders o -- join customers table with other 2 under alias c
ON o.order_id = od.order_id -- join orders with order_details when they have matching order_ids
ORDER BY customer_id, title asc; -- sort by customer_id then title asc