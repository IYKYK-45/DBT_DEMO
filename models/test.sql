select
*
from {{ source('demo', 'sampletable') }}
LIMIT 10