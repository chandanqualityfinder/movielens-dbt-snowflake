select movie_id, avg_rating
from {{ ref('fct_movie_ratings') }}
where avg_rating is not null
  and (avg_rating < 0.5 or avg_rating > 5.0)