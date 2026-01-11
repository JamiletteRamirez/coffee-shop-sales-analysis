USE coffee_sales;

SELECT *
FROM sales_raw
WHERE  transaction_id IS NULL
OR transaction_date IS NULL
OR transaction_qty IS NULL 
OR unite_price IS NULL; 

SELECT transaction_id, COUNT(*)
FROM sales_raw
GROUP BY transaction_id
HAVING COUNT(*) > 1; 

SELECT * 
FROM sales_raw
WHERE transaction_qty <=0; 

SELECT *
FROM sales_raw
WHERE unite_price <=0;

SELECT *
FROM sales_raw
WHERE transaction_time IS NULL; 

CREATE TABLE dim_stores AS
SELECT DISTINCT 
	store_id,
    store_location
FROM sales_raw;

CREATE TABLE dim_products AS
SELECT DISTINCT 
	product_id,
    product_category,
    product_type,
    product_detail,
    unite_price
FROM sales_raw;

CREATE TABLE fact_sales AS
SELECT 
	transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    product_id
FROM sales_raw; 

SELECT COUNT(*) FROM fact_sales;

SELECT COUNT(*) FROM dim_products;

SELECT COUNT(*) FROM dim_stores;