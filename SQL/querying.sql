# QUERYING a single table-----------------------------

# Fetch all columns from the country table

SELECT *
FROM country;


# Fetch id and name columns from the city table

SELECT id, name
FROM city;

# Fetch city names sorted by rating column in the default ASCending order

SELECT name
FROM city
ORDER BY rating [ASC];

# Fetch city names sorted by rating column in the DESCending order

SELECT name
FROM city
ORDER BY rating [DESC];
