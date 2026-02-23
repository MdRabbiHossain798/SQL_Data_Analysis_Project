/*Group customer into three segments based on their spending behavior:
	-VIP:Customer with at least 12 month of history and spending more than $5000.
	-Regular:Customer with at least 12 month of history and spending $5000 or less.
	-Customer with a lifespan less than 12 months.
And find the total number of customers by each group*/

WITH customer_spending AS(
SELECT
c.customer_key,
sum(f.sales_amount) AS total_spending,
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
FROM  dbo.fact_sales f
LEFT JOIN dbo.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key)

SELECT
customer_segment,
COUNT(customer_key) AS total_customers
FROM (
	SELECT
	customer_key,
	total_spending,
	lifespan,
	CASE WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
		WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
		ELSE 'New'
	END customer_segment
	FROM customer_spending)t
GROUP BY customer_segment
Order BY total_customers DESC
