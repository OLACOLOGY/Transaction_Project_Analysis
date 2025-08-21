\copy transactions_dim FROM 'C:\Users\personal\Documents\Ola_excel_project\Transaction_Project_Analysis\csv_files\transactions_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy customer_dim FROM 'C:\Users\personal\Documents\Ola_excel_project\Transaction_Project_Analysis\csv_files\customer_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
\copy product_name_dim FROM 'C:\Users\personal\Documents\Ola_excel_project\Transaction_Project_Analysis\csv_files\product_name_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

--Import some missing data in the customer_dim i.e customer_dim_two 
\copy customer_dim FROM 'C:\Users\personal\Documents\Ola_excel_project\Transaction_Project_Analysis\csv_files\Customer_dim_two.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

