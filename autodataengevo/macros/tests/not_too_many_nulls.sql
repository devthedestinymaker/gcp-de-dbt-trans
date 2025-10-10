{% test not_too_many_nulls(model, column_name, threshold_fraction=0.1) %}
with total as (
  select count(1) as cnt from {{ model }}
),
nulls as (
  select count(1) as cnt from {{ model }} where {{ column_name }} is null
)
select
  case when (nulls.cnt / total.cnt) <= {{ threshold_fraction }} then 0 else 1 end as failures
from total cross join nulls
{% endtest %}