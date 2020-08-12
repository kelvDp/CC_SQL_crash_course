CREATE TABLE my_contacts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(30),
    first_name VARCHAR(20),
    email VARCHAR(50),
    gender CHAR(1),
    birthday DATE,
    profession VARCHAR(50),
    location VARCHAR(50),
    status VARCHAR(20),
    interests VARCHAR(100),
    seeking VARCHAR(100)
);

INSERT INTO `my_contacts` (id,`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES (1,'Anderson','Jillian','jill_anderson@ \nbreakneckpizza.com','F','1980-09-05','Technical Writer','Palo Alto, CA','single','kayaking, reptiles','relationship, friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Kenton','Leo','lkenton@starbuzzcoffee.com','M','1974-01-10','Manager','San Francisco, CA','divorced','women','women to date');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('McGavin','Darrin',' captainlove@headfirsttheater.com','M','1966-01-23','Cruise Ship Captain','San Diego, CA','single','sailing, fishing, yachting','women for casual relationships');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Franklin','Joe','joe_franklin@leapinlimos.com','M','1977-04-28','Software Sales','Dallas, TX','married','fishing, drinking','new job');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Hamilton','Jamie','dontbother@starbuzzcoffee.com','F','1964-09-10','System Administrator','Princeton, NJ','married','RPG','nothing');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Chevrolet','Maurice','bookman4u@objectville.net','M','1962-07-01','Bookshop Owner','Mountain View, CA','married','collecting books, scuba diving','friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Kroger','Renee','poorrenee@mightygumball.net','F','1976-12-03','Unemployed','San Francisco, CA','divorced','cooking','employment');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Mendoza','Angelina','angelina@starbuzzcoffee.com','F','1979-08-19','UNIX Sysadmin','San Francisco, CA','married','acting, dancing','new job');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Murphy','Donald','padraic@tikibeanlounge.com','M','1967-01-23','Computer Programmer','New York City, NY','committed relationsh','RPG, anime','friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Spatner','John','jpoet@objectville.net','M','1963-04-18','Salesman','Woodstock, NY','married','poetry, screenwriting','nothing');


ALTER TABLE my_contacts
ADD COLUMN interest1 VARCHAR(25) NOT NULL,
ADD COLUMN interest2 VARCHAR(25) NOT NULL,
ADD COLUMN interest3 VARCHAR(25) NOT NULL;

UPDATE my_contacts 
SET 
    interest1 = SUBSTRING_INDEX(interests, ',', 1),
    interests = SUBSTR(interests, LENGTH(interest1) + 2),
    interest2 = SUBSTRING_INDEX(interests, ',', 1),
    interests = SUBSTR(interests, LENGTH(interest2) + 2),
    interest3 = SUBSTRING_INDEX(interests, ',', 1),
    interests = SUBSTR(interests, LENGTH(interest3) + 2);

ALTER TABLE my_contacts
DROP COLUMN interests;

CREATE TABLE interests (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    interests VARCHAR(40)
) AS SELECT interest1 AS interests FROM
    my_contacts 
UNION SELECT 
    interest2 AS interests
FROM
    my_contacts 
UNION SELECT 
    interest3 AS interests
FROM
    my_contacts
GROUP BY interests;