  -- Which listings are rip off?
 Select
 host_id,
 neighbourhood_cleansed,
 room_type,
 price,
 review_scores_value,
 price/review_scores_value as calculated_ratio
 from silver_listing
 where review_scores_value < 3
 Order by calculated_ratio Desc

 -- important point to consider we won't be able to use simple calculated ratio because there are listing where price is higher and rating are higher so we have 
 -- to give the the condition where review scores value is less than 3