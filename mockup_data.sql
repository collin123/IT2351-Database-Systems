-- add mock data to our new database

-- Insert 5  customers
INSERT INTO customers (customer_first_name, customer_last_name, customer_email, customer_phone)
VALUES 
('Collin', 'Stasiak', 'collinstasiak@example.com', '216-555-1234'),
('Joe', 'Doe', 'JoeDoe@example.com', '216-555-5678'),
('Oscar', 'Octopi', 'OscarOctopi@example.com', NULL),
('Sally', 'Snake', 'SallySnake@example.com', '216-555-2468'),
('Joey', 'Kangaroo', 'JoeyKangaroo@example.com', '216-555-3698');


-- Insert 5 records of mock data into the products table
INSERT INTO products (product_name, cost_per_unit, sale_price_per_unit, category)
VALUES
('Vanilla', 1.00, 2.00, 'Ice Cream'),
('Chocolate', 1.25, 2.50, 'Ice Cream'),
('Strawberry', 1.50, 3.00, 'Ice Cream'),
('Mint Chocolate Chip', 1.75, 3.50, 'Ice Cream'),
('Birthday Cake', 2.00, 4.00, 'Ice Cream'),
('Dinosaur Sprinkles', 0.50, 1.00, 'Topping'),
('Whipped Cream', 0.50, 1.50, 'Topping'),
('Hot Fudge', 0.50, 1, 'Topping');

-- Insert sales data

INSERT INTO sales (customer_id, date_sold)
VALUES
(1, '2023-05-01 10:44:02'),
(2, '2023-05-01 12:34:54'),
(3, '2023-05-01 13:55:22'),
(4, '2023-05-02 13:45:44'),
(5, '2023-05-02 12:10:05');

-- Insert order_items data
INSERT INTO order_items (order_id, product_id, quantity_ordered)
VALUES
(1, 1, 2),
(1, 8, 1),
(1, 2, 1),
(2, 3, 3),
(3, 4, 1),
(3, 6, 3),
(4, 5, 2);

