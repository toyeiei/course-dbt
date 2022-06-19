{{
    config(materialized='table')
}}

SELECT 
    order_id,
    promo_id,
    promo_discount,
    promo_status,
    user_id,
    first_name,
    last_name,
    email,
    phone_number,
    address_id,
    zipcode,
    country,
    created_at_utc, 
    order_cost, 
    shipping_cost, 
    order_total,
    tracking_id,
    shipping_service, 
    estimated_delivery_at_utc,
    delivered_at_utc,
    order_status
FROM {{ ref('int_orders_users_promos_joined') }} 