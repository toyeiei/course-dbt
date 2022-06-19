SELECT 
    user_id
    , COUNT(DISTINCT order_id) 
FROM {{ ref('fact_orders') }}
GROUP BY 1 
HAVING NOT(COUNT(DISTINCT order_id) >= 0)