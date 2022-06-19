{% test max_five_digit_zipcode(model, column_name) %}

    select
        *
    from {{ model }}
    where {{ column_name }} > 99999

{% endtest %}