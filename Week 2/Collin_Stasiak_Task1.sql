-- Created by Collin Staisak for IT2351, Spring 2023
-- Query to combine customer names and display them sorted alphabetically
SELECT CONCAT(customer_first_name, ' ', customer_last_name) -- Combine first name and last name and seperate with single space
AS Name -- alias for new column of our concatenated data will be "Name"
FROM om.customers -- Select table to pull columns from
ORDER BY customer_last_name, customer_first_name -- Sort alphabetically by lastname then by firstname
;