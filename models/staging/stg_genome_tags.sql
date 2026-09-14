select
    tagid as tag_id,
    trim(lower(tag)) as tag
from {{ source('raw', 'raw_genome_tags') }}
where tagid is not null