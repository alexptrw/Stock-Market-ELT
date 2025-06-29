/*
Purpose:
This script performs the following transformations:
1. Converts the symbol and exchange to uppercase.
2. Trims leading and trailing spaces from the exchangeFullName, name, and symbol.
3. Replaces commas in the name with an empty string.
4. Adds a row_id column with a unique identifier.
5. Adds a date_added column with the current timestamp in the "Europe/Kiev" timezone

============================================
DDL script to create a silver table from the raw data in BigQuery.
============================================

Usage:
Run this script in the BigQuery console.
*/


CREATE OR REPLACE TABLE stock-marketing-project.fmp_data.fmp_data_silver
(id INT,
  symbol STRING,
  exchange_code STRING,
  company_name STRING,
  exchange_full_name STRING,
  currency STRING,
  is_forex BOOL,
  date_added DATETIME);

INSERT INTO stock-marketing-project.fmp_data.fmp_data_silver(
SELECT 
ROW_NUMBER() OVER () AS row_id,
TRIM(UPPER(symbol)),
TRIM(UPPER(exchange)),
TRIM(REPLACE(name, ',', '')),
TRIM(exchangeFullName),
TRIM(UPPER(currency)),
CASE WHEN LOWER(exchange) = 'forex' THEN TRUE
ELSE FALSE
END as is_forex,
 DATETIME(CURRENT_TIMESTAMP(), "Europe/Kiev") 
FROM `stock-marketing-project.fmp_data.fmp_data`
)

