-- Created by Collin Staisak for IT2351, Spring 2023
-- Demonstrate a procedure using contiue for error handling

USE  ap;
DROP PROCEDURE IF EXISTS test; -- drop test if already exists to avoid error that test procedure already exists from last assignment

DELIMITER //

CREATE PROCEDURE test() BEGIN
    DECLARE duplicate_entry_for_key TINYINT DEFAULT FALSE; -- Declare this to be used as boolean which will let us know if our error condition has occurred
    DECLARE CONTINUE HANDLER FOR 1062 SET duplicate_entry_for_key = TRUE; -- Define our HANDLER for error code 1062(representing error that an entry is a duplicate for a unique key), the handler will set duplicate_entry_for_key to true if and only if error code 1062 is raised
    INSERT INTO general_ledger_accounts VALUES (130, 'Cash'); -- we attempt to insert our duplicate
    IF duplicate_entry_for_key = TRUE THEN -- if statement if triggered because our handler should have set duplicate_entry_for_key to TRUE when the above duplicate was attempted to be entered
        SELECT 'Row was not inserted - duplicate key encountered.' AS message; ELSE -- will display if continue handler is triggered by error code 1062
        SELECT '1 row was inserted.' AS message; -- will display if no duplicate row is found and handler is not triggered
    END IF;
END// 

DELIMITER ;

CALL test();