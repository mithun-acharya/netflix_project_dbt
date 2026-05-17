{% snapshot snap_tags  %}

{{
    config(
        target_schema='snapshot',
        unique_key=['user_id','movie_id','tag'],
        strategy='timestamp',
        updated_at='tag_timestamps',
        invalidate_hard_deletes =True
    )
}}
select 
{{ dbt_utils.generate_surrogate_key(['user_id','movie_id','tag']) }} AS row_key,
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamps AS TIMESTAMP_NTZ) tag_timestamps
from {{ref('src_tags') }}
limit 100

{% endsnapshot %}