-- Find the date of the first and last order
-- How many month of sales are available

SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(month,MIN(order_date),MAX(order_date)) AS Order_range_month
from dbo.fact_sales

-- Find the youngest and the oldest customer

SELECT
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
from dbo.dim_customers