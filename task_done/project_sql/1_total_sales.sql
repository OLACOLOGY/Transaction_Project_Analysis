-- Created a column in the transaction table "total_sales"
ALTER TABLE transactions_dim
ADD total_sales DECIMAL(10,2);

-- Added values into it
UPDATE transactions_dim
SET total_sales = price * quantity;

-- Checked the result of the query
SELECT * FROM transactions_dim
LIMIT 10;
