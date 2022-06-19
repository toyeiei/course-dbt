## Second week assignment of dbt greenery project - corise

1. What is our user repeat rate?

```
-- repeate rate = 76.15%
SELECT 
  COUNT(*) / 
  (SELECT CAST(COUNT(*) AS decimal) FROM dbt_kasidis_s.stg_users) * 100 
  AS repeat_rate
FROM (
  SELECT 
    user_id, 
    COUNT(DISTINCT order_id)
  FROM dbt_kasidis_s.stg_orders
  GROUP BY 1
  HAVING COUNT(DISTINCT order_id) >= 2
) sub;
```

2.  Good indicators of a user who will likely purchase again?

- how often he/she visits our website
- RFM model used in marketing
    - recency
    - frequency
    - monetary value 
- I plan to create a cross-tab table to see user profiles e.g. users who purchased 0,1,2,3,4,5+ orders then compare the profiles for marketing insights

3. Explain the marts models you added.

- Core: I create fact_orders table and three dim tables. The `fact_orders` table joined multiple tables including users, orders, promos, addresses to see high level order details 
- Marketing: the `fact_user_orders` combined data froms users, orders, order items, products to form a holistic table for our marketing teams. I also add more details about users and their address incl. zipcode, country etc.
- Product: the `fact_page_views` table came directly from `stg_events` table

I use intermediate tables in Core and Marketing marts.

4. Image of DAG full lineage is in the greenery/img_dag folder

5. Added tests to ensure high quality data in our data marts

- We can run tests every morning and set alerts to our discord/ slack channel so that our analytics engineering team can monitor and solve any issues beginning of the day. Using `dbt build` or `dbt run` + `dbt test` every time.

Some tests in my project
- positive_values
- max_five_digit_zipcode
- country_is_united_states
- assert_orders_by_user_is_positive (singular test)