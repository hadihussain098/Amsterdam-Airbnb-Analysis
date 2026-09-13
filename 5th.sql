--Do super host offer best value than regular host

Select
host_is_superhost,
Round(avg(price), 2) as price,
Round(avg(review_scores_rating), 2) As average_rating,
Round(avg(review_scores_value),2) As average_values
from silver_listing as l

Inner join silver_host as h
on l.host_id = h.host_id
where host_is_superhost is not null
Group by host_is_superhost

-- Finding: Superhosts charge less ($270 avg) vs regular hosts ($344 avg)
-- Despite lower price, superhosts deliver higher ratings (4.86 vs 4.83)
-- and better value scores (4.68 vs 4.64)
-- Conclusion: Tourists should prioritise superhosts for better value!