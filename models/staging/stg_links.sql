select
    movieid as movie_id,
    imdbid as imdb_id,
    tmdbid as tmdb_id
from {{ source('raw', 'raw_links') }}
where movieid is not null