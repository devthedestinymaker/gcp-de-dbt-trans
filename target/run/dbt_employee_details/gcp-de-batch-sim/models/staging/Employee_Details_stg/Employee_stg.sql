

  create or replace view `gcp-de-batch-sim-5`.`Employee_Details_cur`.`Employee_stg`
  OPTIONS()
  as SELECT
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
FROM `gcp-de-batch-sim-5`.`Employee_Details_stg`.`Employee_stg`;

