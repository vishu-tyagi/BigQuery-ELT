{{ config(materialized='view') }}
{{ config(schema='staging')  }}


select
    locationid
    , borough
    , zone
    , replace(service_zone, 'Boro', 'Green') as service_zone
from {{ ref('taxi_zone_lookup') }}
where
    borough != 'Unknown'
    and service_zone != 'N/A'
    and borough != 'EWR'