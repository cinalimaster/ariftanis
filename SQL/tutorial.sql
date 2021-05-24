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




