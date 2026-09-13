--- Amsterdam airbnb analysis
-- layer- Silver
-- Author Hadi Hussain 
-- Creating Listing table

Drop Table if exists silver_listing;

Create Table silver_listing(
	id                        INT,
	neighbourhood_cleansed    VARCHAR(200),
	property_type             VARCHAR(200),
	room_type                 VARCHAR(200),
	accommodates              INT,
	bathrooms_text            VARCHAR(50),
	bedrooms                  INT,
	beds                      INT,
	price                     FLOAT,
	minimum_nights            INT,
	maximum_nights            INT,
	availability_365          INT,
	number_of_reviews         INT,
	review_scores_rating      FLOAT,
	review_scores_accuracy    FLOAT,
	review_scores_cleanliness FLOAT,
	review_scores_checkin     FLOAT,
	review_scores_communication FLOAT,
	review_scores_location    FLOAT,
	review_scores_value       FLOAT,
	host_id int

);

Insert into silver_listing(
	id,
	neighbourhood_cleansed,
	property_type,
	room_type,
	accommodates,
	bathrooms_text,
	bedrooms,
	beds,
	price,
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

)

Select 
Try_cast(id AS int) As id,
neighbourhood_cleansed,
CASE WHEN property_type = 'ShepherdGÇÖs hut' 
     THEN 'Shepherd''s hut'
     ELSE property_type
END as property_type,
room_type,
try_cast(accommodates as int) AS accommodates,
bathrooms_text,
try_cast(bedrooms as int) as bedrooms,
try_cast(beds As int) as beds,
TRY_CAST(REPLACE(price, '$', '') AS FLOAT) AS price,
try_cast(minimum_nights As int) As minimum_nights,
try_cast(maximum_nights as int) As maximum_nights,
TRY_CAST(availability_365 AS INT) AS availability_365,
TRY_CAST(number_of_reviews AS INT) AS number_of_reviews,
TRY_CAST(review_scores_rating AS float) AS review_scores_rating,
TRY_CAST(review_scores_accuracy AS float) AS review_scores_accuracy,
TRY_CAST(review_scores_cleanliness AS float) AS review_scores_cleanliness,
TRY_CAST(review_scores_checkin AS float) AS review_scores_checkin,
TRY_CAST(review_scores_communication AS float) AS review_scores_communication,
TRY_CAST(review_scores_location AS float) AS review_scores_location,
TRY_CAST(review_scores_value AS float) AS review_scores_value,
try_cast(host_id as int) As host_id
from bronze_airbnb
where price is not null
