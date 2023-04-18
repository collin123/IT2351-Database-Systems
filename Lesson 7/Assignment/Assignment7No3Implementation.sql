-- Created by Collin Staisak for IT2351, Spring 2023
-- Mock up event to create a weekly sales report for an ice cream shop
DELIMITER //
CREATE EVENT weekly_sales_report
ON SCHEDULE
EVERY 1 WEEK
STARTS '23-4-21 23:59:59'
DO
BEGIN
DECLARE total_sales DECIMAL(10, 2); -- create variable for total sales
DECLARE cost_of_goods DECIMAL(10, 2); -- create variable for product cost
DECLARE labor_cost DECIMAL(10, 2);
DECLARE profit DECIMAL(10, 2); -- create variable for profit

SELECT SUM(sales_amount) INTO total_sales -- sum sales into a total column
FROM transactions WHERE transaction_date >= DATE_SUB(NOW(), INTERVAL 7 DAY); -- only pull sales from last 7 days used date subtraction
SELECT SUM(labor.hours * employees.pay) INTO labor_cost -- calculate labor cost by multipling pay and hours
    FROM labor
    JOIN employees ON labor.employee_id = employees.employee_id -- join the hours by which worker actually worked those hours
    WHERE labor.date >= DATE_SUB(NOW(), INTERVAL 7 DAY); -- only pull from last week
SELECT SUM(quantity * cost) INTO cost_of_goods FROM transactions JOIN inventory ON transactions.product_id = iventory.product_id; -- calculate cost of goods summing quantity and cost by joining inventory with transactions using product_id

END //