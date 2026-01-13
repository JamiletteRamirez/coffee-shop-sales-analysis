USE coffee_sales;

-- ==========================================
-- BUSINESS QUERIES - Coffee Sales Analysis
-- ==========================================

-- KPI: Ventas totales 
SELECT 
	ROUND(SUM(f.transaction_qty * f.unit_price), 2) AS total_revenue,
	COUNT(DISTINCT f.transaction_id) AS total_transactions,
	ROUND(AVG(f.transaction_qty * f.unit_price), 2) AS avg_transaction_value
FROM fact_sales f;

-- Tendencia: Ventas por mes
SELECT 
	date_format(transaction_date, '%Y-%m') AS month,
    ROUND(SUM(f.transaction_qty * f.unit_price),2) AS monthly_revenue,
    COUNT(DISTINCT f.transaction_id) AS transactions,
    ROUND(AVG(f.transaction_qty * f.unit_price), 2) AS avg_order_value
FROM fact_sales f
GROUP BY month
ORDER BY month;

-- Top 10 productos por ingreso
SELECT 
	p.product_detail,
    p.product_category,
    ROUND(SUM(f.transaction_qty * f.unit_price), 2) AS revenue,
    SUM(f.transaction_qty) AS units_sold,
    ROUND(AVG(f.unit_price), 2) AS avg_price
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_detail, p.product_category
ORDER BY revenue DESC
LIMIT 10;

-- Ventas por tienda
SELECT 
	s.store_location,
	ROUND(SUM(f.transaction_qty * f.unit_price), 2) AS revenue,
    COUNT(DISTINCT f.transaction_id) AS transactions, 
    ROUND(AVG(f.transaction_qty * f.unit_price), 2) AS avg_transaction,
    SUM(f.transaction_qty) AS total_items_sold
FROM fact_sales f
JOIN dim_stores s ON f.store_id = s.store_id
GROUP BY s.store_location
ORDER BY revenue DESC; 

-- Categorías más vendidas
SELECT 
	p.product_category,
    ROUND(SUM(f.transaction_qty * f.unit_price), 2) AS revenue,
    SUM(f.transaction_qty) AS total_units,
    COUNT(DISTINCT f.transaction_id) AS transactions,
    ROUND(AVG(f.unit_price), 2) AS avg_price
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY revenue DESC;

-- Horas pico de venta
SELECT 
    HOUR(transaction_time) AS hour_of_day,
    COUNT(*) AS transactions,
    ROUND(SUM(f.transaction_qty * f.unit_price), 2) AS revenue
FROM fact_sales f
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- Ventas por día de la semana
SELECT 
    DAYNAME(transaction_date) AS day_of_week,
    DAYOFWEEK(transaction_date) AS day_num,
    COUNT(DISTINCT transaction_id) AS transactions,
    ROUND(SUM(transaction_qty * unit_price), 2) AS revenue
FROM fact_sales
GROUP BY day_of_week, day_num
ORDER BY day_num;

-- Porductos por categoría
SELECT 
    product_category,
    product_detail,
    revenue,
    rank_in_category
FROM (
    SELECT 
        p.product_category,
        p.product_detail,
        ROUND(SUM(f.transaction_qty * f.unit_price), 2) AS revenue,
        RANK() OVER (PARTITION BY p.product_category ORDER BY SUM(f.transaction_qty * f.unit_price) DESC) AS rank_in_category
    FROM fact_sales f
    JOIN dim_products p ON f.product_id = p.product_id
    GROUP BY p.product_category, p.product_detail
) ranked
WHERE rank_in_category <= 3
ORDER BY product_category, rank_in_category;