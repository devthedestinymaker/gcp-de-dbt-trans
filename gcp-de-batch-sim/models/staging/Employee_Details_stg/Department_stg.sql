SELECT
  DepartmentID,
  Name AS DepartmentName,
  GroupName
FROM {{ source('Employee_Details_stg', 'Department_stg') }}