-- Created by Collin Staisak for IT2351, Spring 2023
-- Commented procedure get_balance_due from figure 5-12
DELIMITER // 
CREATE FUNCTION get_balance_due -- create new function called get_balance_due
(invoice_id_param INT) -- function takes one in parameter called invoice_id_param which will be used for user to specify which invoice they are interested in 
RETURNS DECIMAL(9, 2) 
DETERMINISTIC READS SQL DATA -- let the engine know the function is deterministic(only depends on on input parameters and contents of database) and read-only meaning it will not alter database contents

BEGIN DECLARE balance_due_var DECIMAL(9, 2); -- declare a double variable balance_due_var to store the calculation from our query into

SELECT
    invoice_total - payment_total - credit_total INTO balance_due_var -- subtract totals and store the result into our variable balance_due_var
FROM
    invoices
WHERE
    invoice_id = invoice_id_param; -- match the invoice to specified id from the in parameter

RETURN balance_due_var; -- return balance_due_var to return the value to the caller 

END //


SELECT 
vendor_id, invoice_number,
get_balance_due(invoice_id) AS balance_due -- call our new function on every row from the invoice table to show their id, invoice_number and balannce_due on the invoice
FROM invoices