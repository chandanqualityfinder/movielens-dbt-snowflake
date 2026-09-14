select
    userid as user_id,
    movieid as movie_id,
    rating,
    to_timestamp(timestamp) as rated_at
from {{ source('raw', 'raw_ratings') }}
where userid is not null
  and movieid is not null
  and rating between 0.5 and 5.0
qualify row_number() over (
    partition by userid, movieid order by timestamp desc
) = 1