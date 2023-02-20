 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- query to show the number of orders and their dollar value
 SELECT count(order_id) AS "Number of Orders", -- count number of orders
 sum(ship_amount) AS "Ship Value" -- sum the value of all orders
 FROM orders;