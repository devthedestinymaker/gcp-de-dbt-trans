{{ config(
    materialized='table',
    alias='EmployeeDepartmentHistory_staging',
    tags=['staging']
) }}

with raw as (
  select * from {{ source('Employee_Details_raw','EmployeeDepartmentHistory_raw') }}
)

select
  {{ cast('r.BusinessEntityID','INT64') }} as BusinessEntityID,
  {{ cast('r.DepartmentID','INT64') }} as DepartmentID,
  {{ cast('r.ShiftID','INT64') }} as ShiftID,
  {{ cast('r.StartDate','DATE') }} as StartDate,
  {{ cast('r.EndDate','DATE') }} as EndDate,
  {{ cast('r.ModifiedDate','TIMESTAMP') }} as ModifiedDate,
  {{ audit_columns() }}
from raw r