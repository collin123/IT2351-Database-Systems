-- Created by Collin Staisak for IT2351, Spring 2023
-- Procedure to count how many rows have balance due greater than 6000
USE  ap;
DROP PROCEDURE IF EXISTS test;

DELIMITER //
-- create procedure test
CREATE PROCEDURE test()
BEGIN 
	DECLARE bal_over_6k_var INT(10); -- declare our variable to store count of bal over 6k
    SELECT COUNT(*) INTO bal_over_6k_var FROM invoices WHERE invoice_total - payment_total - credit_total > 6000; -- subquery to count every balance over 6k
    SELECT CONCAT(bal_over_6k_var, " invoices exceed $6,000.") AS message; -- display our message of the # of accounts with a remaining balance over 6k
END//

DELIMITER ;

CALL test();
