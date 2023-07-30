{% set columns = adapter.get_columns_in_relation(ref('orders')) %}


SELECT
{% for column in columns -%}
    {% if column.name.startswith('total') %}
    {{ column.name.upper() }},
    {%- endif -%}
{%- endfor %}


{% set values = dbt_utils.get_column_values(table=ref('orders'), 'order_status') %}


{{ values }}