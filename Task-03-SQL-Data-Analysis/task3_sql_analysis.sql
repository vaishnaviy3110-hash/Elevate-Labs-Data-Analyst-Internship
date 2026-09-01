-- Task 3: SQL for Data Analysis
-- Elevate Labs Data Analyst Internship
-- Tool: MySQL Workbench
-- Database: ecommerce_analysis

USE ecommerce_analysis;

-- 1. Show all orders
SELECT * FROM orders;

-- 2. Show orders where quantity is more than 1
SELECT *
FROM orders
WHERE quantity > 1;

-- 3. Show orders from highest quantity to lowest
SELECT *
FROM orders
ORDER BY quantity DESC;

-- 4. Find total revenue for each category
SELECT
    p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category;

-- 5. Find the average order value
SELECT
    AVG(o.quantity * p.price) AS average_order_value
FROM orders o
JOIN products p
ON o.product_id = p.product_id;

-- 6. Find total revenue and total number of orders
SELECT
    SUM(o.quantity * p.price) AS total_revenue,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN products p
ON o.product_id = p.product_id;

-- 7. Find customers who spent the most
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- 8. Find customers who spent more than 20000
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.quantity * p.price) > 20000;

-- 9. Find orders whose value is above the average order value
SELECT
    o.order_id,
    p.product_name,
    o.quantity * p.price AS order_value
FROM orders o
JOIN products p
ON o.product_id = p.product_id
WHERE o.quantity * p.price > (
    SELECT AVG(o2.quantity * p2.price)
    FROM orders o2
    JOIN products p2
    ON o2.product_id = p2.product_id
);

-- 10. Show every customer and their number of orders
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 11. Find customers who have not placed any order
SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 12. Create a simple view for order details
CREATE OR REPLACE VIEW order_details AS
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    p.price,
    o.quantity * p.price AS order_value,
    o.order_date
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id;

-- Use the view
SELECT *
FROM order_details
ORDER BY order_value DESC;

-- 13. Create an index on order date
CREATE INDEX idx_order_date
ON orders(order_date);

-- Check the query using EXPLAIN
EXPLAIN
SELECT *
FROM orders
WHERE order_date >= '2026-02-01';

-- 14. RIGHT JOIN: show all products and their order count
SELECT
    p.product_name,
    p.category,
    COUNT(o.order_id) AS total_orders
FROM orders o
RIGHT JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_orders DESC;

-- End of Task 3
