{{
    config(materialized='table')
}}

SELECT 
    user_id
    , first_name
    , last_name
    , email
    , phone_number
    , zipcode
    , state
    , country
    , order_id
    , created_at_utc
    , product_name
    , product_price
    , product_quantity
    , order_cost
    , shipping_cost
    , order_total
    , promo_discount
    , tracking_id
    , shipping_service
    , estimated_delivery_at_utc
    , delivered_at_utc
    , order_status
FROM {{ ref('int_po_users_joined') }}