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
unit_price DECIMAL(10,2), 
product_category VARCHAR(100),
product_type VARCHAR(100),
product_detail VARCHAR(200)
);

LOAD DATA LOCAL INFILE "D:/JAMILETTE DATOS/Documents/Proyectos/coffee-shop-sales-revenue.csv"
INTO TABLE sales_raw
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DESCRIBE sales_raw; 

SELECT COUNT(*) FROM sales_raw;

SELECT 
    MIN(transaction_date) AS primera_fecha,
    MAX(transaction_date) AS ultima_fecha,
    COUNT(*) AS total_registros
FROM sales_raw;

SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m') AS mes,
    COUNT(*) AS registros
FROM sales_raw
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY mes;

