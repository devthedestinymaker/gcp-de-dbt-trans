
  
    

    create or replace table `autodataengevo`.`Employee_Details_staging_Employee_Details_staging`.`department_staging`
      
    
    

    
    OPTIONS()
    as (
      

select
    DepartmentID,
    Name,
    GroupName,
    ModifiedDate,
    current_timestamp() as inserted_at,
    current_timestamp() as updated_at
from `autodataengevo`.`Employee_Details_raw`.`Department_raw`


    );
  