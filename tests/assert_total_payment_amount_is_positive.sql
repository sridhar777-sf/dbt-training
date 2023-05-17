select order_id,
sum(amount) as total_amount
from {{ref('raw_payments')}}
group by order_id
having not (total_amount>=0)