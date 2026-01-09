with source as (

    select
        customer_id,
        full_name,
        email,
        created_at
    from {{ source('raw', 'customers') }}

),

renamed as (

    select
        customer_id            as customer_id,
        full_name              as customer_name,
        lower(email)           as email,
        created_at             as customer_created_at
    from source

)

select * from renamed
