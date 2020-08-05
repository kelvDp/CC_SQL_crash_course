-- page 199:
ALTER TABLE my_contacts
ADD COLUMN phone_number CHAR(10) NOT NULL
AFTER first_name;

-- CHANGE both the name and data type of an existing column *
-- MODIFY the data type or position of an existing column *
-- ADD a column to your table—you pick the data type
-- DROP a column from your table *
-- * Possible loss of data may occur

-- PROJECTS TABLE:
CREATE TABLE `projekts` (
  `number` INT(11) NOT NULL DEFAULT '0',
  `descriptionofproj` VARCHAR(50) DEFAULT NULL,
  `contractoronjob` VARCHAR(10) DEFAULT NULL
);

INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('1','outside house painting','Murphy');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('2','kitchen remodel','Valdez');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('3','wood floor installation','Keller');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('4','roofing','Jackson');

-- this is how you would change table name:
ALTER TABLE projekts
RENAME TO project_list;

-- how to change a column name and data type:
ALTER TABLE project_list
CHANGE number proj_id INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY(proj_id);

-- change 2 columns with one statement:
ALTER TABLE project_list
CHANGE COLUMN descriptionofproj proj_desc VARCHAR(100),
CHANGE COLUMN contractoronjob con_name VARCHAR(30);

-- if you only want to change the data type and not the name:
ALTER TABLE project_list
MODIFY COLUMN proj_desc VARCHAR(120);

-- page 213:
ALTER TABLE project_list
ADD COLUMN phone_nr CHAR(10) NOT NULL,
ADD COLUMN start_date DATE NOT NULL,
ADD COLUMN est_cost DEC(6,2) NOT NULL;

-- how to drop a column if not being used:
ALTER TABLE project_list
DROP COLUMN start_date;

-- HOOPTIE TABLE:
CREATE TABLE `hooptie` (
  `color` VARCHAR(20) DEFAULT NULL,
  `year` VARCHAR(4) DEFAULT NULL,
  `make` VARCHAR(20) DEFAULT NULL,
  `mo` VARCHAR(20) DEFAULT NULL,
  `howmuch` FLOAT(10,3) DEFAULT NULL
);

INSERT INTO `hooptie` (`color`,`year`,`make`,`mo`,`howmuch`) VALUES ('silver','1998','Porsche','Boxter','17992.539');
INSERT INTO `hooptie` (`color`,`year`,`make`,`mo`,`howmuch`) VALUES (NULL,'2000','Jaguar','XJ','15995.000');
INSERT INTO `hooptie` (`color`,`year`,`make`,`mo`,`howmuch`) VALUES ('red','2002','Cadillac','Escalade','40215.898');

-- page 217:
ALTER TABLE hooptie
RENAME TO car_table,
ADD COLUMN car_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY(car_id),
ADD COLUMN VIN VARCHAR(25) AFTER car_id,
CHANGE COLUMN mo model VARCHAR(20),
CHANGE COLUMN howmuch price FLOAT(7,3);

-- page 223:
ALTER TABLE my_contacts
ADD COLUMN city VARCHAR(50),
ADD COLUMN state CHAR(2);

-- To SELECT the last two characters:
SELECT RIGHT(location, 2) -- first arg is the column you want, the second arg is how many characters you want from right/left 
FROM my_contacts;

-- To SELECT everything in front of the comma:
SELECT SUBSTRING_INDEX(location, ",", 1)  -- forst arg is column, second is the stopping point, third is which stopping point.
FROM my_contacts;

-- SUBSTRING(your_string, start_position, length) gives you part of your_string,
-- starting at the letter in the start_position. length is how much of the string you get back.
SELECT SUBSTRING("San Antonio, TX", 5, 3);

-- UPPER(your_string) and LOWER(your_string) will change everything in the string to
-- uppercase or lowercase, respectively.
SELECT UPPER('uSa');
SELECT LOWER('spaGHEtti');

-- REVERSE(your_string) does just that; it reverses the order of letters in your string.
SELECT REVERSE('spaGHEtti');

-- LTRIM(your_string) and RTRIM(your_string) returns your string with extra spaces removed
-- from before (to the left of) or after (to the right of) a string.
SELECT LTRIM(' dogfood ');
SELECT RTRIM(' catfood ');

-- LENGTH(your_string) returns a count of how many characters are in your string.
SELECT LENGTH('San Antonio, TX ');

-- syntax for changing the value of every
-- row in a column. In place of newvalue, you can put a value or another column name. basically a for loop
update my_contacts
set state = right(location, 2);

