with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

order_payments as (
    select
        orderid as order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

final as (
    select
        orders.id as order_id,
        orders.user_id as customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments on order_payments.order_id = orders.id
)

select * from final