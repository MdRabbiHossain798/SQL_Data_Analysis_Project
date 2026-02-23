-- Explore all the Countries our customer come from.

select DISTINCT country FROM dbo.dim_customers

-- Explore all Categories 'The Major Divition.

select DISTINCT category, subcategory, product_name FROM dbo.dim_products
order by 1,2,3
