CREATE DATABASE coffee_sales; 
USE coffee_sales; 

CREATE TABLE sales_raw(
transaction_id INT,
transaction_date DATE,
transaction_time TIME,
transaction_qty INT,
store_id INT,
store_location VARCHAR(100),
product_id INT,
unite_price DECIMAL(10,2), 
product_category VARCHAR(100),
product_type VARCHAR(100),
product_detail VARCHAR(150)
);

DESCRIBE sales_raw; 
SELECT COUNT(*) FROM sales_raw;
SELECT MIN(transaction_date), MAX(transaction_date) FROM sales_raw;

    