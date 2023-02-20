 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- query to products by category, count number in each category and the amount ordered
SELECT c.category_name, count(p.product_name) AS "Number of Products", sum(quantity) AS "Orders"
FROM categories c 
INNER JOIN products p ON p.category_id = c.category_id
JOIN order_items o ON o.product_id = p.product_id
GROUP BY p.category_id -- aggregate to 3 rows based on the three possible categories 
ORDER BY category_name desc
;