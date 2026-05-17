{{ (config(materialized = 'table')) }}

with ratings AS(
    select * from {{ ref('fct_ratings') }}
),
seed as(
    select * from {{ ref('seeds_movie_release') }}
)
select 
    r.*,
    case 
        when s.release_date IS NULL then 'unknown'
        else 'known'
    end relase_details
from ratings r
left join seed s on r.movie_id = s.movie_id