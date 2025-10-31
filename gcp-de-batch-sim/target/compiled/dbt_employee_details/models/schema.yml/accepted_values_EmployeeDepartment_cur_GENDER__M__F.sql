
    
    

with all_values as (

    select
        GENDER as value_field,
        count(*) as n_records

    from `gcp-de-batch-sim-464816-476514`.`Employee_Details_cur`.`EmployeeDepartment_cur`
    group by GENDER

)

select *
from all_values
where value_field not in (
    'M','F'
)


