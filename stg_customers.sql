WITH raw_customers AS (
    SELECT * FROM {{ source('raw', 'customers') }}
)
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    created_at,
    updated_at
FROM raw_customers
WHERE email IS NOT NULL

