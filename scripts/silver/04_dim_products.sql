-- Creating data where the economy flows in only

DROP TABLE IF EXISTS silver.dim_products;

CREATE TABLE IF NOT EXISTS silver.dim_products AS
SELECT
    product_id,
    product_name,
    discounted_price,
    actual_price,
    discount_percentage,
    rating,
    rating_count
FROM bronze.products_raw;

SELECT * 
FROM silver.dim_products; 
