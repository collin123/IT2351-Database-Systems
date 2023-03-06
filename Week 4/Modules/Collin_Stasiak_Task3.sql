-- Created by Collin Staisak for IT2351, Spring 2023
-- query to demonstratedate functions to show the difference between payment and invoice date and the invoice date + 30 days
SELECT invoice_id, invoice_date, payment_date, 
DATEDIFF(payment_date, invoice_date) AS "Time to Pay", -- use the date diff to calculate the time from the invoice creation to the payment date
DATE_ADD(invoice_date, INTERVAL 30 DAY) AS "Invoice due date" -- use date_add to calculate 30 days after the creation of the invoice
FROM invoices 