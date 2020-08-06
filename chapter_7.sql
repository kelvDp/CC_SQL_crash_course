-- page 283:
SELECT * FROM my_contacts
WHERE gender = "F"
AND status = "single"
AND state = "TX"
AND seeking LIKE "%single M%"
AND birthday > "1970-08-28"
AND birthday < "1980-08-28"
AND interests LIKE "%animals%"
AND interests LIKE "%horse%"
AND interests LIKE "%movies%";

-- page 286:
SELECT * FROM my_contacts
WHERE gender = "F"
AND status = "single"
AND state = "MA"
AND seeking LIKE "%single M%"
AND birthday > "1950-03-20"
AND birthday < "1960-03-20";

-- page 287:
SELECT SUBSTRING_INDEX(interests, ",", 1) 
FROM my_contacts;

-- to search for first interest that has something to do with animals
SELECT * FROM my_contacts
WHERE gender = 'F'
AND status = 'single'
AND state='MA'
AND seeking LIKE '%single M%'
AND birthday > '1950-08-28'
AND birthday < '1960-08-28'
AND SUBSTRING_INDEX(interests, ",",1) = 'animals';

-- page 290:
-- create new columns
ALTER TABLE my_contacts
ADD COLUMN interest1 VARCHAR(20),
ADD COLUMN interest2 VARCHAR(20),
ADD COLUMN interest3 VARCHAR(20);

-- move data into new columns
UPDATE my_contacts
SET interest1 = SUBSTRING_INDEX(interests, ",", 1);

-- remove old data
UPDATE my_contacts
SET interests = TRIM(RIGHT(interests, LENGTH(interests) - LENGTH(interest1) - 1));

-- repeat
UPDATE my_contacts
SET interest2 = SUBSTRING_INDEX(interests, ",", 1);

UPDATE my_contacts
SET interests = TRIM(RIGHT(interests, LENGTH(interests) - LENGTH(interest2) - 1));

UPDATE my_contacts
SET interest3 = SUBSTRING_INDEX(interests, ",", 1);

-- can then delete empty interest column
ALTER TABLE my_contacts
DROP COLUMN interests;

-- page 291:
SELECT * FROM my_contacts
WHERE gender = "F"
AND status = "single"
AND state = "MA"
AND seeking LIKE "%single M%"
AND birthday > "1950-03-20"
AND birthday < "1960-03-20"
AND interest1 = "animals"
	OR interest1 = "trading cards"
    OR interest1 = "geocaching"
AND interest2 = "trading cards"
	OR interest2 = "animals"
    OR interest2 = "geocaching"
AND interest3 = "geocaching"
	OR interest3 = "animals"
    OR interest3 = "trading cards";
    

-- creating a table with a foreign key:
CREATE TABLE interests(
int_id INT NOT NULL AUTO_INCREMENT,
interest VARCHAR(25) NOT NULL,
contact_id INT NOT NULL,
CONSTRAINT my_contacts_contact_id_fk
PRIMARY KEY(int_id),
FOREIGN KEY(contact_id)
REFERENCES my_contacts(contact_id)
);

-- SUPER_HEROES TABLE:
CREATE TABLE `super_heroes` (
  `name` varchar(20) NOT NULL,
  `power` varchar(50) NOT NULL default '',
  `weakness` varchar(20) NOT NULL default '',
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `arch_enemy` varchar(50) NOT NULL,
  `initials` varchar(2) NOT NULL
);

INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Super Trashman','Cleans quickly','bleach','Gotham','US','Verminator','ST');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('The Broker','Makes money from nothing','','New York','US','Mister Taxman','TB');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Super Guy','Flies','birds','Metropolis','US','Super Fella','SG');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Wonder Waiter','Never forgets an order','insects','Paris','France','All You Can Eat Girl','WW');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Dirtman','Creates dust storms','bleach','Tulsa','US','Hoover','D');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Super Guy','Super strength','aluminum','Metropolis','US','Badman','SG');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Furious Woman','Gets really, really angry','','Rome','Italy','The Therapist','FW');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('The Toad','Tongue of Justice','insects','London','England','Heron','T');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Librarian','Can find anything','children','Springfield','US','Chaos Creep','L');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Goose Girl','Flies','','Minneapolis','US','The Quilter','GG');
INSERT INTO `super_heroes` (`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`) VALUES ('Stick Man','Stands in for humans','hang man','London','England','Eraserman','SM');

-- A quick way to describe a functional dependency is to write this:
-- T.x —> T.y 
-- can be read like this “in the relational table called T, column y is functionally
-- dependent on column x.”
