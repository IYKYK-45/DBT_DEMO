with cte as(

select 
t.*,
w.*
from {{ ref('daily_weather') }} t
left join {{ ref('station_dimension') }} w
on t.daily_weather = w.cityname

order by daily_weather desc
)


select * from cte