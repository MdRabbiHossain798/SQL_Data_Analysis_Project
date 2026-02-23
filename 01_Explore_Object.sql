-- Explore All Object in the Databage
select * from INFORMATION_SCHEMA.TABLES

-- Explore all Object in the Column
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'dim_customers'
