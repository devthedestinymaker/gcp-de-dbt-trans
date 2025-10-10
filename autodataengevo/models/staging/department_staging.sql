-- models/staging/department_staging.sql
{{ config(materialized='table') }}

SELECT
    DepartmentID,
    Name,
    GroupName,
    ModifiedDate
FROM {{ source('Employee_Details_raw', 'Department_raw') }}