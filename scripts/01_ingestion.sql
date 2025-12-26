-- PURPOSE:
-- This script ingest datasets in default format or marketting format
-- Marketing format consists of currency symbol, percentage, and other symbols that can't be loaded as numeric
--
-- Can be executed multiple times depend on the correction

-- Staging the table first into marketting format

DROP TABLE IF EXISTS bronze.products_stage;

CREATE TABLE IF NOT EXISTS bronze.products_stage (
	product_id text,
	product_name text,
	category text,
	discounted_price text,
	actual_price text,
	discount_percentage text,
	rating text,
	rating_count text,
	about_product text,
	user_id text,
	user_name text,
	review_id text,
	review_title text,
	review_content text,
	img_link text,
	product_link text
);
