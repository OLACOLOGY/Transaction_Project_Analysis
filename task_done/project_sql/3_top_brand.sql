--TOTAL SASLES BY BRAND
-- This SQL script retriveves the top brands based on the total sales across diffrent cities.
SELECT
    brand,
    COUNT(quantity),
    ROUND(AVG(total_sales), 2) AS average_sales,
    SUM(total_sales) AS total_revenue
FROM transactions_dim AS td
LEFT JOIN product_name_dim AS pnd ON td.product_name = pnd.product_name
GROUP BY brand
ORDER BY total_revenue DESC;