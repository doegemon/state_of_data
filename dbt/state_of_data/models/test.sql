{{ config(materialized = 'table', alias = 'teste_config') }}


WITH test as (
    SELECT
        *
    FROM
        {{ source('state_of_data', 'sheets_state_of_data')}}
    LIMIT
        111
)
SELECT
    *
FROM
    test
