{{
    config(materialized='view')
}}

-- will refactor this code to be more modular next time
SELECT 
    u.user_id
    , u.first_name
    , u.last_name
    , u.email
    , u.phone_number
    , a.zipcode
    , a.state
    , a.country
    , o.order_id
    , o.created_at AS created_at_utc
    , p.name AS product_name
    , p.price AS product_price
    , i.quantity AS product_quantity
    , o.order_cost
    , o.shipping_cost
    , o.order_total
    , pm.discount AS promo_discount
    , o.tracking_id
    , o.shipping_service
    , o.estimated_delivery_at AS estimated_delivery_at_utc
    , o.delivered_at AS delivered_at_utc
    , o.status AS order_status
FROM {{ ref('stg_users') }} u 
LEFT JOIN {{ ref('stg_orders')}} o       
    ON u.user_id = o.user_id
LEFT JOIN {{ ref('stg_addresses')}} a
    ON o.address_id = a.address_id
LEFT JOIN {{ ref('stg_order_items') }} i 
    ON o.order_id = i.order_id
LEFT JOIN {{ ref('stg_products') }} p
    ON i.product_id = p.product_id
LEFT JOIN {{ ref('stg_promos') }} pm     
    ON o.promo_id = pm.promo_id