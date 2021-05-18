# AGGREGETION AND GROUPING

# GROUP BY groups together rows of that the same values in specified columns
# It computes summeries (aggregates) for each unique combination of values

# Sample Table

city
	id	name		country_id
	1	paris		1
	101	marsille	1
	102	lyon		1
	2	berlin		2
	103	hamburg		2
	104	munich		2
	3	warsaw		4
	105	cracow		4

# ----turns into----

city
	country_id	count
	1		3
	2		3
	3		2

# AGGREGATE FUNCTIONS

avg(expr)  <--- expr='expression'
count(expr)
max(expr)
min(expr)
sum(expr)

# EXAMPLE QUERIES 

# Find out the number of cities

SELECT COUNT(*)
FROM city;

# Find out the number of cities with non_null ratings

SELECT COUNT(rating)
FROM city
WHERE rating IS NOT NULL;

# Find out the number of distinctive country values

SELECT COUNT(DISTINCT country_id)
FROM city;

# Find out lowest and highest population country names

SELECT MIN(population), MAX(population)
FROM country;

# Find out total population of cities in respective countries

SELECT country_id, SUM(population)
FROM city
GROUP BY country_id;

# Find out the average rating for cities in respective countries if the average is above 3

SELECT country_id, AVG(rating)
FROM city
GROUP BY country_id HAVING AVG(rating) > 3;
