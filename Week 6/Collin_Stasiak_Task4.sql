-- Created by Collin Staisak for IT2351, Spring 2023
-- Commented procedure insert_glaccount
DELIMITER // 
CREATE PROCEDURE insert_glaccount (
    -- create new procedure called insert_glaccount
    IN account_num_param INT,
    -- two in parameters to match the two columns with matching datatypes of INT and varchar(50) they will be used directly in the insert statemnt as our new values
    IN account_description_param VARCHAR(50)
)
BEGIN
DECLARE account_count INT;
-- create variable to store count of matching account_desriptions to make sure no duplicates are added
SELECT
    COUNT(*) INTO account_count
FROM
    AP.general_ledger_accounts
WHERE
    account_description = account_description_param;

-- use this query to check if the account_description already exists and store data into account_count
IF account_count > 0 THEN -- if duplicate found display message
SELECT
    'This table does not allow duplicate account_descriptions' AS message;

ELSE
INSERT INTO -- if no duplicate description update the general_ledger_account by inserting new values
    AP.general_ledger_accounts(account_number, account_description)
VALUES
(account_num_param, account_description_param);

END IF;

END //

CALL insert_glaccount(4322, "A dummy account to test insert procedure");
SELECT * FROM general_ledger_accounts WHERE account_number= 4322;