-- page 161:
SELECT * FROM fish_info
WHERE location LIKE "%NJ";

SELECT * FROM fish_records
WHERE state = "NJ";

-- for a table to be 'normal':
-- Each row of data must contain atomic values ; and
-- Each row of data must have a unique identifier, known as a Primary Key.

-- SHOW CREATE TABLE will return a CREATE TABLE statement that can exactly recreate our table, minus any data in it:
SHOW CREATE TABLE my_contacts;
