-- Created by Collin Staisak for IT2351, Spring 2023
-- Re-writing a inner join query to utilize the IN keyword and subquery
SELECT DISTINCT vendor_name
FROM vendors
WHERE vendors.vendor_id  IN
(SELECT DISTINCT vendor_id -- Our subquery which specifies we want every row in invoices that has a vendor_id also found in the vendors table
	FROM invoices)
ORDER BY vendor_name;