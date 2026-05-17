{{ config(materialized = 'table') }}
with raw_tags AS(
    select * from movielens.raw.raw_tags
)
select userid user_id,
movieID movie_id,
tag,
TO_TIMESTAMP_LTZ(timestamp) tag_timestamps
from raw_tags