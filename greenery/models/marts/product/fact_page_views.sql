{{
    config(materialized='table')
}}

SELECT 
    event_id,
    session_id,
    user_id,
    page_url,
    created_at AS create_at_utc,
    event_type,
    order_id,
    product_id
FROM {{ ref('stg_events') }}