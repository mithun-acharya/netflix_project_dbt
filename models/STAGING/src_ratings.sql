with raw_ratings AS(
    select * from movielens.raw.raw_ratings
)
select 
    userid as user_id,
    movieid as movie_id,
    rating,
    TO_TIMESTAMP_LTZ(timestamp) rating_timestamp
from raw_ratings