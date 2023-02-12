-- Created by Collin Stasiak for IT2351, Spring 2023
-- A query to pull invoices where the id is 123 and payment is more than 50, ordered by date

SELECT * FROM ap.invoices
WHERE vendor_id = 123 AND payment_total > 50
ORDER BY invoice_date;

