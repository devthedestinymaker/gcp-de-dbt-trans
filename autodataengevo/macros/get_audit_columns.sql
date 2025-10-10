{% macro audit_columns() -%}
  CURRENT_TIMESTAMP() AS stagingIngestionTime,
  CURRENT_DATE() AS LoadDate
{%- endmacro %}