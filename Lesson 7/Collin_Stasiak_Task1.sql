-- Created by Collin Staisak for IT2351, Spring 2023
-- commented version of the query from figure 14-1
DELIMITER //
CREATE PROCEDURE test() BEGIN -- define procedure test taking no parameters
DECLARE sql_error TINYINT DEFAULT FALSE; -- declare boolean to flag if a sql error has occured, default to false as nothing has happened yet
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET sql_error = TRUE; -- define our continue handler to catch all sqlexceptions and set sql_error to true
START TRANSACTION; -- turns auto-commit mode off and marks our place to return on rollback
INSERT INTO invoices 
VALUES (115, 34, 'ZXA-080', '2018-01-18', 14092.59, 0, 0, 3, '2018-04-18', NULL); -- attempt first insertion
INSERT INTO invoice_line_items -- attempt second insertion
VALUES (115, 1, 160, 4447.23, 'HW upgrade'); 
INSERT INTO invoice_line_items
VALUES (115, 2, 167, 9645.36, 'OS upgrade'); -- attempt third insertion
IF sql_error = FALSE THEN COMMIT; -- now that we are done touching data we will check if we caused any errors, if not we can commit our changes
SELECT 'The transaction was committed.'; 
ELSE ROLLBACK; SELECT 'The transaction was rolled back.'; -- if errors were caused rollback changes and let user know 
END IF;
END // 