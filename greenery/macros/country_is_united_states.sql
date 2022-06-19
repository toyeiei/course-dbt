{% test country_is_united_states(model, column_name) %}

    select
        *
    from {{ model }}
    where {{ column_name }} != 'United States'

{% endtest %}