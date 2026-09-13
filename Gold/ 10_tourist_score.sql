-- Q10: Custom Tourist Recommendation Score
-- Shows TOP 10 best value listings per neighbourhood
-- Formula: (review_scores_rating * 0.20) + 
--          (review_scores_value * 0.30) +
--          (review_scores_location * 0.30) -
--          ((price/100) * 0.20)
-- Weights: Value and Location prioritised (30% each)
--          Rating (20%), Price penalty (20%)
-- Higher score = better tourist recommendation
-- Rankings reset for each neighbourhood
-- Only top 10 listings per neighbourhood shown

With tourist_score As(
	Select 
	id,
	neighbourhood_cleansed,
	room_type,
	price,
	((review_scores_rating * 0.20) + (review_scores_value * 0.30) + (review_scores_location * 0.30) - ((price/100) * 0.20)) As formula,
	dense_rank() over(partition by neighbourhood_cleansed 
							Order by (review_scores_rating * 0.20) + 
									(review_scores_value * 0.30) + 
									(review_scores_location * 0.30) - 
									((price/100) * 0.20) DESC) As ranking 
	from silver_listing 
	where id is not null
	And review_scores_rating is not null
	And review_scores_value is not null
	And review_scores_location is not null 
	)
	Select
	*
	from tourist_score
	where ranking <= 10 
	Order by neighbourhood_cleansed, ranking 
