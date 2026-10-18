-- E-commerce Business Performance Analysis
-- Dialect: PostgreSQL / broadly portable SQL. Source: data/ecommerce_orders.csv
-- Import the CSV into a table named ecommerce_orders before running.

-- 1. Executive KPI snapshot
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(revenue)::numeric, 2) AS total_revenue,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue), 0), 2) AS profit_margin_pct,
    ROUND(100.0 * AVG(CASE WHEN returned = 'Yes' THEN 1.0 ELSE 0.0 END), 2) AS return_rate_pct
FROM ecommerce_orders;

-- 2. Monthly revenue and profit trend
SELECT DATE_TRUNC('month', order_date::date)::date AS month,
       SUM(revenue) AS revenue, SUM(profit) AS profit,
       COUNT(DISTINCT order_id) AS orders
FROM ecommerce_orders
GROUP BY 1 ORDER BY 1;

-- 3. Category performance and margin
SELECT category, SUM(revenue) AS revenue, SUM(profit) AS profit,
       ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue),0), 2) AS margin_pct
FROM ecommerce_orders
GROUP BY category ORDER BY profit DESC;

-- 4. Region performance
SELECT region, SUM(revenue) AS revenue, SUM(profit) AS profit,
       COUNT(DISTINCT order_id) AS orders
FROM ecommerce_orders
GROUP BY region ORDER BY revenue DESC;

-- 5. Sales channel comparison
SELECT sales_channel, SUM(revenue) AS revenue, SUM(profit) AS profit,
       ROUND(AVG(revenue),2) AS avg_order_value
FROM ecommerce_orders
GROUP BY sales_channel ORDER BY profit DESC;

-- 6. Discount bands: compare revenue and margin
SELECT CASE WHEN discount_pct = 0 THEN '0%'
            WHEN discount_pct <= 0.05 THEN '1-5%'
            WHEN discount_pct <= 0.10 THEN '6-10%'
            WHEN discount_pct <= 0.15 THEN '11-15%'
            ELSE '16-20%' END AS discount_band,
       COUNT(*) AS orders, SUM(revenue) AS revenue, SUM(profit) AS profit,
       ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue),0),2) AS margin_pct
FROM ecommerce_orders
GROUP BY 1 ORDER BY MIN(discount_pct);

-- 7. Return rate by category
SELECT category, COUNT(*) AS order_lines,
       SUM(CASE WHEN returned='Yes' THEN 1 ELSE 0 END) AS returned_lines,
       ROUND(100.0 * AVG(CASE WHEN returned='Yes' THEN 1.0 ELSE 0.0 END),2) AS return_rate_pct
FROM ecommerce_orders
GROUP BY category ORDER BY return_rate_pct DESC;

-- 8. Top 10 products by profit
SELECT product_name, SUM(revenue) AS revenue, SUM(profit) AS profit,
       SUM(quantity) AS units_sold
FROM ecommerce_orders
GROUP BY product_name ORDER BY profit DESC LIMIT 10;
