-- ============================================
-- Amsterdam Airbnb Analysis
-- Layer: Silver - Host Table
-- Author: Hadi Hussain
-- Date: August 2026
-- Description: Creates silver_host table with
--              correct data types and loads
--              cleaned host data from bronze layer
-- Rows loaded: 5,333
-- Fixes Applied:
--   1. host_id converted to INT
--   2. host_since converted to DATE
--   3. Numeric columns converted to INT/FLOAT
--   4. NULL price rows excluded
--   5. host_response_rate/acceptance_rate removed
--      (all NULL values)
-- ============================================

Drop table if exists silver_host;

Create table silver_host(
host_id                    INT,
host_name                  VARCHAR(200),
host_since                 DATE,
host_location              VARCHAR(200),
host_is_superhost          VARCHAR(10),
host_listings_count        INT,
host_total_listings_count  INT,
hosts_time_as_host_years   FLOAT
)

Insert into silver_host(
	host_id,
	host_name,
	host_since,
	host_location,
	
	host_is_superhost,
	host_listings_count,
	host_total_listings_count,
	hosts_time_as_host_years
)
Select Distinct
	TRY_CAST(host_id AS INT) AS host_id,
	host_name,
	TRY_CAST(host_since AS DATE) AS host_since,
	host_location,
	host_is_superhost,
	TRY_CAST(host_listings_count AS INT) AS host_listings_count,
	TRY_CAST(host_total_listings_count AS INT) AS host_total_listings_count,
	TRY_CAST(hosts_time_as_host_years AS FLOAT) AS hosts_time_as_host_years
from bronze_airbnb
where price is not null


-- ============================================
-- VERIFICATION
-- ============================================
SELECT COUNT(*) as total_rows FROM silver_host;
SELECT TOP 10 * FROM silver_host;