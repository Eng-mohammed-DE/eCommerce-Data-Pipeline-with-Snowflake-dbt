with raw as (
    select * from {{ source('raw', 'orders') }}
)

select
    order_id,
    customer_id,
    order_date,
    total_amount,
    status
from raw

