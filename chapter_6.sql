-- MOVIE_TABLE :
CREATE TABLE `movie_table` (
  `movie_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `rating` VARCHAR(5) NOT NULL,
  `category` VARCHAR(10) NOT NULL,
  `purchased` DATE NOT NULL,
  PRIMARY KEY  (`movie_id`)
);

INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('83','Big Advenure','G','family','2002-03-06');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('89','Shiny Things, The','PG','drama','2002-03-06');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('88','End of the Line','R','misc','2001-02-05');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('87','A Rat named Darcy','G','family','2003-04-19');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('86','Head First Rules','R','action','2003-04-19');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('85','Mad Clowns','R','horror','1999-11-20');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('84','Greg: The Untold Story','PG','action','2001-02-05');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('93','Potentially Habitable Planet','PG','scifi','2001-02-05');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('92','Weird Things from Space','PG','scifi','2003-04-19');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('91','Shark Bait','G','misc','1999-11-20');
INSERT INTO `movie_table` (`movie_id`,`title`,`rating`,`category`,`purchased`) VALUES ('90','Take it Back','R','comedy','2001-02-05');


-- page 239:
UPDATE movie_table SET category = 'drama' WHERE drama = 'T';
UPDATE movie_table SET category = 'comedy' WHERE comedy = 'T';
UPDATE movie_table SET category = 'action' WHERE action = 'T';
UPDATE movie_table SET category = 'horror' WHERE gore = 'T';
UPDATE movie_table SET category = 'scifi' WHERE scifi = 'T';
UPDATE movie_table SET category = 'family' WHERE for_kids = 'T';
UPDATE movie_table SET category = 'family' WHERE cartoon = 'T' AND rating = 'G';
UPDATE movie_table SET category = 'misc' WHERE cartoon = 'T' AND rating <> 'G';

-- The CASE expression combines all the UPDATE statements by checking an existing column’s value against a condition. 
-- If it meets the condition, the new column is filled with a specified value.
-- It even allows you to tell your RDBMS what to do if any records don’t meet the conditions
-- Here’s its basic syntax:
-- UPDATE my_table
-- SET new_column =
-- CASE 
-- WHEN column1 = somevalue1
-- THEN newvalue1
-- WHEN column2= somevalue2
-- THEN newvalue2
-- ELSE newvalue3
-- END;

UPDATE movie_table
SET category =
CASE  -- basically if else statements
	WHEN drama = "T" THEN "drama"
    WHEN comedy = "T" THEN "comedy"
    WHEN action = "T" THEN "action"
    WHEN gore = "T" THEN "horror"
    WHEN scifi = "T" THEN "scifi"
    WHEN for_kids = "T" THEN "family"
    WHEN cartoon = "T" THEN "family"
    ELSE "misc"
END;  -- is looking for the first 'T' to set the category for each film

UPDATE movie_table
SET category =
CASE  
	WHEN drama = "T" THEN "drama"
    WHEN comedy = "T" THEN "comedy"
    WHEN action = "T" THEN "action"
    WHEN gore = "T" THEN "horror"
    WHEN scifi = "T" THEN "scifi"
    WHEN for_kids = "T" THEN "family"
    WHEN cartoon = "T" AND rating = "G" THEN "family"
    ELSE "misc"
END; -- you can add a WHERE clause after the END keyword. The CASE will only apply to those columns that match the WHERE.

-- page 247:
UPDATE movie_table
SET category = 
CASE
	WHEN rating = "R" AND drama = "T" THEN "drama-r"
    WHEN rating = "R" AND comedy = "T" THEN "comedy-r"
    WHEN rating = "R" AND action = "T" THEN "action-r"
    WHEN rating = "R" AND gore = "T" THEN "horror-r"
    WHEN rating = "R" AND scifi = "T" THEN "scifi-r"
    WHEN rating = "G" AND category = "misc" THEN "family"
END;

UPDATE movie_table
SET category =
CASE
	WHEN category = "drama-r" THEN "drama"
    WHEN category = "comedy-r" THEN "comedy"
    WHEN category = "action-r" THEN "action"
    WHEN category = "horror-r" THEN "horror"
    WHEN category = "scifi-r" THEN "scifi"
END;

ALTER TABLE movie_table
DROP COLUMN drama,
DROP COLUMN comedy,
DROP COLUMN action,
DROP COLUMN gore,
DROP COLUMN scifi,
DROP COLUMN for_kids,
DROP COLUMN cartoon;

-- you can tell SQL to SELECT something and ORDER the data it returns BY another column from the table:
SELECT title, category
FROM movie_table
WHERE title LIKE "A%"
AND category = "family"
ORDER BY title;

-- can make it more simple to order movies from every letter and not just one at a time:
SELECT title, category
FROM movie_table
WHERE 
category = "family"
ORDER BY title;

-- you can order multiple columns in the same statement:
SELECT title, category, purchased
FROM movie_table
ORDER BY category ,purchased ;

SELECT * FROM movie_table
ORDER BY category, purchased, title;

-- to change the order of your queries:
SELECT title, purchased
FROM movie_table
ORDER BY title ASC, purchased DESC;

-- COOKIE_SALES:
CREATE TABLE cookie_sales (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(20) NOT NULL,
  sales DECIMAL(4,2) NOT NULL,
  sale_date DATE NOT NULL,
  PRIMARY KEY  (ID)
);

INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('1','Lindsey',32.02,'2007-03-12');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('2','Nicole',26.53,'2007-03-12');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('3','Britney',11.25,'2007-03-12');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('4','Ashley',18.96,'2007-03-12');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('5','Lindsey',9.16,'2007-03-11');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('6','Nicole',1.52,'2007-03-11');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('7','Britney',43.21,'2007-03-11');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('8','Ashley',8.05,'2007-03-11');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('9','Lindsey',17.62,'2007-03-10');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('10','Nicole',24.19,'2007-03-10');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('11','Britney',3.40,'2007-03-10');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('12','Ashley',15.21,'2007-03-10');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('13','Lindsey',0.00,'2007-03-09');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('14','Nicole',31.99,'2007-03-09');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('15','Britney',2.58,'2007-03-09');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('16','Ashley',0.00,'2007-03-09');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('17','Lindsey',2.34,'2007-03-08');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('18','Nicole',13.44,'2007-03-08');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('19','Britney',8.78,'2007-03-08');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('20','Ashley',26.82,'2007-03-08');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('21','Lindsey',3.71,'2007-03-07');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('22','Nicole',0.56,'2007-03-07');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('23','Britney',34.19,'2007-03-07');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('24','Ashley',7.77,'2007-03-07');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('25','Lindsey',16.23,'2007-03-06');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('26','Nicole',0.00,'2007-03-06');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('27','Britney',4.50,'2007-03-06');
INSERT INTO `cookie_sales` (`ID`,`first_name`,`sales`,`sale_date`) VALUES ('28','Ashley',19.22,'2007-03-06');

-- page 263:
SELECT first_name, sales
FROM cookie_sales
ORDER BY first_name, sales DESC;

-- the SUM function works by totaling the values in a column designated by parentheses.
SELECT SUM(sales)
FROM cookie_sales
WHERE first_name = 'Nicole';

-- can sum all the rows in one statement:
SELECT first_name , SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales) DESC;

-- can find the average as well:
SELECT first_name, AVG(sales)
FROM cookie_sales
GROUP BY first_name;

-- MAX returns the single largest sale value for each girl:
SELECT first_name, MAX(sales)
FROM cookie_sales
GROUP BY first_name;

-- MIN returns the single lowest sale value for each girl:
SELECT first_name, MIN(sales)
FROM cookie_sales
GROUP BY first_name;

-- COUNT returns the number of rows in the sale_date column. If the value is NULL, it isn’t counted.
SELECT COUNT(sale_date)
FROM cookie_sales;

SELECT first_name, COUNT(sale_date)
FROM cookie_sales
WHERE sales > 0
GROUP BY first_name;

-- distinct gives you only the unique values , so no duplicates ... like a set in python:
SELECT DISTINCT sale_date
FROM cookie_sales
ORDER BY sale_date;

SELECT COUNT(DISTINCT sale_date)
FROM cookie_sales;

-- LIMIT allows us to specify exactly how many rows we want returned from our result set.
SELECT first_name, SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales) DESC
LIMIT 2;

-- LIMIT 0,4  -- the first param is where you want to start counting from, second is how many values you want returned.

SELECT first_name, SUM(sales)
FROM cookie_sales
GROUP BY first_name
ORDER BY SUM(sales) DESC
LIMIT 1,1;