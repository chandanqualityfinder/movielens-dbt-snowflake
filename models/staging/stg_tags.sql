select
    userid as user_id,
    movieid as movie_id,
    trim(lower(tag)) as tag,
    to_timestamp(timestamp) as tagged_at
from {{ source('raw', 'raw_tags') }}
where movieid is not null
  and tag is not null