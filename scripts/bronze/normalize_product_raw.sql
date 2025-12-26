-- PURPOSE
-- After loading the data into the raw staging table
-- Normalize the format will be the next step before doing any further

-- RAW DATA WITH NORMALIZE THE FORMAT BY REMOVING THE MARKETTING FORMAT

DROP TABLE IF EXISTS bronze.products_raw;

CREATE TABLE bronze.products_raw (
    product_id TEXT,
    product_name TEXT,
    category TEXT,
    discounted_price NUMERIC,
    actual_price NUMERIC,
    discount_percentage NUMERIC,
    rating NUMERIC,
    rating_count INT,
    about_product TEXT,
    user_id TEXT,
    user_name TEXT,
    review_id TEXT,
    review_title TEXT,
    review_content TEXT,
    img_link TEXT,
    product_link TEXT
);

INSERT INTO bronze.products_raw
SELECT
    product_id,
    product_name,
    category,

    -- discounted price
    NULLIF(
      REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(discounted_price,'₹',''),',',''),'|',''),' ',''),'',''),
      ''
    )::NUMERIC,

    -- actual price
    NULLIF(
      REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(actual_price,'₹',''),',',''),'|',''),' ',''),'',''),
      ''
    )::NUMERIC,

    -- discount %
    NULLIF(
      REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(discount_percentage,'%',''),',',''),'|',''),' ',''),'',''),
      ''
    )::NUMERIC,

    -- rating
    NULLIF(
      REPLACE(REPLACE(REPLACE(REPLACE(rating,'|',''),',',''),' ',''),'',''),
      ''
    )::NUMERIC,

    -- rating count
    NULLIF(
      REPLACE(REPLACE(REPLACE(REPLACE(rating_count,'|',''),',',''),' ',''),'',''),
      ''
    )::INT,

    about_product,
    user_id,
    user_name,
    review_id,
    review_title,
    review_content,
    img_link,
    product_link
FROM bronze.products_stage;

SELECT * FROM bronze.products_raw;
