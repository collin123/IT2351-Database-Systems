-- Created by Collin Staisak for IT2351, Spring 2023
-- commented version of the query from figure 16-2
DELIMITER //
CREATE TRIGGER invoices_before_update BEFORE UPDATE ON invoices FOR EACH ROW -- create trigger to fire before updates on the voice table and run the below query on every row
BEGIN 
DECLARE sum_line_item_amount DECIMAL(9,2); -- create sum variable 
SELECT SUM(line_item_amount) INTO sum_line_item_amount FROM invoice_line_items -- store data from line_item_amount into sum_line_item_amount
WHERE invoice_id = NEW.invoice_id; -- select rows being changed by the update using the NEW pseudorecord which will contain the attmepted update values
IF sum_line_item_amount != NEW.invoice_total THEN SIGNAL SQLSTATE 'HY000' -- compare the calculated total from sum against the value passed for total, they should be equal to ensure consistency throw HY000 if they are not
SET MESSAGE_TEXT = 'Line item total must match invoice total.';  -- let user know why error was thrown
END IF; -- end and let continue if no error was thrown, meaning user will never know this trigger exists if they insert valid data
END //

-- sample query that will cause the trigger to throw 
UPDATE invoices
SET invoice_total = 600 
WHERE invoice_id = 100;