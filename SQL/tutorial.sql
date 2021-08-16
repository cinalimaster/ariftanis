-- this file is written for educational purposes
/* another 
comment */

CREATE DATABASE test; -- we create a database named test
DROP DATABASE test; -- we drop (delete) database named test
CREATE DATABASE record_company -- we create a database named record_company
USE record_company; -- code under this will apply on record_company
  CREATE TABLE test(    -- we create a table named test
    test_column INT       -- we create a column in test table which contains integer numbers
);

ALTER TABLE test -- we altering/changing table named test
  ADD another_column VARCHAR(255);  -- we add a new column named another_column which can contain 255 character long input

DROP TABLE test; -- we drop (delete) table named test

CREATE DATABASE record_company;   -- we create a database named record_company
USE record_company; -- code under this will apply on record_company
CREATE TABLE band (
    id INT NOT NULL AUTO INCREMENT,   -- index column called id consists integer numbers and auto icrements 1,2,3,4...
    name VARCHAR(255) NOT NULL,   -- name column consists 255 character input also can not be empty
    PRIMERY KEY(id)   -- our index primary column is id column
);

CREATE TABLE albums(   -- we create new table named albums
    id INT NOT NULL AUTO INCREMENT,   -- index column called id consists integer numbers and auto icrements 1,2,3,4...
    name VARCHAR(255) NOT NULL,   -- name column consists 255 character input also can not be empty
    release_year INT,   -- column named release_year consists integer numbers
    band_id INT NOT NULL   -- column named band_id integer and can not be empty
    PRIMERY KEY(id)   -- our index primary column is id column
    FOREIGN KEY (band_id) REFERENCES band(id) -- we assigned a key index from another table which will be matching
);

INSERT INTO bands (name) -- we insert data to name column into bands database
VALUES ('Iron Maiden'); -- an entry value
INSERT INTO bands (name) -- we insert data to name column into bands database
VALUES ('Deuce'),('Avenged Sevenfold'),('Ankor') -- we input multiple entries

SELECT * FROM bands; -- we access (show/call) everything from bands bands table
SELECT * FROM bands LIMIT 2;  -- we access  only first 2 rows from bands bands table

SELECT name FROM bands; -- we select name colum from bands table
SELECT id AS 'ID', name AS 'Band Name' FROM bands; -- we select id and name columns from bands table and assign them a new column names

SELECT * FROM bands ORDER BY name; -- we select name colum from bands table and and order by name alphabetically
INSERT INTO albums (name, release_year, band_id)
VALUES  ('The Number of the Beast', '1985', '1'),
        ('Power Slave', '2018', '2'),
        ('Nightmare', '2018', '2'),
        ('Nightmare', '2010', '3'),
        ('Test album', 'NULL', '3');
        
SELECT * FROM album; -- select everything from albums

SELECT name FROM albums; -- select only name column from albums

SELECT DISTINCT name FROM albums; -- select only name column from albums and don't show repeating values

UPDATE albums
SET release_year = 1982
WHERE id = 1;  
/*we update table and assign new release_year value as 1982 
where id number equals 1 'The Number of the Beast'...row */

SELECT * FROM albums
WHERE release_year < 2000; -- display only albums release_year lower than 2000

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2;  -- display only albums name column value includes ..er.. or band_id = 2 

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1 -- display rows only release_year = 1 and band_id=1

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018 --display rows only release_year between 2000<->2018

SELECT * FROM albums
WHERE release_year IS NULL; --display rows only release_year is empty

DELETE FROM albums WHERE id = 5; -- delete id row 5

SELECT * FROM albums; -- check rows row 5 is deleted

SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id -- we join albums table and bands table with matching bonds.id=albums.band_id (unmatching rows excluded)

SELECT * FROM bands
INNER JOIN albums ON bands.id = albums.band_id -- INNER JOIN returns only both side matching rows (unmatching rows excluded)

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id -- LEFT JOIN returns all left side matching rows (rightside unmatching rows returns NULL)

SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.band_id -- RIGHT JOIN returns all right side matching rows (leftside unmatching rows returns NULL)

SELECT AVG(release_year) FROM albums; -- shows average release_year (float) from albums table

SELECT SUM(release_year) FROM albums; -- shows sum of release_year (float) from albums table

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id; -- count band_id and show how many band id and display by band_id

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM band AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;
/* counts number of albums for each every band_name
band_name     num_albums
Iron Maiden   2
Deuce         1
Avenged Sev.. 1
Anker         0
*/

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM band AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE num_albums
GROUP BY b.id
HAVING num_albums =1;
/* counts number of albums for each every band_name (shows only album_number is equal to 1)
band_name     num_albums
Deuce         1
Avenged Sev.. 1
*/

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM band AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name = 'Deuce'
GROUP BY b.id
HAVING num_albums =1;
/* counts number of albums for each band_name='Deuce' (shows only album_number is equal to 1)
band_name     num_albums
Deuce         1
*/

/* THIS IS FROM ANOTHER TUTORIAL MAIN SELECT QUERY */
/* 
https://raw.githubusercontent.com/socratica/sql/master/earthquake.csv */

SELECT *  /* SELECT column1, columN2, ... */
FROM earthquake  /* FROM table1 */
WHERE occured_on >= '2010-01-01' AND occured_on <= '2010-12-31'   /* WHERE condition1, AND condition2, ... */
ORDER BY magnitude DESC  /* ORDER BY columni (ASC | DESC) */
LIMIT 1;  /* LIMIT n;  number of rows   */




/* 1. Retrieving Data From All Columns */

SELECT *
FROM animal;
/* 2. Retrieving Data From Certain Columns */

SELECT id, name
FROM animal;
/* 3. Filtering Data Using WHERE Clause */

SELECT id, name, age
FROM animal
WHERE age>=2;
/* 4. Filtering Data Using Conditions Joined by AND Operator */

SELECT id, name, age 
FROM animal
WHERE age >= 2 AND name = 'dog';
/* 5. Filtering Data Using Conditions Joined by OR Operator */

SELECT id, name, age 
FROM animal
WHERE age >= 2 OR name = 'dog';
/* 6. Using DISTINCT to Retrieve Non-Repeated Records */

SELECT DISTINCT name, color
FROM clothing;
/* 7. Retrieving Data Without NULL in a Certain Column */

SELECT name, color
FROM clothing
WHERE color IS NOT NULL;
/* 8. Sorting Data According to One Column */

SELECT id, name
FROM animal
ORDER BY name;
/* 9. Sorting Data According to More Than One Column */

SELECT id, name
FROM animal
ORDER BY name DESC, id;
/* 10. Searching for Values Matching a Certain Pattern */

SELECT id, name
FROM animal
WHERE name LIKE '%e%';
/* 11. Joining Values From Text Columns Into One String */

SELECT CONCAT(category, ' ', name) 
FROM tab;
/* 12. Using Mathematical Operators */

SELECT price - discount
FROM product;
/* 13. Adding Data From Different Tables */

SELECT last_name FROM customer
UNION ALL
SELECT last_name FROM employee;
/* 14. Finding the Intersection of Sets of Data */

SELECT last_name FROM customer
INTERSECT
SELECT last_name FROM employee;

/* 15. Joining Data From Different Tables */

SELECT customer.last_name, city.name
FROM customer
INNER JOIN city 
  ON customer.id = city.customer_id;

/* 16. Using Aliases of Tables and Columns */

SELECT c.last_name AS lname, t.name AS city
FROM customer AS c
INNER JOIN city AS t
  ON c.id = t.customer_id;

/* 17. Counting the Number of Rows in a Table */

SELECT COUNT(id)
FROM product;

/* 18. Calculating the Average of the Values in a Column */

SELECT AVG(price)
FROM product;

/* 19. Calculating the Sum of the Values in a Column */

SELECT SUM(price)
FROM product;

/* 20. Finding the Minimum Value in a Column */

SELECT MIN(price)
FROM product;

/* 21. Finding the Maximum Value in a Column */

SELECT MAX(price)
FROM product;

/* 22. Calculating the Aggregate Value for Groups of Records */

SELECT category, COUNT(id)
FROM product
GROUP BY category;

/* 23. Filtering Rows Using Aggregate Functions */

SELECT category, AVG(price)
FROM product
GROUP BY category
HAVING AVG(price) < 56.50;

/* 24. Removing Data From a Table */

DELETE FROM product;

/* 25. Removing Records Meeting a Certain Condition From a Table */

DELETE FROM product
WHERE id = 5;

/* 26. Inserting Data Into a Table */

INSERT INTO product(id, name, category) 
VALUES(25, 'sofa', 'furniture');

/* 27. Updating a Column in a Table */

UPDATE product SET company = 'ABC';

/* 28. Updating a Column by Filtering Records */

UPDATE product
SET name = 'armchair'
WHERE id = 25;

/* 29. Creating a Table */

CREATE TABLE tab(id int, name varchar(50));

/* 30. Deleting a Table */

DROP TABLE tab;


/* JOINING TABLES */

SELECT *
FROM martian
INNER JOIN base
ON martian.base_id = base.base_id;

SELECT martian.martian_id, base.base_id, base.base_name
FROM martian
INNER JOIN base
ON martian.base_id = base.base_id;

SELECT column1, column2, ...
FROM martian
(INNER / RIGHT / LEFT / FULL) JOIN base
ON martian.base_id = base.base_id
WHERE condition(s)
ORDER BY value



