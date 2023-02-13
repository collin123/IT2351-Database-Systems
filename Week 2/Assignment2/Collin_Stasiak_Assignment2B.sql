-- Created by Collin Staisak for IT2351, Spring 2023
-- query to pull all customers from Ohio and New York and show their full name
SELECT Concat(customer_first_name, ' ', customer_last_name) AS "Customer Name",-- concat first and last for full name
 customer_state AS state -- our column aliases are Customer Name and State
FROM customers -- select customers table
WHERE customer_state = "OH" or customer_state = "NY" -- only show customers in Ohio or New York
ORDER BY customer_state, customer_last_name, customer_first_name asc; -- sort by state then lastname then firstname