 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- query to products by category, count number in each category and the amount ordered
SELECT c.category_name, p.product_name, sum(quantity) AS "Orders"
FROM categories c 
INNER JOIN products p ON p.category_id = c.category_id -- join by matching category_ids
JOIN order_items o ON o.product_id = p.product_id -- join by matching product_ids
GROUP BY c.category_id, c.category_name, p.product_name WITH ROLLUP -- add subtotals to our data
ORDER BY c.category_name desc
;