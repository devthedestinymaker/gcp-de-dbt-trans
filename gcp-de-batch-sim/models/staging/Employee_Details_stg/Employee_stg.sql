SELECT
  BusinessEntityID,
  LoginID,
  NationalIDNumber,
  JobTitle,
  BirthDate,
  Gender,
  HireDate,
  SalariedFlag,
  VacationHours,
  SickLeaveHours,
  CurrentFlag,
  DepartmentID
FROM {{ source('Employee_Details_stg', 'Employee_stg') }}