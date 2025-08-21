-- Create transactions_dim table with primary key
CREATE TABLE transactions_dim
(
    transaction_id VARCHAR(6) PRIMARY KEY,
    customer_id VARCHAR(6),
    product_name TEXT,
    quantity INT,
    price NUMERIC(10,2),
    transaction_date DATE,
    city TEXT,
    payment_method TEXT,
    CONSTRAINT fk_transactions_customer_id FOREIGN KEY (customer_id) REFERENCES customer_dim (customer_id),
    CONSTRAINT transactions_dim_product_name_fkey FOREIGN KEY (product_name) REFERENCES product_name_dim (product_name)
    
);

-- Create customer_dim table with primary key
CREATE TABLE customer_dim
(
    customer_id VARCHAR(6) PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone_number INT,
    city TEXT
    
);

-- Create product_name_dim table with primary key
CREATE TABLE product_name_dim
(
    product_name TEXT PRIMARY KEY,
    category TEXT,
    brand TEXT,
    unit_price NUMERIC
);

-- Create indexes for faster queries
CREATE INDEX idx_transaction_date ON transactions_dim (transaction_date);
CREATE INDEX idx_customer_id ON transactions_dim (customer_id);    
CREATE INDEX idx_product_name ON transactions_dim (product_name);

-- To empty the customer_dim table, use:
TRUNCATE TABLE customer_dim;

ALTER TABLE customer_dim

-- Droped Foreign keys to allow for data cleaning and data standardization
ALTER TABLE transactions_dim DROP CONSTRAINT IF EXISTS fk_transactions_customer_id;
ALTER TABLE transactions_dim DROP CONSTRAINT IF EXISTS fk_transactions_product_name;

 -- Add/Return foreign keys to transactions_dim after cleaning the data
-- ** product_name AS foreign-key **
ALTER TABLE transactions_dim
ADD CONSTRAINT transactions_dim_product_name_fkey FOREIGN KEY (product_name) REFERENCES product_name_dim (product_name);
--** customer_dim AS foreign-key **
ALTER TABLE transactions_dim
ADD CONSTRAINT transactions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customer_dim (customer_id)





