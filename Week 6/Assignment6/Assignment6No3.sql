-- Created by Collin Staisak for IT2351, Spring 2023
-- function to show discounted price of items
DELIMITER //
DROP FUNCTION IF EXISTS new_price;

CREATE FUNCTION new_price -- create new function called new_price
(item_id_param INT) -- function takes one in parameter called item_id_param which will be used for user to specify which item they are interested in 
RETURNS DECIMAL(9, 2) -- function will return new price
DETERMINISTIC READS SQL DATA

BEGIN DECLARE new_item_price DECIMAL(9, 2); -- declare a double variable balance_due_var to store the calculation from our query into

SELECT
    item_price - discount_amount INTO new_item_price -- subtract discount from price and stores into the new_item_price variable
FROM
    order_items
WHERE
    item_id = item_id_param; -- match the invoice to specified id from the in parameter

RETURN new_item_price; -- return new_item_price to return the value to the caller of function

END //

SELECT *, new_price(1) AS discounted_price
FROM order_items WHERE item_id = 1;