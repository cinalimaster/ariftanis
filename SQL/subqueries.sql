# SINGLE VALUE

# Simplest subquery returns exactly one column and one row

# This query finds cities with the same rating as Paris

SELECT name 
FROM city
WHERE rating =(
  SELECT rating
  FROM city
  WHERE name='Paris'
);

#commonly used operators = < > <= >=

# MULTIPLE VALUES

# commonly used operators IN EXISTS ALL ANY

# This query finds cities in countries that have population above 20000000

SELECT name
FROM city
WHERE country_id IN (
  SELECT country_id
  FROM country
  WHERE population > 20000000
);

# CORRELATED QUERY a type of query depends on other query
# This query finds cities with population greater than the average population in the country

SELECT *
FROM city main_city
WHERE population > (
  SELECT AVG(population)
  FROM city average_city
  WHERE average_city.country_id = main_city.country_id
);

# This query finds countries that have at least on city

SELECT name
FROM country
WHERE EXISTS (
  SELECT *
  FROM city
  WHERE country_id=country.id
);
