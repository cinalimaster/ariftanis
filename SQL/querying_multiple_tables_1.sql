# INNER JOIN

# JOIN (or explicitly INNER JOIN) returns rows that have matching values in both tables

SELECT city.name, country.name
FROM city
[INNER] JOIN country ON city.country_id=country_id;


#table form is here

city                          country
  id   name   country_id          id    name
  1    paris  1                    1     france     [Matching row joins]
  2    berlin 2                    2     germany    [Matching row joins]
  3    warsaw 4                    3     turkey
  
  
#LEFT JOIN returns all rows from the left table with corresponding rows from the right table. If there is no matching row, NULLS are returned as values from the second table
  
SELECT city.name, country.name
FROM city
LEFT JOIN country ON city.country_id=country.id;
  
#table form is here

city                          country
  id   name   country_id          id    name
  1    paris  1                    1     france     [Matching row joins]
  2    berlin 2                    2     germany    [Matching row joins]
  3    warsaw 4                    NULL  NULL       [Empty right row joins as NULL]
  
#RIGHT JOIN returns all rows from the right table with corresponding rows from the left table. If there is no matching row, NULLS are returned as values from the second table
  
SELECT city.name, country.name
FROM city
RIGHT JOIN country ON city.country_id=country.id;
  
#table form is here

city                          country
  id   name   country_id          id    name
  1    paris  1                    1     france     [Matching row joins]
  2    berlin 2                    2     germany    [Matching row joins]
  3    NULL   NULL                 3     iceland    [Empty left row joins as NULL]
  
  
