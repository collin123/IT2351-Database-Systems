-- Created by Collin Staisak for IT2351, Spring 2023
-- procedure ProductCount to count the number of products and display message based on the amount

DELIMITER //
CREATE PROCEDURE ProductCount() -- create procedure
BEGIN
	DECLARE product_count INT; -- variable to store our count of products

	SELECT COUNT(product_id) INTO product_count FROM products; -- count product_ids to determine number of products
    
    IF product_count >= 18 THEN
		SELECT "The number of products is greater than or equal to 18" AS message;
    ELSE
		SELECT "The number of products is less than 18" AS message;
	END IF;
END //

DELIMITER ;

CALL productCount();

