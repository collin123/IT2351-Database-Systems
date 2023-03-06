-- Created by Collin Staisak for IT2351, Spring 2023
-- query to return information on the email addresses from the customers table
SELECT email_address, 
Length(email_address) AS "Length", -- use length function to display string length as alias length
LOCATE("@", email_address) AS "@", -- find the first instance of @ and return the index as @
LEFT(email_address, LOCATE("@", email_address)-1) AS "Username", -- use similar locate from above to select everything to the left of @ and do -1 to make sure the actual @ is excluded
SUBSTRING(email_address, LOCATE("@", email_address)+1) AS "Domain" -- returns the string starting after the @ sign, we add plus one to exclude the @
FROM customers