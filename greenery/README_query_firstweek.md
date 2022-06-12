# READ ME DOC 

## first week assignment of dbt greenery project - corise

1. how many users do we have? 

```
/* we found 130 user ids in users table */
SELECT 
    COUNT(user_id) 
FROM dbt_kasidis_s.stg_users;
```

2. on average, how many orders do we receive per hour?

```
/* 15.04 orders per hour */
SELECT 
  AVG(count_orders) AS "avg_order_per_hour"
FROM (
  SELECT
    EXTRACT(HOUR from created_at) AS "hours",
    COUNT(order_id) AS "count_orders"
  FROM dbt_kasidis_s.stg_orders
  GROUP BY 1
  ORDER BY 1
) sub;
```

3. on average, how long does an order take from being placed to being delivered?

```
/* average 3.89 days */
SELECT 
  AVG(DATE_PART('day', delivered_at - created_at)) AS "avg_days"
FROM dbt_kasidis_s.stg_orders 
WHERE delivered_at IS NOT NULL;
```

4. how many users have only made one purchase? two purchases? three+ purchases?

```
/* 25 one purchase, 28 two purchases, 71 three or more purchases */
SELECT 
  CASE 
    WHEN n = 1 THEN 'one purchase'
    WHEN n = 2 THEN 'two purchases'
    WHEN n >= 3 THEN 'three or more purchases'
  END "flag",
  COUNT(*) n
FROM (
  SELECT 
    user_id,
    COUNT(DISTINCT order_id) AS n
  FROM dbt_kasidis_s.stg_orders
  GROUP BY 1
) sub
GROUP BY 1;
```

5. on average, how many unique sessions do we have per hour?

```
/* 39.45 unique session per hour */
SELECT 
  AVG(count_sessions) AS avg_session_per_hour 
FROM (
  SELECT 
    EXTRACT(HOUR FROM created_at) "hours"
    , COUNT(DISTINCT session_id) "count_sessions"
  FROM dbt_kasidis_s.stg_events
  GROUP BY 1
  ORDER BY 1
) sub;
```
