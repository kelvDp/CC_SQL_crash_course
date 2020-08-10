-- page 345:
SELECT status 
FROM my_contacts
GROUP BY status
ORDER BY status;

SELECT profession
FROM my_contacts
GROUP BY profession
ORDER BY profession;

SELECT interest1,interest2,interest3
FROM my_contacts
GROUP BY interest1
ORDER BY interest1,interest2,interest3;

SELECT seeking
FROM my_contacts
GROUP BY seeking
ORDER BY seeking;

-- ------------------------------------------------------------------------
-- another way to remove data from a column that you moved to another:
UPDATE my_contacts
SET interests = SUBSTR(interests, LENGTH(interest1)+2 );
-- ------------------------------------------------------------------------
-- page 350:  --> work from prev chapter
UPDATE my_contacts SET
interest1 = SUBSTRING_INDEX(interests, ",", 1),
interests = SUBSTR(interests, LENGTH(interest1) + 2),
interest2 = SUBSTRING_INDEX(interests, ",", 1),
interests = SUBSTR(interests, LENGTH(interest2) + 2),
interest3 = SUBSTRING_INDEX(interests, ",", 1),
interests = SUBSTR(interests, LENGTH(interest3) + 2),
interest4 = interests;
-- ------------------------------------------------------------------------

-- option 1 to create new table and populate columns with other colums:
CREATE TABLE profession(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profession VARCHAR(20)
    );
INSERT INTO profession(profession)
	SELECT profession FROM my_contacts
    GROUP BY profession
    ORDER BY profession;

-- option 2 : create table with select, then alter to add prim key
CREATE TABLE profession AS   -- this will create a column with the name from the select statement.
	SELECT profession FROM my_contacts
    GROUP BY profession
    ORDER BY profession;
ALTER TABLE profession
	ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST,
    ADD PRIMARY KEY(id);
    
-- option 3: create , select and insert at the same time
CREATE TABLE profession(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profession VARCHAR(20)
    )AS
		SELECT profession FROM my_contacts
        GROUP BY profession
        ORDER BY profession;


-- Column aliases:
SELECT profession AS mc_prof FROM my_contacts
GROUP BY mc_prof
ORDER BY mc_prof;
-- Table aliases:
SELECT profession AS mc_prof
FROM my_contacts AS mc
GROUP BY mc_prof
ORDER BY mc_prof;

-- you can leave out the AS keyword when making an alias, just put alias name after initial name
SELECT profession mc_prof
FROM my_contacts mc
GROUP BY mc_prof
ORDER BY mc_prof;

-- TOYS_TABLE:
CREATE TABLE `toys` (
  `toy_id` INT(11) DEFAULT NULL,
  `toy` VARCHAR(20) DEFAULT NULL
);

INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('1','hula hoop');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('2','balsa glider');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('3','toy soldiers');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('4','harmonica');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('5','baseball cards');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('6','tinker toys');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('7','etch-a-sketch');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('8','slinky');

-- BOYS_TABLE:
CREATE TABLE `boys` (
  `boy_id` INT(11) DEFAULT NULL,
  `boy` VARCHAR(20) DEFAULT NULL,
  `toy_id` INT(11) DEFAULT NULL
);

INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('1','Davey','3');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('2','Bobby','5');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('3','Beaver','2');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('4','Richie','1');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('6','Johnny','4');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('5','Billy','2');


-- "CROSS JOIN":
-- This join gets us 20 results. That’s 5 toys * 4 boys to account for every possible combination.
SELECT t.toy, b.boy
FROM toys AS t
CROSS JOIN
boys AS b;

-- The CROSS JOIN returns every row from one table crossed with every row from the second.
SELECT * FROM toys
CROSS JOIN boys; -- tester

-- another way of doing cross joins are by leaving out the words cross join and just using commas:
SELECT t.toy, b.boy
FROM toys AS t, boys AS b;

SELECT b1.boy, b2.boy
FROM boys AS b1, boys AS b2; -- this will be a self join

-- INNER JOIN:
-- An INNER JOIN combines the records from two tables using comparison operators in a condition.
SELECT mc.first_name, mc.last_name, p.profession
FROM my_contacts AS mc
INNER JOIN
profession AS p
ON mc.contact_id = p.id; -- can also say 'where' instead of 'on'

-- EQUIJOIN inner joins test for equality
SELECT b.boy, t.toy
FROM boys AS b
INNER JOIN
toys AS t
ON b.toy_id = t.toy_id;

-- page 365:
SELECT mc.email, p.profession
FROM my_contacts AS mc
INNER JOIN
profession AS p
ON mc.contact_id = p.id;

SELECT mc.first_name, mc.last_name, s.status
FROM my_contacts AS mc
INNER JOIN
status AS s
ON mc.status_id = s.status_id;

SELECT mc.first_name, mc.last_name, z.state
FROM my_contacts AS mc
INNER JOIN
zip_code AS z
WHERE mc.zip_code = z.zip_code;
-- ---------------------------------------------------

-- NON-EQUIJOIN is an inner joins that test for inequality.
-- The non-equijoin returns any rows that are not equal.
SELECT b.boy, t.toy
FROM boys AS b
INNER JOIN
toys AS t
ON b.toy_id <> t.toy_id
ORDER BY b.boy;

-- NATURAL JOIN inner joins identify matching column names.
-- We get the very same result set as we did with our first inner join, the equijoin
SELECT b.boy, t.toy
FROM boys AS b
NATURAL JOIN 
toys AS t;

-- page 369:
SELECT mc.email, p.profession
FROM my_contacts AS mc
NATURAL JOIN 
profession AS p;

SELECT mc.first_name, mc.last_name, s.status
FROM my_contacts AS mc
INNER JOIN
status AS s
ON mc.status_id <> s.status_id;

SELECT mc.first_name, mc.last_name, z.state
FROM my_contacts AS mc
NATURAL JOIN
zip_code AS z;
-- ------------------------------------------------------

-- page 373:

SELECT mc.first_name, ci.interest_id
FROM my_contacts AS mc
INNER JOIN
contact_interest AS ci
ON mc.contact_id = ci.contact_id;

SELECT mc.first_name, ci.interest_id
FROM my_contacts AS mc
NATURAL JOIN
contact_interest AS ci;

SELECT * FROM contacts_seeking
CROSS JOIN
seeking;

SELECT p.profession
FROM profession AS p
INNER JOIN
my_contacts AS mc
ON mc.contact_id = p.id
GROUP BY profession
ORDER BY profession;
-- ----------------------------------------------