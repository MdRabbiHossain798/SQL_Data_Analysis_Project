-- Find the Total Sales
SELECT sum(sales_amount) AS Total_sales from dbo.fact_sales


-- Find how many items are sold
SELECT sum(quantity) AS Total_quantity from dbo.fact_sales


-- Find the average selling price
SELECT AVG(price) AS Avg_price from dbo.fact_sales


-- Find the Total number or Orders
SElECT count(order_number) AS Total_orders from dbo.fact_sales
SElECT count(DISTINCT order_number) AS Total_orders from dbo.fact_sales


-- Find the Total number of products
SElECT count(product_name) AS Total_product from dbo.dim_products
SElECT count(DISTINCT product_name) AS Total_product from dbo.dim_products


-- Find the Total number of cumtomers
SELECT COUNT(customer_key) from dbo.dim_customers


-- Find the Total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) from dbo.fact_sales

-- Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, sum(sales_amount) AS measure_value from dbo.fact_sales
UNION ALL
SELECT 'Total_Quantity', sum(quantity) from dbo.fact_sales
UNION ALL
SELECT 'Avg_Price', AVG(price)  from dbo.fact_sales
UNION ALL
SElECT 'Nr.Total_Orders', count(DISTINCT order_number) from dbo.fact_sales
UNION ALL
SElECT 'Nr.Total_Product', count(DISTINCT product_name) from dbo.dim_products
UNION ALL
SELECT 'Nr.Customers', COUNT(customer_key) from dbo.dim_customers