-- back compat for old kwarg name
  
  
        
            
	    
	    
            
        
    

    

    merge into `gcp-de-batch-sim-5`.`Employee_Details_cur`.`EmployeeDepartment_cur` as DBT_INTERNAL_DEST
        using (

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
        ) as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.BusinessEntityID = DBT_INTERNAL_DEST.BusinessEntityID))

    
    when matched then update set
        `BusinessEntityID` = DBT_INTERNAL_SOURCE.`BusinessEntityID`,`LoginID` = DBT_INTERNAL_SOURCE.`LoginID`,`NationalIDNumber` = DBT_INTERNAL_SOURCE.`NationalIDNumber`,`JobTitle` = DBT_INTERNAL_SOURCE.`JobTitle`,`BirthDate` = DBT_INTERNAL_SOURCE.`BirthDate`,`Gender` = DBT_INTERNAL_SOURCE.`Gender`,`HireDate` = DBT_INTERNAL_SOURCE.`HireDate`,`SalariedFlag` = DBT_INTERNAL_SOURCE.`SalariedFlag`,`VacationHours` = DBT_INTERNAL_SOURCE.`VacationHours`,`SickLeaveHours` = DBT_INTERNAL_SOURCE.`SickLeaveHours`,`CurrentFlag` = DBT_INTERNAL_SOURCE.`CurrentFlag`,`EmployeeModifiedDate` = DBT_INTERNAL_SOURCE.`EmployeeModifiedDate`,`DepartmentID` = DBT_INTERNAL_SOURCE.`DepartmentID`,`DepartmentName` = DBT_INTERNAL_SOURCE.`DepartmentName`,`GroupName` = DBT_INTERNAL_SOURCE.`GroupName`,`CurationIngestionTime` = DBT_INTERNAL_SOURCE.`CurationIngestionTime`,`RowStartDate` = DBT_INTERNAL_SOURCE.`RowStartDate`,`RowEndDate` = DBT_INTERNAL_SOURCE.`RowEndDate`
    

    when not matched then insert
        (`BusinessEntityID`, `LoginID`, `NationalIDNumber`, `JobTitle`, `BirthDate`, `Gender`, `HireDate`, `SalariedFlag`, `VacationHours`, `SickLeaveHours`, `CurrentFlag`, `EmployeeModifiedDate`, `DepartmentID`, `DepartmentName`, `GroupName`, `CurationIngestionTime`, `RowStartDate`, `RowEndDate`)
    values
        (`BusinessEntityID`, `LoginID`, `NationalIDNumber`, `JobTitle`, `BirthDate`, `Gender`, `HireDate`, `SalariedFlag`, `VacationHours`, `SickLeaveHours`, `CurrentFlag`, `EmployeeModifiedDate`, `DepartmentID`, `DepartmentName`, `GroupName`, `CurationIngestionTime`, `RowStartDate`, `RowEndDate`)


    