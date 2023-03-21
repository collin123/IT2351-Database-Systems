/******************************************************** 

* This script creates the database named called collin_icecream_shop

*********************************************************/ 
DROP
    DATABASE IF EXISTS collin_icecream_shop;
CREATE DATABASE collin_icecream_shop;
-- create customers table
CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(15) DEFAULT NULL
); 
-- create product table
CREATE TABLE products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL UNIQUE,
    cost_per_unit DECIMAL(10, 2) NOT NULL,
    sale_price_per_unit DECIMAL(10, 2) NOT NULL
); 
-- sales table which will only include a order_id, customer and date_sold which can later be used to identify what was sold
CREATE TABLE sales(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    date_sold DATETIME NOT NULL,
    CONSTRAINT sales_fk_customers
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
); 
-- table to hold the items ordered for the sales while maintaining 3NF meaning it should be stored seperate from sales table
CREATE TABLE order_items(
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT order_items_fk_sales
    FOREIGN KEY(order_id) REFERENCES sales(order_id),
    
    CONSTRAINT order_items_fk_products
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);
-- Create a user named mgs_user 

CREATE USER IF NOT EXISTS mgs_user@localhost 

IDENTIFIED BY 'pa55word'; 

  

-- Grant privileges to that user 

GRANT SELECT, INSERT, UPDATE, DELETE 

ON mgs.* 

TO mgs_user@localhost; 