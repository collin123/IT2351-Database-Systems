-- Created by Collin Staisak for IT2351, Spring 2023
-- query to demonstrate cast and format to round the payment_total column with commas and zero decimals
SELECT invoice_date, CAST(invoice_date AS datetime) AS full_date, -- cast invoice_date as a datetime object to specify the seconds in addition to the date
 FORMAT(payment_total, 0) AS "Total Payment" -- use format to turn payment_total to a string with commas and specify 0 for the # of decimals
FROM invoices 