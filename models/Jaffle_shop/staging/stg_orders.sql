{{ config (materialized = 'incremental' , unique_key = 'order_id') }}
select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        ETL_LOADED_TIME
    from raw.jaffle_shop.orders
{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where ETL_LOADED_TIME >= (select max(ETL_LOADED_TIME) from {{ this }})
{% endif %}
