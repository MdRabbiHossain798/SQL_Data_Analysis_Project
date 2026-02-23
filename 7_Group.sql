/*Segment product into cost ranges and count 
how many products fall into each segment*/

WITH product_segments AS(
SELECT 
product_key,
product_name,
cost,
CASE WHEN cost < 100 THEN 'Below 100'
	 WHEN cost BETWEEN 100 and 500 THEN '100-500'
	 WHEN cost BETWEEN 500 and 1000 THEN '500-1000'
	 ELSE 'Avobe 1000'
END cost_range
FROM dbo.dim_products)

SELECT 
cost_range,
count(product_key) AS total_product
FROM product_segments
GROUP BY cost_range
ORDER BY total_product DESC
