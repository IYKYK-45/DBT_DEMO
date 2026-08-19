WITH daily_weather as (
select 
date(time) as daily_weather,
WEATHER,
HUMIDITY,
CLOUDS

from {{ source('demo', 'weather') }}
),

daily_weather_modified as(
select
daily_weather,
WEATHER,
/* COUNT(WEATHER),
ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY COUNT(WEATHER) desc) as row_number */
round(avg(CLOUDS)) as Clouds,
round(avg(HUMIDITY)) as Humidity



from daily_weather 

group by daily_weather, WEATHER

qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY COUNT(WEATHER) desc) = 1

)



select * from daily_weather_modified