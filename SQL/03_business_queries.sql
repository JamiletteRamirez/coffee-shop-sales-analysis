USE coffee_sales;

-- Ventas totales (KPI principal)
SELECT 
ROUND(SUM(f.transaction_qty * p.unite_price), 2) AS total_revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id;

-- Ventas por mes (tendencia)
SELECT 
	date_format(transaction_date, '%y-%m') AS month,
    ROUND(SUM(f.transaction_qty * p.unite_price),2) AS monthly_revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- Top 10 productos por ingreso
SELECT 
	p.product_detail,
    ROUND(SUM(f.transaction_qty * p.unite_price), 2) AS revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_detail
ORDER BY revenue DESC
LIMIT 10;

-- Ventas por tienda
SELECT 
	s.store_location,
	ROUND(SUM(f.transaction_qty * p.unite_price), 2) AS revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_stores s ON f.store_id = s.store_id
GROUP BY s.store_location
ORDER BY revenue DESC; 

-- Categorías más vendidas
SELECT 
	p.product_category,
    SUM(f.transaction_qty) AS total_units
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_units DESC; 