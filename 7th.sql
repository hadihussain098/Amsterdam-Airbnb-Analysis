--Rank listings within each neighbourhood by value score

Select
id,
neighbourhood_cleansed,
room_type,
price,
review_scores_value,
dense_rank() over(partition by neighbourhood_cleansed Order by review_scores_value Desc) as ranking
from silver_listing
where id is not null and neighbourhood_cleansed is not null

-- interesting insight
--Rank 1 listing costs $926 but has value score 5.0
-- Rank 3 listing costs only $85 but has value score 4.8