 -- Written by Collin Stasiak on 2/20/23 for IT2351
 -- query to show the count of procuts and the max product item price
 SELECT count(product_id) AS "Number of Products", MAX(list_price) AS "Maximum Product Item Price"
 FROM products;
