--TOTAL SASLES BY BRAND
-- This SQL script retriveves the top brands based on the total sales across diffrent cities.
SELECT
    brand,
    city,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
FROM transactions_dim AS td
LEFT JOIN product_name_dim AS pnd ON td.product_name = pnd.product_name
GROUP BY brand, city
ORDER BY brand DESC;

-- TOP SELLING BRAND BY CITY
-- This SQL script retrieves the top-selling brand in specific cities: Abuja, Lagos, and Port Harcourt.

-- For Abuja
SELECT
    brand,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
    FROM transactions_dim AS td
    LEFT JOIN product_name_dim AS pnd ON td.product_name = pnd.product_name
    WHERE city = 'Abuja'
    GROUP BY brand, city
    ORDER BY total_revenue DESC;

-- For Lagos
SELECT
    brand,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
    FROM transactions_dim AS td
    LEFT JOIN product_name_dim AS pnd ON td.product_name = pnd.product_name
    WHERE city = 'Lagos'
    GROUP BY brand, city
    ORDER BY total_revenue DESC;

    -- For Port Harcourt
SELECT
    brand,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
    FROM transactions_dim AS td
    LEFT JOIN product_name_dim AS pnd ON td.product_name = pnd.product_name
    WHERE city = 'Port Harcourt'
    GROUP BY brand, city
    ORDER BY total_revenue DESC;