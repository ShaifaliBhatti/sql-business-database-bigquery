-- ============================================
-- Project: SQL Business Database Analysis
-- Tool: Google BigQuery
-- Author: Shaifali Bhatti
-- Description: Business sales database analysis using SQL
-- ============================================


-- ============================================
-- 1️⃣ CREATE CUSTOMERS TABLE
-- ============================================

CREATE TABLE `data-analyst-portfolio-488514.business_db.customers` AS
SELECT 1 AS customer_id, 'Amit Sharma' AS customer_name, 'Delhi' AS city, 'India' AS country UNION ALL
SELECT 2, 'Ravi Patel', 'Ahmedabad', 'India' UNION ALL
SELECT 3, 'John Smith', 'New York', 'USA' UNION ALL
SELECT 4, 'Maria Garcia', 'Madrid', 'Spain';


-- ============================================
-- 2️⃣ CREATE PRODUCTS TABLE
-- ============================================

CREATE TABLE `data-analyst-portfolio-488514.business_db.products` AS
SELECT 101 AS product_id, 'Laptop' AS product_name, 'Electronics' AS category, 50000 AS price UNION ALL
SELECT 102, 'Mobile Phone', 'Electronics', 20000 UNION ALL
SELECT 103, 'Office Chair', 'Furniture', 5000 UNION ALL
SELECT 104, 'Desk', 'Furniture', 8000;


-- ============================================
-- 3️⃣ CREATE ORDERS TABLE
-- ============================================

CREATE TABLE `data-analyst-portfolio-488514.business_db.orders` AS
SELECT 1001 AS order_id, 1 AS customer_id, 101 AS product_id, DATE '2024-01-10' AS order_date, 1 AS quantity UNION ALL
SELECT 1002, 2, 102, DATE '2024-01-12', 2 UNION ALL
SELECT 1003, 3, 103, DATE '2024-02-05', 3 UNION ALL
SELECT 1004, 4, 104, DATE '2024-02-10', 1 UNION ALL
SELECT 1005, 1, 102, DATE '2024-03-15', 1;


-- ============================================
-- 4️⃣ TOTAL REVENUE
-- ============================================

SELECT SUM(o.quantity * p.price) AS total_revenue
FROM `data-analyst-portfolio-488514.business_db.orders` o
JOIN `data-analyst-portfolio-488514.business_db.products` p
ON o.product_id = p.product_id;


-- ============================================
-- 5️⃣ TOP CUSTOMERS BY REVENUE
-- ============================================

SELECT c.customer_name,
       SUM(o.quantity * p.price) AS revenue
FROM `data-analyst-portfolio-488514.business_db.orders` o
JOIN `data-analyst-portfolio-488514.business_db.customers` c
ON o.customer_id = c.customer_id
JOIN `data-analyst-portfolio-488514.business_db.products` p
ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC;


-- ============================================
-- 6️⃣ REVENUE BY CATEGORY
-- ============================================

SELECT p.category,
       SUM(o.quantity * p.price) AS revenue
FROM `data-analyst-portfolio-488514.business_db.orders` o
JOIN `data-analyst-portfolio-488514.business_db.products` p
ON o.product_id = p.product_id
GROUP BY p.category;


-- ============================================
-- 7️⃣ MONTHLY REVENUE TREND
-- ============================================

SELECT FORMAT_DATE('%Y-%m', order_date) AS month,
       SUM(o.quantity * p.price) AS revenue
FROM `data-analyst-portfolio-488514.business_db.orders` o
JOIN `data-analyst-portfolio-488514.business_db.products` p
ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;


-- ============================================
-- END OF PROJECT
-- ============================================