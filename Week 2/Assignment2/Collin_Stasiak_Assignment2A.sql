-- Created by Collin Staisak for IT2351, Spring 2023
-- query to show pieces that cost between $15 and $18 and sort by price then artist
SELECT title AS piece_name, artist AS creator, unit_price AS cost -- create alises for all our used columns
FROM om.items
WHERE unit_price BETWEEN 15 AND 18 -- use between operator to select pieces that cost between 15 and 18
ORDER BY unit_price, artist asc; -- sort our results
