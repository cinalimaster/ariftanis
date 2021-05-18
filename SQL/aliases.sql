# ALIASES -----------------------------

# Assigning "city_name" alias a selected column

SELECT name AS city_name
FROM city;

# Assigning table names "ci" as city and "co" as country and fetch city and country names

SELECT co.name, ci.name
FROM city AS ci
JOIN country AS co
ON ci.country_id = co.id
