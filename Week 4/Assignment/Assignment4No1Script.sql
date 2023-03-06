-- Created by Collin Staisak for IT2351, Spring 2023
-- Example query to display how WHERE statements can be used instead of joins
SELECT DISTINCT vendor_name
FROM vendors v
WHERE v.vendor_id IN 
(SELECT DISTINCT vendor_id FROM invoices) -- Our subquery which specifies we want every row in invoices that has a vendor_id also found in the vendors table
ORDER BY vendor_name;