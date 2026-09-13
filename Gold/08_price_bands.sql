-- Which price band does each listing fall into?
Select
id,
neighbourhood_cleansed,
room_type,
price,
Case ntile(4) Over(Order by price Asc)
	When 1 then 'Budget'
	When  2 then 'Mid Range'
	When 3 then 'A bit expensive'
	When 4 then 'Premium'
End as price_category
from silver_listing
where id is not null and price is not null

-- Amsterdam listings divided into 4 price bands
-- Budget listings start from ~$39/night
-- Premium listings can exceed $500+/night
-- Tourists can filter by price_category to find their budget range
