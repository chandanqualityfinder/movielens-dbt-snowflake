select
    movieid as movie_id,
    trim(title) as title,
    genres,
    try_cast(
        regexp_substr(title, '\\((\\d{4})\\)$', 1, 1, 'e') as integer
    ) as release_year
from {{ source('raw', 'raw_movies') }}
where movieid is not null