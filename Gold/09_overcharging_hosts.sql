--Which hosts consistently overcharge?
Select
l.host_id,
avg(l.price) As average_price,
avg(l.review_scores_value) as average_value,
(SELECT AVG(price) FROM silver_listing) as amsterdam_avg_price,
(SELECT AVG(review_scores_value) FROM silver_listing) as amsterdam_avg_value
from silver_listing  as l
inner join silver_host as h
	On l.host_id = h.host_id
Group by l.host_id
HAVING AVG(l.price) > (SELECT AVG(price) FROM silver_listing)
AND AVG(l.review_scores_value) < (SELECT AVG(review_scores_value) FROM silver_listing)
