with raw_genome_scores AS(
    SELECT * FROM movielens.raw.raw_genome_scores
)
SELECT MOVIEID movie_id,
TAGID TAG_ID,
RELEVANCE
FROM raw_genome_scores