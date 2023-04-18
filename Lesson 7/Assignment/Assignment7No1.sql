-- Created by Collin Staisak for IT2351, Spring 2023
-- Trigger products_before_update to check the new value of list_price to perform range validation and throw error if price is greater than 1100 or less than 200. 
DELIMITER //
CREATE TRIGGER products_before_update BEFORE UPDATE ON products FOR EACH ROW -- create trigger to fire before updates on the products table and run the below query on every row
BEGIN 
IF(NEW.list_price > 1100 OR NEW.list_price < 200) THEN SIGNAL SQLSTATE 'HY000' -- check if updated price falls within range
SET MESSAGE_TEXT = 'list_price must be between 200 and 1100';-- let user know why error was thrown
END IF;-- end and let continue if no error was thrown, meaning user will never know this trigger exists if they insert valid data
END //

-- sample query that will cause the trigger to throw 
UPDATE products
SET list_price = 2000000
WHERE product_id = 1;