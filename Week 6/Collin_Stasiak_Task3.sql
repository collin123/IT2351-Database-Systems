-- Created by Collin Staisak for IT2351, Spring 2023
-- Commented procedure from fire 15-2

DELIMITER //
CREATE PROCEDURE update_invoices_credit_total ( -- create new procedure called update_invoices_credit_total
IN invoice_id_param INT,
IN credit_total_param DECIMAL(9,2), 
OUT update_count INT
) -- takes 2 parameters of id of account's credit to edit and the pdated credit_total, returns a count of the updates 
BEGIN DECLARE sql_error TINYINT DEFAULT FALSE; -- create variable to store if an error occured defaulting to false only being set true by the handler
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET sql_error = TRUE; -- catch errors and set sql_error to true triggering data to rollback
 START TRANSACTION; -- starts the portion that could fail marking return point for the rollback if a sql_error is thrown
 UPDATE invoices
SET credit_total = credit_total_param WHERE invoice_id = invoice_id_param; -- update credit_total for the selected invoice using the id to find it
IF sql_error = FALSE THEN SET update_count = 1; COMMIT; -- if no error occured with updating the credit_total, commit the change and update the counter to 1
ELSE
SET update_count = 0; ROLLBACK; END IF; -- if an error did occur reset the update count and rollback the data because some kind of sqlerror occured so we rollback to preserve the data
END//

CALL update_invoices_credit_total(112, 1, @row_count); -- edit the invoice by the unique id 112 to set the credit total to 1 and save the update_count as @row_count
SELECT CONCAT('row count: ', @row_count) AS update_counter; -- display concatting the update_counter with row count
