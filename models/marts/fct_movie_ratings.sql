with movies as (
    select * from {{ ref('stg_movies') }}
),

ratings as (
    select * from {{ ref('stg_ratings') }}
),

rating_stats as (
    select
        movie_id,
        count(*) as num_ratings,
        round(avg(rating), 2) as avg_rating
    from ratings
    group by movie_id
)

select
    m.movie_id,
    m.title,
    m.genres,
    m.release_year,
    coalesce(r.num_ratings, 0) as num_ratings,
    r.avg_rating
from movies m
left join rating_stats r on m.movie_id = r.movie_id
order by r.avg_rating desc nulls last