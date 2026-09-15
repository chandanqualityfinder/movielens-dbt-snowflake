select
    movieid as movie_id,
    releasedate as release_date
from {{ source('raw', 'raw_movies_release_dates') }}
where movieid is not null