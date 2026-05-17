with raw_movies AS(
    select * from movielens.raw.raw_movies
)
select movieID As movie_id,title,genres
from raw_movies