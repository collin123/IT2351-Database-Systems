-- Created by Collin Staisak for IT2351, Spring 2023
-- query to use string functions to uppercase vendor names, pull last 4 digits of vendor phone numbers, and display the second word of vendor names 
SELECT vendor_name, 
UPPER(vendor_name) as "Vendor Name Uppercase", vendor_phone, -- use the upper function to make every character in the vendor_name table their uppercase equivalent 
SUBSTRING(vendor_phone, -4) AS "Last four digits of Phone #", -- create a substring from the end of the string and count 4 back to give us last four digits
IF(LOCATE(" ", vendor_name) < 1, NULL, -- use an if statement to check if there is less than 1 space pressent indicating there is only 1 word, if there is a space display the second word explained below
SUBSTRING_INDEX(SUBSTRING_INDEX(vendor_name, " ", 2), " ", -1)) AS "Vendor Second Word" -- use substring index to return the subtring before 2 spaces is reached(selecting everything but the first word) then use another to return the last word before a space is reached(ignoring everything after our second word)
FROM vendors