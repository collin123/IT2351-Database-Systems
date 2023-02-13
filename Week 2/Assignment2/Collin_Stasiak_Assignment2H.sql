-- Created by Collin Staisak for IT2351, Spring 2023
-- query to calculate total price with tax of the orders in order_details table
SELECT DISTINCT title AS "Title", -- select using distinct to remove duplicate rows, create column alias for title
 artist AS "Artist", -- create column alias for artist
 unit_price AS "Unit Price", -- create column alias for unit_price
 order_qty AS "Order Quantity", -- create column alias for order_qty
 unit_price * order_qty AS "Total", -- create total column
 ROUND(unit_price * order_qty * 1.085, 2) AS "Total with Tax" -- create total column including our tax multiplier and round to 2 decimals
 FROM items i JOIN order_details od ON i.item_id = od.item_id; -- using items and order_details, joining using matching item_ids