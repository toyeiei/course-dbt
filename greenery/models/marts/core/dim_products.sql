{{
    config(materialized='table')
}}

SELECT
    product_id
    , name  AS product_name
    , price AS product_price
    , inventory
FROM {{ ref('stg_products') }}