-- Created by Collin Stasiak for IT2351, Spring 2023
-- A query to pull customers from om and sorting them state then by city

SELECT * FROM om.customers
ORDER BY customer_state, customer_city;