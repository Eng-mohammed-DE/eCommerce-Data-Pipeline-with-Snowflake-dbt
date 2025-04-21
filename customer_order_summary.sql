with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
)

select
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.total_amount
from orders o
join customers c on o.customer_id = c.customer_id
