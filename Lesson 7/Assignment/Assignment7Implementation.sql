-- Created by Collin Staisak for IT2351, Spring 2023
-- Stored procedure using error handling and locks to ensure customers are properly removed from the guitar_shop customers table. 

DELIMITER // 
CREATE PROCEDURE delete_customer 
(IN selected_customer_id INT) 
BEGIN 
DECLARE sql_error TINYINT DEFAULT FALSE;
-- declare boolean to flag if a sql error has occured, default to false as nothing has happened yet
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
SET
    sql_error = TRUE;

-- define our continue handler to catch all sqlexceptions and set sql_error to true
-- begin transaction and set return point for rollback
START TRANSACTION;

SET
    TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- we use serializable to reduce any possible concurrency issues and the operation is relatively small so the additional overhead is not a problem

DELETE FROM customers -- delete customer that matches id passed by caller
WHERE selected_customer_id = customer_id;

IF sql_error = FALSE THEN COMMIT; -- now that we are done touching data we will check if we caused any errors, if not we can commit our changes
SELECT 'The transaction was committed.';

ELSE ROLLBACK; -- roll data back because error was thrown

SELECT 'The transaction was rolled back.';

-- if errors were caused rollback changes and let user know 
END IF;

SET
    status = 'Customer deleted successfully.';

END // 
DELIMITER ;