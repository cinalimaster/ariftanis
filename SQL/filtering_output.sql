# FILTERING THE OUTPUT -----------------------------

#Comparison operators

# Fetch name of cities that have a rating above 3

SELECT name
FROM city
WHERE rating > 3;

# Fetch name of cities that are neighter in Berlin nor Madrid

SELECT name
from city
WHERE name != 'Berling' OR  !='Madrid'



# TEXT OPERATORS -----------------------------

# Fetch name of cities that start with a 'P' or end with a 's'

SELECT name
FROM city
WHERE name LIKE 'P%' OR '%s';


# Fetch name of cities that start with any letter followed by '_ublin' Dublin in Ireland, Lublin in Poland

SELECT name
FROM city
WHERE name LIKE '_ublin';


# Fetch name of cities that have a population between 500000 and 5000000

SELECT name
FROM city
WHERE population BETWEEN 500000 AND 5000000;


# Fetch name of cities that don't miss a rating value

SELECT name
FROM city
WHERE rating IS NOT NULL;

# Fetch name of cities are in countries with ID's: 1,4,7 and 8

SELECT name
FROM city
WHERE country_id IN (1,4,7,8);
