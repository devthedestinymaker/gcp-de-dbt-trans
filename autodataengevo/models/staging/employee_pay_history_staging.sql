{{ config(
    materialized='table',
    alias='EmployeePayHistory_staging',
    tags=['staging']
) }}

with raw as (
  select * from {{ source('Employee_Details_raw','EmployeePayHistory_raw') }}
)

select
  {{ cast('r.BusinessEntityID','INT64') }} as BusinessEntityID,
  {{ cast('r.RateChangeDate','TIMESTAMP') }} as RateChangeDate,
  {{ cast('r.Rate','BIGNUMERIC') }} as Rate,
  {{ cast('r.PayFrequency','INT64') }} as PayFrequency,
  {{ cast('r.ModifiedDate','TIMESTAMP') }} as ModifiedDate,
  {{ audit_columns() }}
from raw r
