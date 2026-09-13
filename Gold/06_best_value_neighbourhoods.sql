--Which neighbourhoods have the best value score?
Select
neighbourhood_cleansed,
Round(avg(review_scores_value),3) as average_value
from silver_listing
Group by neighbourhood_cleansed
Order by average_value Desc

--IJburg - Zeeburgereiland  → 4.699 ← best value!
--Noord-West                → 4.693 Second best
--Zuid                      → 4.687 Third best


-- Osdorp    → cheapest price (Q1) + high rating (Q2)
-- IJburg    → best value score (Q6)
--Noord-West → high rating (Q2) + second best value (Q6)
