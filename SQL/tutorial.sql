# this file is written for educational purposes

CREATE DATABASE test; # we create a database named test
DROP DATABASE test; # we drop (delete) database named test
CREATE DATABASE record_company # we create a database named record_company
USE record_company; # code under this will apply on record_company
  CREATE TABLE test(    # we create a table named test
    test_column INT       # we create a column in test table which contains integer numbers
);

ALTER TABLE test # we altering/changing table named test
  ADD another_column VARCHAR(255);  # we add a new column named another_column which can contain 255 character long input

DROP TABLE test; # we drop (delete) table named test

CREATE DATABASE record_company;   # we create a database named record_company
USE record_company; # code under this will apply on record_company
CREATE TABLE band (
    id INT NOT NULL AUTO INCREMENT,   # index column called id consists integer numbers and auto icrements 1,2,3,4...
    name VARCHAR(255) NOT NULL,   # name column consists 255 character input also can not be empty
    PRIMERY KEY(id)   # our index primary column is id column
);

CREATE TABLE albums(   # we create new table named albums
    id INT NOT NULL AUTO INCREMENT,   # index column called id consists integer numbers and auto icrements 1,2,3,4...
    name VARCHAR(255) NOT NULL,   # name column consists 255 character input also can not be empty
    release_year INT,   # column named release_year consists integer numbers
    band_id INT NOT NULL   # column named band_id integer and can not be empty
    PRIMERY KEY(id)   # our index primary column is id column
    FOREIGN KEY (band_id) REFERENCES band(id) # we assigned a key index from another table which will be matching
);

INSERT INTO bands (name) # we insert data to name column into bands database
VALUES ('Iron Maiden'); # an entry value
INSERT INTO bands (name) # we insert data to name column into bands database
VALUES ('Deuce'),('Avenged Sevenfold'),('Ankor') # we input multiple entries

SELECT * FROM bands; # we access (show/call) everything from bands bands table
SELECT * FROM bands LIMIT 2;  # we access  only first 2 rows from bands bands table
