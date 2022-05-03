
with payments as (

    select
        id as payment_id,
        orderid as order_id,
        status,
        amount/100 as amount,
        created as created_at
    from stripe.payment

)

select * from {{source('stripe', 'payment')}}