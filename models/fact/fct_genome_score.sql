with genome_score AS(
    select * from {{ ref('src_genome_score') }}
)
select
    movie_id,
    TAG_ID,
    ROUND(RELEVANCE,4) RELEVANCE_SCORE
FROM genome_score
WHERE RELEVANCE_SCORE > 0