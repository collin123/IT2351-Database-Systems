CREATE VIEW supplier_payments AS -- create view
SELECT -- select product name, amount sold in week
  products.product_name, -- name of goods sold
  order_items.quantity_ordered, -- calculate approximate amount of goods sold
  products.cost_per_unit * order_items.quantity_ordered AS total_cost -- calculate cost of goods sold
FROM 
  order_items
  JOIN products ON order_items.product_id = products.product_id;


SELECT * FROM supplier_payments;