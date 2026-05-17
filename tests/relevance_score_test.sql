select 
    movie_id,
    TAG_ID,
    RELEVANCE_SCORE
from {{ ref('fct_genome_score') }}
where RELEVANCE_SCORE <= 0