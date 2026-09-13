-- ============================================
-- Airbnb Analysis
--Layer: Bronze
-- Author: Hadi Hussain
--Description: loading raw data into bronze layer without  any transformation
--Source: inside airbnb website
-- Date: August 2026
-- Rows: 10,369
-- Columns: 90
-- Note: All columns loaded as VARCHAR(MAX) to avoid
--       data type errors during raw data load
-- ============================================   

Drop table if exists bronze_airbnb;

Create table bronze_airbnb(
    id VARCHAR(MAX),
    listing_url VARCHAR(MAX),
    scrape_id VARCHAR(MAX),
    last_scraped VARCHAR(MAX),
    source VARCHAR(MAX),
    name VARCHAR(MAX),
    description VARCHAR(MAX),
    neighborhood_overview VARCHAR(MAX),
    picture_url VARCHAR(MAX),
    host_id VARCHAR(MAX),
    host_url VARCHAR(MAX),
    host_profile_id VARCHAR(MAX),
    host_profile_url VARCHAR(MAX),
    host_name VARCHAR(MAX),
    host_since VARCHAR(MAX),
    hosts_time_as_user_years VARCHAR(MAX),
    hosts_time_as_user_months VARCHAR(MAX),
    hosts_time_as_host_years VARCHAR(MAX),
    hosts_time_as_host_months VARCHAR(MAX),
    host_location VARCHAR(MAX),
    host_about VARCHAR(MAX),
    host_response_time VARCHAR(MAX),
    host_response_rate VARCHAR(MAX),
    host_acceptance_rate VARCHAR(MAX),
    host_is_superhost VARCHAR(MAX),
    host_thumbnail_url VARCHAR(MAX),
    host_picture_url VARCHAR(MAX),
    host_neighbourhood VARCHAR(MAX),
    host_listings_count VARCHAR(MAX),
    host_total_listings_count VARCHAR(MAX),
    host_verifications VARCHAR(MAX),
    host_has_profile_pic VARCHAR(MAX),
    host_identity_verified VARCHAR(MAX),
    neighbourhood VARCHAR(MAX),
    neighbourhood_cleansed VARCHAR(MAX),
    neighbourhood_group_cleansed VARCHAR(MAX),
    latitude VARCHAR(MAX),
    longitude VARCHAR(MAX),
    property_type VARCHAR(MAX),
    room_type VARCHAR(MAX),
    accommodates VARCHAR(MAX),
    bathrooms VARCHAR(MAX),
    bathrooms_text VARCHAR(MAX),
    bedrooms VARCHAR(MAX),
    beds VARCHAR(MAX),
    amenities VARCHAR(MAX),
    price VARCHAR(MAX),
    price_quote_checkin_date VARCHAR(MAX),
    price_quote_checkout_date VARCHAR(MAX),
    price_quote_total_price VARCHAR(MAX),
    price_quote_price_per_night VARCHAR(MAX),
    price_quote_raw VARCHAR(MAX),
    minimum_nights VARCHAR(MAX),
    maximum_nights VARCHAR(MAX),
    minimum_minimum_nights VARCHAR(MAX),
    maximum_minimum_nights VARCHAR(MAX),
    minimum_maximum_nights VARCHAR(MAX),
    maximum_maximum_nights VARCHAR(MAX),
    minimum_nights_avg_ntm VARCHAR(MAX),
    maximum_nights_avg_ntm VARCHAR(MAX),
    calendar_updated VARCHAR(MAX),
    has_availability VARCHAR(MAX),
    availability_30 VARCHAR(MAX),
    availability_60 VARCHAR(MAX),
    availability_90 VARCHAR(MAX),
    availability_365 VARCHAR(MAX),
    calendar_last_scraped VARCHAR(MAX),
    number_of_reviews VARCHAR(MAX),
    number_of_reviews_ltm VARCHAR(MAX),
    number_of_reviews_l30d VARCHAR(MAX),
    availability_eoy VARCHAR(MAX),
    number_of_reviews_ly VARCHAR(MAX),
    estimated_occupancy_l365d VARCHAR(MAX),
    estimated_revenue_l365d VARCHAR(MAX),
    first_review VARCHAR(MAX),
    last_review VARCHAR(MAX),
    review_scores_rating VARCHAR(MAX),
    review_scores_accuracy VARCHAR(MAX),
    review_scores_cleanliness VARCHAR(MAX),
    review_scores_checkin VARCHAR(MAX),
    review_scores_communication VARCHAR(MAX),
    review_scores_location VARCHAR(MAX),
    review_scores_value VARCHAR(MAX),
    license VARCHAR(MAX),
    instant_bookable VARCHAR(MAX),
    calculated_host_listings_count VARCHAR(MAX),
    calculated_host_listings_count_entire_homes VARCHAR(MAX),
    calculated_host_listings_count_private_rooms VARCHAR(MAX),
    calculated_host_listings_count_shared_rooms VARCHAR(MAX),
    reviews_per_month VARCHAR(MAX)
)

Bulk insert bronze_airbnb
FROM 'C:\Users\hadih\OneDrive\Desktop\airbnb\listings.csv'
WITH (
    FIRSTROW = 2,
    FORMAT = 'CSV',
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

