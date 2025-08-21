-- **************Check and removing duplicates ******************
WITH duplicate_cte AS (
    SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id, first_name, last_name, email, phone_number, city) AS row_num
    FROM customer_dim
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

--Check for Blanks or NULL
SELECT *
FROM customer_dim
WHERE email IS NULL OR email = '';

SELECT *
FROM customer_dim
WHERE city IS NULL OR city = '';

SELECT *
FROM customer_dim
WHERE phone_number IS NULL OR phone_number = '';

