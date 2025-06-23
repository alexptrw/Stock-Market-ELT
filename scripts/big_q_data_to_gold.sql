-- only forex exchange names
CREATE OR REPLACE TABLE fmp_gold_data.forex_excange AS
SELECT symbol,
currency,
date_added,
exchange
 FROM `terraform-demo-458815.fmp_silver_data.fmp_silver`
WHERE is_forex is true;

-- not forex exchange names
CREATE OR REPLACE TABLE fmp_gold_data.forex_excange AS
SELECT symbol,
currency,
date_added,
exchange
 FROM `terraform-demo-458815.fmp_silver_data.fmp_silver`
WHERE is_forex is false;

-- overview of unique exchanges + overall count of exchanges
CREATE OR REPLACE TABLE fmp_gold_data.exchange_summary AS
SELECT exchange, COUNT(DISTINCT symbol) as total_symbols, MAX(date_added) as latest_date_added
 FROM `terraform-demo-458815.fmp_silver_data.fmp_silver`
 GROUP BY exchange
 ORDER BY COUNT(DISTINCT symbol) desc;

-- compnies with multiple exchanges
CREATE OR REPLACE TABLE fmp_gold_data.company_diff_exchange AS
SELECT 
  company_name,
  COUNT(DISTINCT exchange) AS exchange_count,
  STRING_AGG(DISTINCT exchange, ', ') AS exchanges
FROM `terraform-demo-458815.fmp_silver_data.fmp_silver`
GROUP BY company_name
HAVING exchange_count > 1
ORDER BY company_name;