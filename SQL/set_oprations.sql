# SET OPERATIONS 
# combines tow or more query result into a single result.
# The combined queries must return the same number of columns and compatible data types.
# The names of the corresponding columns can be different.

cycling                       skating
id    name    country         id     name     country
1     yk      de              1      yk       de
2     zg      de              2      df       de
3     wt      pl              3      ak       pl
...   ...     ...             ...    ...      ...

# UNION
# combines and remove duplicates
# UNION ALL
# combines and keeps duplicates

# This query lists german cyclists with german skaters

SELECT name
FROM cycling
WHERE country = 'de'
UNION #or you can use UNION ALL to keep duplicates
SELECT name
FROM skating
WHERE country = 'de';

# this process is similar in math set A ∪ B

# INTERSECT

# Returns only rows that appear in both results sets

# This query displays german cyclists who are also german skaters at the same time 

SELECT name
FROM cycling
WHERE country = 'de'
INTERSECT
SELECT NAME
FROM skating
WHERE country = 'pl';

# this process is similar in math set A ∩ B 

# EXCEPT

# returns only the rows appear in the first but don't appear in the second table/db
# This query displays german cyclists unless they are not german scooters at the same time

SELECT name
FROM cycling
WHERE country= 'de'
EXCEPT
SELECT name
FROM skating
WHERE country='de'

# this process is similar in math set A \ B 

