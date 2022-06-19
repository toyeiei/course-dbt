{{
    config(materialized='view')
}}

SELECT 
    o.order_id,
    o.promo_id,
    p.discount AS promo_discount,
    p.status   AS promo_status,
    o.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    o.address_id,
    a.zipcode,
    a.country,
    o.created_at AS created_at_utc, 
    o.order_cost, 
    o.shipping_cost, 
    o.order_total,
    o.tracking_id,
    o.shipping_service, 
    o.estimated_delivery_at AS estimated_delivery_at_utc,
    o.delivered_at          AS delivered_at_utc,
    o.status                AS order_status
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_promos') }} p 
    ON o.promo_id = p.promo_id
LEFT JOIN {{ ref('stg_users')  }} u 
    ON o.user_id = u.user_id 
LEFT JOIN {{ ref('stg_addresses')}} a 
    ON o.address_id = a.address_id 