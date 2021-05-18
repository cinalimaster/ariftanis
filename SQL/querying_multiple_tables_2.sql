# FULL JOIN returns all rows from both tables non matching values joins corresponding rows as NULLS

SELECT city.name, country.name
FROM city
FULL [OUTER] JOIN country ON city.country_id = country.id;

#table form is here

city                          country
  id   name   country_id          id    name
  1    paris  1                    1     france     [Matching row joins]
  2    berlin 2                    2     germany    [Matching row joins]
  3    warsaw 4                    NULL  NULL       [right side joins as NULL]
  NULL NULL   NULL                 3     iceland    [left side joins as NULL]
