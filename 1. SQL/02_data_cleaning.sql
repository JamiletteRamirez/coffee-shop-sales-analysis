USE coffee_sales;

SELECT *
FROM sales_raw
WHERE transaction_id IS NULL
OR transaction_date IS NULL
OR transaction_qty IS NULL 
OR unit_price IS NULL; 

SELECT transaction_id, COUNT(*)
FROM sales_raw
GROUP BY transaction_id
HAVING COUNT(*) > 1; 

SELECT * 
FROM sales_raw
WHERE transaction_qty <=0; 

SELECT *
FROM sales_raw
WHERE unit_price <=0;

SELECT *
FROM sales_raw
WHERE transaction_time IS NULL; 

CREATE TABLE dim_stores AS
SELECT DISTINCT 
	store_id,
    store_location
FROM sales_raw;

CREATE TABLE dim_products AS
SELECT 
    product_id,
    MAX(product_category) as product_category,
    MAX(product_type) as product_type,
    MAX(product_detail) as product_detail,
    ROUND(AVG(unit_price), 2) as avg_unit_price  -- Precio promedio
FROM sales_raw
GROUP BY product_id;

CREATE TABLE fact_sales AS
SELECT 
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    unit_price, 
    store_id,
    product_id
FROM sales_raw;

-- Agregar primary keys
ALTER TABLE dim_stores ADD PRIMARY KEY (store_id);
ALTER TABLE dim_products ADD PRIMARY KEY (product_id);
ALTER TABLE fact_sales ADD PRIMARY KEY (transaction_id);


SELECT COUNT(*) FROM fact_sales;

SELECT COUNT(*) FROM dim_products;

SELECT COUNT(*) FROM dim_stores;

DESCRIBE fact_sales;

DESCRIBE dim_products;

DESCRIBE dim_stores;





