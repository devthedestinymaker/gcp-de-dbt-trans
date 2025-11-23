

WITH employee AS (
    SELECT
        CAST(BusinessEntityID AS INT64) AS BusinessEntityID,
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
        CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS EmployeeModifiedDate,
        DepartmentID
    FROM `gcp-de-batch-sim-5`.`Employee_Details_stg`.`Employee_stg`
),

department AS (
    SELECT
        DepartmentID,
        Name AS DepartmentName,
        GroupName
    FROM `gcp-de-batch-sim-5`.`Employee_Details_stg`.`Department_stg`
)

SELECT
    e.BusinessEntityID,
    e.LoginID,
    e.NationalIDNumber,
    e.JobTitle,
    e.BirthDate,
    e.Gender,
    e.HireDate,
    e.SalariedFlag,
    e.VacationHours,
    e.SickLeaveHours,
    e.CurrentFlag,
    e.EmployeeModifiedDate,
    CAST(e.DepartmentID AS INT64) AS DepartmentID,
    d.DepartmentName,
    d.GroupName,
    CURRENT_TIMESTAMP() AS CurationIngestionTime,
    CURRENT_DATE() AS RowStartDate,
    DATE '9999-12-31' AS RowEndDate
FROM employee e
LEFT JOIN department d
  ON CAST(e.DepartmentID AS INT64)= d.DepartmentID