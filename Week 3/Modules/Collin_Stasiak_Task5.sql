 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- Display sum of customers by state
 SELECT state, count(*) AS "Customers Per State" -- counts the rows in the addresses table, which should give accurate count of customers although it is possible some customers may have more than one address registered. 
 FROM addresses
 GROUP BY state -- use GROUP BY to group the results of our count by matching state values
 ORDER BY state; -- sort alphabetically for easier reading
