--What room type offers the best combination of price and rating?
Select
room_type,
avg(price) as average_price,
avg(review_scores_rating) as average_rating,
avg(review_scores_rating)/avg(price) as value_ratio
from silver_listing
Group by room_type
Order by value_ratio Desc

-- The result shows Shared room offers the best combination of price and rating followed by private room, hotel room and entire home