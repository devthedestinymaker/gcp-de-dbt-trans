

  create or replace view `gcp-de-batch-sim-5`.`Employee_Details_cur`.`Department_stg`
  OPTIONS()
  as SELECT
  DepartmentID,
  Name AS DepartmentName,
  GroupName
FROM `gcp-de-batch-sim-5`.`Employee_Details_stg`.`Department_stg`;

