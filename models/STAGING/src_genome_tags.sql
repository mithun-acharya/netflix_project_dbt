with raw_genome_tags AS(
    SELECT * FROM movielens.raw.raw_genome_tags
)
SELECT TAGID TAG_ID,
TAG
FROM raw_genome_tags