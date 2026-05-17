with genome_tags AS(
    select * from {{ ref('src_genome_tags') }}
)
select TAG_ID,
    INITCAP(TRIM(tag)) tag_name
from genome_tags