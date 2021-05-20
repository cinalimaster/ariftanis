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

# CROSS JOIN returns all possible combinations of rows from both tables. Two syntaxes are available 

SELECT city.name, country.name
FROM city
CROSS JOIN country;

#or

SELECT city.name, country.name
FROM city, country;

# NATURAL JOIN will joins tables by all columns with the same name

SELECT city.name, country.name
FROM city
NATURAL JOIN country;


#table form is here

city                              country
  country_id    id    name         name         id
  6             6     san marino   san marino   6
  7             7     vatikan city vatikan city 7
  5             9     greece       greece       9
  10            11    monaco       monaco       10
  
# this type of joining tables very rarely used in practice
