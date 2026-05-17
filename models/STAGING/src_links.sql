with raw_links AS(
    select * from movielens.raw.raw_links
)
select movieID movie_id,
imdbid IMDB_ID,
tmdbid TMDB_ID
from raw_links