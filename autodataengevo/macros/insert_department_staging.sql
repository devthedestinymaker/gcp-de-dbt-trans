{% macro insert_department_staging() %}
    INSERT INTO `autodataengevo.Employee_Details_staging.Department_staging`
    (
      DepartmentID,
      Name,
      GroupName,
      ModifiedDate,
      inserted_at,
      updated_at
    )
    SELECT
      SAFE_CAST(DepartmentID AS INT64) AS DepartmentID,
      SAFE_CAST(Name AS STRING) AS Name,
      SAFE_CAST(GroupName AS STRING) AS GroupName,
      SAFE_CAST(ModifiedDate AS TIMESTAMP) AS ModifiedDate,
      CURRENT_TIMESTAMP() AS inserted_at,
      CURRENT_TIMESTAMP() AS updated_at
    FROM `autodataengevo.Employee_Details_raw.Department_raw`;
{% endmacro %}