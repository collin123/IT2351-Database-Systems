 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- Query to display number of unshipped orders and the amount of products that need to be shipped
SELECT COUNT(*) AS "Number Of Orders", SUM(ship_amount) AS "Order Value" -- get a count of rows as alias number of orders, get sum of ship_amount as alias Order Value
FROM orders
WHERE ship_date is NULL; -- only select rows where ship_date is null, signifying they are unshipped