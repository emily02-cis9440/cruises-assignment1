USE cruises_db;

-- 1) Create fact table
CREATE TABLE fact_cruise_prices (
    fact_cruise_price_id INT NOT NULL AUTO_INCREMENT,
    cruise_id            INT NOT NULL,
    number_of_nights     INT,
    from_price           DECIMAL(10,2),
    brochure_price       DECIMAL(10,2),
    savings_amount       DECIMAL(10,2),
    PRIMARY KEY (fact_cruise_price_id)
);

-- 2) Create dimension table
CREATE TABLE dim_cruise AS
SELECT DISTINCT
    id             AS cruise_id,
    specialType    AS special_type,
    numberOfNights AS number_of_nights
FROM cruises_raw;

-- 3) Load fact table from raw
INSERT INTO fact_cruise_prices (
    cruise_id,
    number_of_nights,
    from_price,
    brochure_price,
    savings_amount
)
SELECT
    id             AS cruise_id,
    numberOfNights AS number_of_nights,
    fromPrice      AS from_price,
    brochurePrice  AS brochure_price,
    savings        AS savings_amount
FROM cruises_raw;
