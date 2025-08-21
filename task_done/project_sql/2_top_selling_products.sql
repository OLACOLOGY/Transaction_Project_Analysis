-- TOTAL SALES BY PRODUCT
-- This SQL script retrieves the top-selling products based on total sales across different cities.
SELECT
    product_name,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
FROM transactions_dim
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- TOP SELLING PRODUCTS BY CITY
-- This SQL script retrieves the top-selling products in specific cities: Abuja, Lagos, and Port Harcourt.

-- For Abuja
SELECT
    product_name,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
FROM transactions_dim
WHERE city = 'Abuja'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- For Lagos
SELECT
    product_name,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
FROM transactions_dim
WHERE city = 'Lagos'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- For Port Harcourt
SELECT
    product_name,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
FROM transactions_dim
WHERE city = 'Port Harcourt'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;
