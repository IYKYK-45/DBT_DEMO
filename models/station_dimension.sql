with abc as(

select 
-- distinct
cityname,
latitude,
longitude


from {{ source('demo', 'weather') }}
)

select * from abc