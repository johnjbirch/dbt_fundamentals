with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from jaffle_shop.customers

)

select * from {{source('jaffle_shop', 'customers')}}