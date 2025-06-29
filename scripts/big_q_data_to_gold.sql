/*
Purpose:
This script processes the silver data from the FMP dataset to create gold tables.

============================================
DDL script to create gold tables from the silver data in BigQuery.
============================================
Usage:
Run this script in the BigQuery console.
*/


-- only forex exchange names
CREATE OR REPLACE TABLE fmp_data.forex_excange_gold AS
SELECT symbol,
currency,
date_added,
exchange_code
 FROM `stock-marketing-project.fmp_data.fmp_data_silver`
WHERE is_forex is true;

-- not forex exchange names
CREATE OR REPLACE TABLE fmp_data.non_forex_excange_gold AS
SELECT symbol,
currency,
date_added,
exchange_code
 FROM `stock-marketing-project.fmp_data.fmp_data_silver`
WHERE is_forex is false;

-- overview of unique exchanges + overall count of exchanges
CREATE OR REPLACE TABLE fmp_data.exchange_summary_gold AS
SELECT exchange_code, COUNT(DISTINCT symbol) as total_symbols, MAX(date_added) as latest_date_added
 FROM `stock-marketing-project.fmp_data.fmp_data_silver`
 GROUP BY exchange
 ORDER BY COUNT(DISTINCT symbol) desc;

-- companies with multiple exchanges
CREATE OR REPLACE TABLE fmp_data.company_diff_exchange_gold AS
SELECT 
  company_name,
  COUNT(DISTINCT exchange) AS exchange_count,
  STRING_AGG(DISTINCT exchange, ', ') AS exchanges
FROM `stock-marketing-project.fmp_data.fmp_data_silver`
GROUP BY company_name
HAVING exchange_count > 1
ORDER BY company_name;