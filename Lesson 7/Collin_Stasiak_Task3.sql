-- Created by Collin Staisak for IT2351, Spring 2023
-- commented version of the query from figure 16-5

SET GLOBAL event_scheduler = ON; -- enable event scheduler
SHOW VARIABLES LIKE 'event_scheduler'; -- show variable to make sure it is on

DELIMITER //
CREATE EVENT monthly_delete_audit_rows -- create event called monthly_delete_audit_rows
ON SCHEDULE EVERY 1 MONTH -- set event to occur every one month from
STARTS '2023-4-17' -- start date april 17, 2023
DO BEGIN -- begin query 
DELETE FROM invoices_audt WHERE action_date < NOW() - INTERVAL 1 MONTH; -- remove audits older than 1 month
END //