with _interactions as (
    select country_code,
        video_id,
        sum(interaction_events) total_interactions
    from viewership_data
    group by 1, 2
    having sum(interaction_events) >= 150
), _ranking as (
    select country_code,
        video_id,
        total_interactions,
        row_number() over (partition by total_interactions order by country_code asc) _ranking_no
    from _interactions
)

select country_code,
    video_id,
    total_interactions
from _ranking
where _ranking_no <= 3
order by country_code asc