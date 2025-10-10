{% macro cast(column, target_type, fmt=None) -%}
  {# 
    Generic safe cast macro.
    column: pass as a string like 'r.DepartmentID'  (note quotes when calling)
    target_type: 'INT64' / 'INTEGER' / 'DATE' / 'TIMESTAMP' / 'BOOLEAN' / 'BIGNUMERIC' / 'STRING'
    fmt: optional format for PARSE_DATE / PARSE_TIMESTAMP (BigQuery format strings)
  #}

  {% set c = column %}
  {% set t = target_type | upper %}

  {% if t in ['INT','INT64','INTEGER'] %}
    SAFE_CAST(NULLIF(TRIM({{ c }}),'') AS INT64)

  {% elif t in ['BIGNUMERIC','NUMERIC','DECIMAL'] %}
    SAFE_CAST(NULLIF(TRIM({{ c }}),'') AS BIGNUMERIC)

  {% elif t == 'DATE' %}
    {# Prefer SAFE.PARSE_DATE with explicit format if provided, otherwise assume ISO YYYY-MM-DD #}
    {% if fmt %}
      SAFE.PARSE_DATE('{{ fmt }}', NULLIF(TRIM({{ c }}),''))
    {% else %}
      SAFE.PARSE_DATE('%Y-%m-%d', NULLIF(TRIM({{ c }}),''))
    {% endif %}

  {% elif t == 'TIMESTAMP' %}
    {% if fmt %}
      SAFE.PARSE_TIMESTAMP('{{ fmt }}', NULLIF(TRIM({{ c }}),''))
    {% else %}
      -- Try ISO-like timestamp. You may customize per column in the model if needed.
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%E*S', NULLIF(TRIM({{ c }}),''))
    {% endif %}

  {% elif t == 'BOOLEAN' %}
    CASE
      WHEN LOWER(TRIM({{ c }})) IN ('1','true','t','yes','y') THEN TRUE
      WHEN LOWER(TRIM({{ c }})) IN ('0','false','f','no','n') THEN FALSE
      ELSE NULL
    END

  {% else %}
    -- Default: return trimmed string or NULL for empty strings
    NULLIF(TRIM({{ c }}),'')
  {% endif %}
{%- endmacro %}