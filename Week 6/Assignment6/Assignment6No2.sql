-- Created by Collin Staisak for IT2351, Spring 2023
-- procedure ProductCount to count the number of products and display message based on the amount

DELIMITER //
DROP PROCEDURE IF EXISTS InsertCategory;

CREATE PROCEDURE InsertCategory() -- create procedure
BEGIN
	DECLARE duplicate_entry_for_key TINYINT DEFAULT FALSE; -- Declare this to be used as boolean which will let us know if our error condition has occurred
    DECLARE CONTINUE HANDLER FOR 1062 SET duplicate_entry_for_key = TRUE; -- Define our HANDLER for error code 1062(representing error that an entry is a duplicate for a unique key), the handler will set duplicate_entry_for_key to true if and only if error code 1062 is raised
    INSERT INTO categories(category_name) VALUES ("Winds");
    IF duplicate_entry_for_key = TRUE THEN -- check if handler was triggered meaning winds was duplicate category
        SELECT 'Row was not inserted - duplicate key encountered.' AS message;  -- will display if continue handler is triggered by error code 1062
        ELSE SELECT '1 row was inserted.' AS message; -- will display if no duplicate row is found and handler is not triggered
    END IF;

END //

DELIMITER ;

CALL InsertCategory();

