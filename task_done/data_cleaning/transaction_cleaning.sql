-- **************Check and removing duplicates ******************
WITH duplicate_cte AS (
    SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY transaction_id, customer_id, product_name, quantity, price, transaction_date, city, payment_method) AS row_num
    FROM transactions_dim
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

-- **************** Standardizing data ***************************

-- Changed all product name to small letters
UPDATE transactions_dim
SET product_name = REGEXP_REPLACE(
        LOWER(product_name),
        E'(^| )([a-z])',
        E'\\1' || UPPER(E'\\2'),
        'g'
    );

-- then made the first word of each uppercase
UPDATE transactions_dim
SET product_name = 
    UPPER(SUBSTRING(product_name FROM 1 FOR 1))
     || LOWER(SUBSTRING(product_name FROM 2));

--Check for Blanks or NULL
SELECT *
FROM transactions_dim
WHERE product_name IS NULL OR product_name = '';

SELECT *
FROM transactions_dim
WHERE city IS NULL OR city = '';

SELECT *
FROM transactions_dim
WHERE price IS NULL ;

