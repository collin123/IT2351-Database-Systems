-- Created by Collin Staisak for IT2351, Spring 2023
-- query to display if vendors provided a phone number and if they have a high invoice amount
SELECT v.vendor_name, 
IFNULL(v.vendor_phone, "No phone provided") AS "Vendor Phone Number",  -- use ifnull to replace null values with desired string output
IF(i.invoice_total >1500, "High", "Low") AS "Invoice Amount Owed" -- use if statement to see if invoice_total is above 1500, with high as our true output and low as our false output
FROM vendors v JOIN invoices i ON v.vendor_id = i.vendor_id; -- join vendor and invoice tables on common vendor_id