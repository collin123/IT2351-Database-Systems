-- Created by Collin Staisak for IT2351, Spring 2023
-- query to join order_details and items to the quantity of the orders placed for each piece
SELECT artist, title, order_qty -- Select three relevant columns
FROM items i JOIN order_details o -- join items table and order_details table, using aliases i and o
ON i.item_id = o.item_id -- join the columns by matching item_id
ORDER BY title asc; -- sort title asc