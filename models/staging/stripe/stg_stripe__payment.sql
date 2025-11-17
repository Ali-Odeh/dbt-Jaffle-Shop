with raw_payments as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount / 100 as amount,
        created as created_at
    from {{ source('stripe', 'payment') }}
),

mapped as (
    select p.*,
        psm.description as status_description,
        pm.description as method_description,
    from raw_payments p

    left join {{ ref('payment_status_mapping') }} psm
        on p.status = psm.status

    left join {{ ref('payment_methods') }} pm
     on p.payment_method = pm.payment_method

)

select * from mapped
