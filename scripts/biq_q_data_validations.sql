/*
BigQuery Data Validations for FMP Data
This script performs data validation checks on the FMP data in BigQuery.
It checks for: 
    null values, 
    leading/trailing spaces, 
    duplicate entries, 
    specific patterns in the data.

*/


--check for null values
SELECT * FROM `stock-marketing-project.fmp_data.fmp_data` 
WHERE exchange is null ;

SELECT * FROM `stock-marketing-project.fmp_data.fmp_data` 
WHERE exchangeFullName is null OR
currency is null or name is null or symbol is null;

--check for leading/trailing spaces
SELECT * FROM `stock-marketing-project.fmp_data.fmp_data` 
WHERE exchangeFullName != TRIM(exchangeFullName) OR 
name != TRIM(name) OR 
symbol != TRIM(symbol) ;

-- checks for same company same simbol same exchange
SELECT
  name,
  symbol,
  exchange,
  COUNT(*) AS occurrence_count
FROM `stock-marketing-project.fmp_data.fmp_data` 
GROUP BY name, symbol, exchange
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC

-- check for comma in name
SELECT * FROM `stock-marketing-project.fmp_data.fmp_data` 
WHERE name LIKE '%,%';
-- check how transofrmed data would look like
SELECT * FROM `stock-marketing-project.fmp_data.fmp_data` 
WHERE name LIKE '%,%';
