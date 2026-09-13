--Which neighbourhoods have the highest average rating?

Select
Round(avg(review_scores_rating),2)   As average_rating,
neighbourhood_cleansed
from silver_listing
Group by neighbourhood_cleansed
Order by average_rating Desc

-- Noord_west, Bos en Lommer and Zuid scores 4.87 followed by Westerpark, De baarsjes and osdorp to 4.86
-- Osdorp was cheapest amongest other towns and it is rated as second in terms of average rating 
