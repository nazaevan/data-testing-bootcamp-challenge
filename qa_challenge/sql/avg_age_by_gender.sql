select genre,
    gender,
    avg(age) avg_age
from viewership_data
group by 1, 2
order by 1, 2
