with src_movies AS(
    select * from {{ ref('src_movies') }}
)
select movie_id,
INITCAP(TRIM(title)) MOVIE_TITLE,
SPLIT(genres,'|') GENRE_ARAY,
genres
from src_movies