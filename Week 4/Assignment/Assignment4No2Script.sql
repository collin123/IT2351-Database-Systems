-- Created by Collin Staisak for IT2351, Spring 2023
-- query to show the items names that are above average cost
SELECT product_name
FROM products
WHERE product_id IN -- select product_ids in order_items 
(
  SELECT product_id
  FROM order_items
  WHERE item_price > -- second subquery to specify we should only select the order_items that have a item_price above average
  (
    SELECT AVG(item_price)
    FROM order_items
  )
)
