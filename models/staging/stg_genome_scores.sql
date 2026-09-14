select
    movieid as movie_id,
    tagid as tag_id,
    relevance
from {{ source('raw', 'raw_genome_scores') }}
where movieid is not null
  and tagid is not null