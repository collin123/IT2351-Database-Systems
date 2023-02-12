-- Created by Collin Staisak for IT2351, Spring 2023
-- Query to calculate new prices and sort lowest to highest
SELECT item_id, title, artist,
ROUND(unit_price * 1.04, 2) -- multiply prices by 1.04 to get new price and round to two decimal places
AS new_price -- alias for new column of data will be "new_price"
FROM om.items -- Select table to pull columns from
ORDER BY new_price desc -- Sort prices descending
;