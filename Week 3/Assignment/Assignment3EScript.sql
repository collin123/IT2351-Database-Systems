 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- imrpoved query to products by category, count number in each category and the amount ordered
SELECT IF (GROUPING(c.category_name) = 1, "Grand Total", c.category_name) AS "Product Category", -- use if grouping to replace the null at end with literal string "Grand Total"
 IF (GROUPING(p.product_name) = 1, 'Category Total', product_name) AS "Product Name", -- use if grouping to replace the null at end of each category with "Category Total"
 sum(quantity) AS "Orders"
FROM categories c 
INNER JOIN products p ON p.category_id = c.category_id -- join by matching category_ids
JOIN order_items o ON o.product_id = p.product_id -- join by matching product_ids
GROUP BY c.category_name, p.product_name WITH ROLLUP; -- add subtotals to our data