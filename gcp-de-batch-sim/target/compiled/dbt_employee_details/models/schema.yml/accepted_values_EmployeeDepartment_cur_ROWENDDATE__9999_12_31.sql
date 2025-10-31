
    
    

with all_values as (

    select
        ROWENDDATE as value_field,
        count(*) as n_records

    from `gcp-de-batch-sim-464816-476514`.`Employee_Details_cur`.`EmployeeDepartment_cur`
    group by ROWENDDATE

)

select *
from all_values
where value_field not in (
    '9999-12-31'
)


