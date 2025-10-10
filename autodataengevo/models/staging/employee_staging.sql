{{ config(
    materialized='table',
    alias='Employee_staging',
    tags=['staging']
) }}

with raw as (
  select * from {{ source('Employee_Details_raw','Employee_raw') }}
)

select
  {{ cast('r.BusinessEntityID','INT64') }} as BusinessEntityID,
  NULLIF(TRIM(r.NationalIDNumber),'') as NationalIDNumber,
  NULLIF(TRIM(r.LoginID),'') as LoginID,
  NULLIF(TRIM(r.OrganizationNode),'') as OrganizationNode,
  {{ cast('r.OrganizationLevel','INT64') }} as OrganizationLevel,
  NULLIF(TRIM(r.JobTitle),'') as JobTitle,
  {{ cast('r.BirthDate','DATE') }} as BirthDate,
  NULLIF(TRIM(r.MaritalStatus),'') as MaritalStatus,
  NULLIF(TRIM(r.Gender),'') as Gender,
  {{ cast('r.HireDate','DATE') }} as HireDate,
  {{ cast('r.SalariedFlag','BOOLEAN') }} as SalariedFlag,
  {{ cast('r.VacationHours','INT64') }} as VacationHours,
  {{ cast('r.SickLeaveHours','INT64') }} as SickLeaveHours,
  {{ cast('r.CurrentFlag','BOOLEAN') }} as CurrentFlag,
  NULLIF(TRIM(r.rowguid),'') as rowguid,
  {{ cast('r.ModifiedDate','TIMESTAMP') }} as ModifiedDate,
  {{ audit_columns() }}
from raw r