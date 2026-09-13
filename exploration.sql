-- ============================================
-- Amsterdam Airbnb Analysis
-- Layer: Silver - Exploration
-- Author: Hadi Hussain
-- Date: August 2026
-- Description: Data quality checks on bronze layer
--              before loading into silver tables
-- ============================================

-- ============================================
-- SECTION 1: ID COLUMN CHECKS
-- ============================================

--- column id checking for data quality

Select
id
from bronze_airbnb
where (id is null) or (id like '-%') or (id = '')  or (trim(id) != id) or (isnumeric(id) = 0)

SELECT id, COUNT(*) as duplicate_count
FROM bronze_airbnb
GROUP BY id
HAVING COUNT(*) > 1

-- looks good no nulls no negative value and everything is set

-- ============================================


-- ============================================
-- SECTION 2: NEIGHBOURHOOD CHECKS
-- ============================================

-- checking for neighbourhood cleansed column
Select
*
from bronze_airbnb
where trim(neighbourhood_cleansed) != neighbourhood_cleansed or (neighbourhood_cleansed = '') or (neighbourhood_cleansed is null)

-- looks perfectly fine for this column 

-- ============================================


-- SECTION 3: PROPERTY TYPE CHECKS
-- ============================================

-- checking for data quality issue in propety type
-- we have spelling mistake in shehpard huts
-- Fix applied in silver layer INSERT:

CASE WHEN property_type = 'ShepherdGÇÖs hut' 
     THEN 'Shepherd''s hut'
     ELSE property_type
END as property_type

-- Checking for unwanted spaces, nulls or anything else

Select
*
from bronze_airbnb
where trim(property_type) != property_type or (property_type = '') or (property_type is null)

-- Property type spelling mistake fixed in silver layer
-- Other than that no issues

-- ============================================

-- SECTION 4: ROOM TYPE CHECKS
-- ============================================
Select
*
from bronze_airbnb
where trim(room_type) != room_type or (room_type is null) or (room_type = '')

-- no issues at the room type

-- ============================================


-- SECTION 5: PRICE CHECKS
-- ============================================
-- Price column has 3,992 NULL values (38.5% of data)
-- Decision: Exclude NULL price rows in silver layer
-- Reason: Cannot analyse value/rip offs without price
-- WHERE price IS NOT NULL will be added to silver INSERT
-- removing the dollar sign from the price column
Select
replace(price, '$', '') As price
from bronze_airbnb

-- checking for negative value, trim in price

Select
*
from bronze_airbnb
where price like '-$%' or trim(price) != price

-- No issue found in price column

-- ============================================


-- SECTION 6: NUMERIC COLUMNS CHECKS
-- ===========================================

-- checking for other columns that 
Select
accommodates,
bedrooms,
beds,
minimum_nights,
maximum_nights,
availability_365,
number_of_reviews,
review_scores_rating,
review_scores_accuracy,
review_scores_cleanliness,
review_scores_checkin,
review_scores_communication,
review_scores_location,
review_scores_value,
host_id
from bronze_airbnb
where ((bedrooms = '') or ( bedrooms like '-%') or (isnumeric(bedrooms) = 0 and bedrooms is not null and bedrooms != '') or (trim(bedrooms)!= bedrooms)) or 
    ((beds = '') or ( beds like '-%') or (isnumeric(beds) = 0 and beds is not null and beds != '') or (trim(beds)!= beds)) or
    ((accommodates = '') or (accommodates like '-%') or (isnumeric(accommodates) = 0 and accommodates is not null and accommodates != '') or (trim(accommodates)!= accommodates)) or
    ((minimum_nights = '') or (minimum_nights like '-%') or (isnumeric(minimum_nights) = 0 and minimum_nights is not null and minimum_nights != '') or (trim(minimum_nights)!= minimum_nights)) or
    ((maximum_nights = '') or (maximum_nights like '-%') or (isnumeric(maximum_nights) = 0 and maximum_nights is not null and maximum_nights != '') or (trim(maximum_nights)!= maximum_nights)) or
    ((availability_365 = '') or (availability_365 like '-%') or (isnumeric(availability_365) = 0 and availability_365 is not null and availability_365 != '') or (trim(availability_365)!= availability_365)) or
    ((number_of_reviews = '') or (number_of_reviews like '-%') or (isnumeric(number_of_reviews) = 0 and number_of_reviews is not null and number_of_reviews != '') or (trim(number_of_reviews)!= number_of_reviews)) or
    ((review_scores_rating = '') or (review_scores_rating like '-%') or (isnumeric(review_scores_rating) = 0 and review_scores_rating is not null and review_scores_rating != '') or (trim(review_scores_rating)!= review_scores_rating)) or
    ((review_scores_accuracy = '') or (review_scores_accuracy like '-%') or (isnumeric(review_scores_accuracy) = 0 and review_scores_accuracy is not null and review_scores_accuracy != '') or (trim(review_scores_accuracy)!= review_scores_accuracy)) or
    ((review_scores_cleanliness = '') or (review_scores_cleanliness like '-%') or (isnumeric(review_scores_cleanliness) = 0 and review_scores_cleanliness is not null and review_scores_cleanliness != '') or (trim(review_scores_cleanliness)!= review_scores_cleanliness)) or
    ((review_scores_checkin = '') or (review_scores_checkin like '-%') or (isnumeric(review_scores_checkin) = 0 and review_scores_checkin is not null and review_scores_checkin != '') or (trim(review_scores_checkin)!= review_scores_checkin)) or
    ((review_scores_communication = '') or (review_scores_communication like '-%') or (isnumeric(review_scores_communication) = 0 and review_scores_communication is not null and review_scores_communication != '') or (trim(review_scores_communication)!= review_scores_communication)) or
    ((review_scores_location = '') or (review_scores_location like '-%') or (isnumeric(review_scores_location) = 0 and review_scores_location is not null and review_scores_location != '') or (trim(review_scores_location)!= review_scores_location)) or
    ((review_scores_value = '') or (review_scores_value like '-%') or (isnumeric(review_scores_value) = 0 and review_scores_value is not null and review_scores_value != '') or (trim(review_scores_value)!= review_scores_value))

-- No issues found in all numeric columns

============================================

    -- SECTION 7: HOST COLUMNS CHECKS
-- ============================================

SELECT 
room_type,
host_name,
host_since,
host_location,
host_response_time,
host_is_superhost
FROM bronze_airbnb
WHERE (TRIM(room_type) != room_type OR room_type = '' OR room_type IS NULL)
OR (TRIM(host_name) != host_name OR host_name = '' OR host_name IS NULL)
OR (TRIM(host_since) != host_since OR host_since = '' OR host_since IS NULL)
OR (TRIM(host_location) != host_location OR host_location = '' OR host_location IS NULL)
OR (TRIM(host_response_time) != host_response_time OR host_response_time = '' OR host_response_time IS NULL)
OR (TRIM(host_is_superhost) != host_is_superhost OR host_is_superhost = '' OR host_is_superhost IS NULL)

-- No Issue Found in these columns

SELECT *
FROM bronze_airbnb
WHERE host_response_rate NOT LIKE '%[0-9]%'
AND host_response_rate IS NOT NULL
OR host_acceptance_rate NOT LIKE '%[0-9]%'
AND host_acceptance_rate IS NOT NULL