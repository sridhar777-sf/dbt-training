select
    id as customer_id,
    first_name,
    last_name
from raw.jaffle_shop.customers
where customer_id>{{ var('CustID','20') }}
