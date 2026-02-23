-- Whice 5 product generate the highest revenue
SELECT TOP 5
p.product_name,
sum(s.sales_amount) AS total_revenue
from dbo.fact_sales s
LEFT JOIN dbo.dim_products p
ON p.product_key = s.product_key
GROUP BY
p.product_name
ORDER BY total_revenue DESC

-- Whice are the 5 worst-performing product in term of sales
SELECT TOP 5
p.product_name,
sum(s.sales_amount) AS total_revenue
from dbo.fact_sales s
LEFT JOIN dbo.dim_products p
ON p.product_key = s.product_key
GROUP BY
p.product_name
ORDER BY total_revenue

-- Find the Top 10 customer who have generated the highest revenue
SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name,
sum(s.sales_amount) AS total_revenue
from dbo.fact_sales s
LEFT JOIN dbo.dim_customers c
ON c.customer_key = s.customer_key
GROUP BY
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC

-- The 3 customer with fewest orders placed
SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT order_number) AS total_orders
from dbo.fact_sales s
LEFT JOIN dbo.dim_customers c
ON c.customer_key = s.customer_key
GROUP BY
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_orders
