with 

source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
        id as customer_id,
        {{ uppercase('first_name') }} as first_name,
        last_name

    from source

)

select * from renamed