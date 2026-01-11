# ☕Coffee Shop Sales Analysis | SQL & Power BI

## 🎯 Business Objective

Analizar los datos transaccionales de ventas de una cadena de cafeterías para identificar los factores que 
impulsan los ingresos, las tendencias de ventas, el rendimiento de los productos y la información a nivel 
de tienda que respalda la toma de decisiones basada en datos.

Este proyecto simula un flujo de trabajo de inteligencia empresarial del mundo real, desde la exploración de
datos sin procesar hasta el desarrollo del dashboard.

## 📊 Dataset

**Source:** Maven Roasters – Coffee Shop Sales Dataset (Kaggle)

El dataset contiene registros transaccionales que incluyen:

- Fecha y hora de la transacción

- Cantidad vendida

- Ubicación de la tienda

- Detalles y precios de productos

*Los datos representan la actividad de ventas en 3 tiendas y 97 productos, con un total de 55 198 transacciones.*

## 🧹 Data Preparation & Cleaning (SQL)

El análisis comenzó con un análisis exploratorio de datos (EDA) y la validación de datos utilizado MySQL:

- Validación de valores nulos o inválidos 

- Detección de duplicados

- Revisión de tipos de datos y rangos de fechas

- Separación de datos sin procesar de tablas analíticas

*Para mejorar el rendimiento analítico y la claridad, los datos se moldearon utilizando un enfoque dimensional
(esquema estrella).*

## 🧱 Data Model

Diseño de esquema de estrella:

- fact_sales – transactional data (quantities, date, time)

- dim_products – product category, type, detail, and price

- dim_stores – store identifiers and locations

*Este modelo admite filtro, agregación y un rendimiento del dashboard eficientes.*

## 🧮 SQL Analysis

Los análisis SQL claves realizados incluyen: 

- Cálculo de los ingresos totales

- Tendencias de ingresos mensuales

- Productos más vendidos por ingresos

- Contribución a los ingresos por tienda

- Rendimiento de las categorías de productos

*Todas las consultas se documentan y organizan en scripts SQL versionados. *

## 📈 Power BI Dashboard

Se creó un dashboard interactivo con Power BI, conectado directamente con la base de datos de MySQL

### Métricas calves (DAX)

- Ingresos totales 

- Total de unidades vendidas

- Average Ticket Size

### Análisis visual  

- Tendencia de ventas en el tiempo

- Ingresos por ubicación de la tienda

- Productos más vendidos por ingresos

- Distribución de ventas por hora

- Segmentadores interactivos para tiendas y categorías de productos

## 🔍 Key Insights

- Un pequeño grupo de productos estrella genera una parte significativa de los ingresos totales.

- Las ventas alcanzan su punto álgido durante las horas de la mañana.

- Una tienda lidera constantemente el rendimiento general de los ingresos.

- Los productos de café dominan el volumen total de ventas.

## 🛠️ Tools & Technologies

- MySQL – data cleaning, modeling, and analysis

- SQL – EDA and business queries

- Power BI – data modeling, DAX measures, and visualization

## 📂 Project Structure

coffee-shop-sales-analysis/
├── SQL/
│ ├── 01_eda_initial.sql
│ ├── 02_data_cleaning.sql
│ └── 03_business_queries.sql
├── POWER BI/
│ └── Coffee_Sales_Analysis_PowerBI.pbix
│ └── dashboard_preview.png
└── README.md

## 🚀 Next Steps

- Ampliar el análisis con Python (EDA y visualización)

***Autora:*** *Jamilette Ramírez*
*Data Analyst aspirante / Business Intelligence Junior*