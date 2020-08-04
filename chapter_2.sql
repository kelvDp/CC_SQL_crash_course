
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Anderson','Jillian','jill_anderson@ \nbreakneckpizza.com','F','1980-09-05','Technical Writer','Palo Alto, CA','single','kayaking, reptiles','relationship, friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Kenton','Leo','lkenton@starbuzzcoffee.com','M','1974-01-10','Manager','San Francisco, CA','divorced','women','women to date');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('McGavin','Darrin',' captainlove@headfirsttheater.com','M','1966-01-23','Cruise Ship Captain','San Diego, CA','single','sailing, fishing, yachting','women for casual relationships');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Franklin','Joe','joe_franklin@leapinlimos.com','M','1977-04-28','Software Sales','Dallas, TX','married','fishing, drinking','new job');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Hamilton','Jamie','dontbother@starbuzzcoffee.com','F','1964-09-10','System Administrator','Princeton, NJ','married','RPG','nothing');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Chevrolet','Maurice','bookman4u@objectville.net','M','1962-07-01','Bookshop Owner','Mountain View, CA','married','collecting books, scuba diving','friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Kroger','Renee','poorrenee@mightygumball.net','F','1976-12-03','Unemployed','San Francisco, CA','divorced','cooking','employment');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Mendoza','Angelina','angelina@starbuzzcoffee.com','F','1979-08-19','UNIX Sysadmin','San Francisco, CA','married','acting, dancing','new job');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Murphy','Donald','padraic@tikibeanlounge.com','M','1967-01-23','Computer Programmer','New York City, NY','committed relationsh','RPG, anime','friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Spatner','John','jpoet@objectville.net','M','1963-04-18','Salesman','Woodstock, NY','married','poetry, screenwriting','nothing');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Toth','Anne','Anne_Toth@leapinlimos.com','F','1969-11-18', 'Artist','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Manson','Anne','am86@objectville.net','F','1977-08-09', 'Baker','Seattle, WA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Hardy','Anne','anneh@b0tt0msup.com','F','1963-04-18', 'Teacher','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Parker','Anne','annep@starbuzzcoffee.com','F','1983-01-10', 'Student','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Blunt','Anne','anneblunt@breakneckpizza.com','F','1959-10-09', 'Web Designer','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Jacobs','Anne','anne99@objectville.net','F','1968-02-05', 'Computer Programmer','San Jose, CA');


CREATE TABLE `easy_drinks` (
  `drink_name` VARCHAR(16) DEFAULT NULL,
  `main` VARCHAR(20) DEFAULT NULL,
  `amount1` DEC(3,1) DEFAULT NULL,
  `second` VARCHAR(20) DEFAULT NULL,
  `amount2` DEC(4,2) DEFAULT NULL,
  `directions` VARCHAR(250) DEFAULT NULL
);

INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Kiss on the Lips','cherry juice',2.0,'apricot nectar',7.00,'serve over ice with straw');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Hot Gold','peach nectar',3.0,'orange juice',6.00,'pour hot orange juice in mug and add peach nectar');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Lone Tree','soda',1.5,'cherry juice',0.75,'stir with ice, strain into cocktail glass');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Greyhound','soda',1.5,'grapefruit juice',5.00,'serve over ice, stir well');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Indian Summer','apple juice',2.0,'hot tea',6.00,'add juice to mug and top off with hot tea');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Bull Frog','iced tea',1.5,'lemonade',5.00,'serve over ice with lime slice');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Soda and It','soda',2.0,'grape juice',1.00,'shake in cocktail glass, no ice');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Blackthorn','tonic water',1.5,'pineapple juice',1.00,'stir with ice, strain into cocktail glass with lemon twist');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Blue Moon','soda',1.5,'blueberry juice',0.75,'stir with ice, strain into cocktail glass with lemon twist');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Oh My Gosh','peach nectar',1.0,'pineapple juice',1.00,'stir with ice, strain into shot glass');
INSERT INTO `easy_drinks` (`drink_name`,`main`,`amount1`,`second`,`amount2`,`directions`) VALUES ('Lime Fizz','Sprite',1.5,'lime juice',0.75,'stir with ice, strain into cocktail glass');

-- can handle erros with apostrophes with a backslash:
INSERT INTO my_contacts
VALUES
('Funyon','Steve','steve@onionflavoredrings.
com', 'M', '1970-04-01', 'Punk','Grover\'s Mill,
NJ','Single','smashing the state','compatriots,
guitar players');

-- or double ,single quotes:
INSERT INTO my_contacts
VALUES
('Funyon','Steve','steve@onionflavoredrings.
com', 'M', '1970-04-01', 'Punk','Grover''s Mill,
NJ','Single','smashing the state','compatriots,
guitar players');

-- or:
INSERT INTO my_contacts
VALUES
("Funyon","Steve","steve@onionflavoredrings.
com", "M", "1970-04-01", "Punk","Grover's Mill,
NJ","Single","smashing the state","compatriots,
guitar players");

CREATE TABLE `doughnut_ratings` (
  `location` varchar(50) default NULL,
  `time` time default NULL,
  `date` date default NULL,
  `type` varchar(50) default NULL,
  `rating` tinyint(4) default NULL,
  `comments` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `doughnut_ratings` (`location`,`time`,`date`,`type`,`rating`,`comments`) VALUES ('Krispy King','08:50:00','2007-09-27','plain glazed','10','almost perfect');
INSERT INTO `doughnut_ratings` (`location`,`time`,`date`,`type`,`rating`,`comments`) VALUES ('Duncan\\\'s Donuts','08:59:00','2007-08-25',NULL,'6','greasy');
INSERT INTO `doughnut_ratings` (`location`,`time`,`date`,`type`,`rating`,`comments`) VALUES ('Starbuzz Coffee','07:35:00','2007-05-24','cinnamon cake','5','stale, but tasty');
INSERT INTO `doughnut_ratings` (`location`,`time`,`date`,`type`,`rating`,`comments`) VALUES ('Duncan\\\'s Donuts','07:03:00','2007-04-26','jelly','7','not enough jelly');

CREATE TABLE `drink_info` (
  `drink_name` varchar(16) default NULL,
  `cost` decimal(4,2) default NULL,
  `carbs` decimal(4,2) default NULL,
  `color` varchar(20) default NULL,
  `ice` char(1) default NULL,
  `calories` int(11) default NULL
);

INSERT INTO drink_info VALUES ('Blackthorn', 3, 8.4, 'yellow', 'Y', 33); 
INSERT INTO drink_info VALUES ('Blue Moon', 2.5, 3.2, 'blue', 'Y', 12); 
INSERT INTO drink_info VALUES ('Oh My Gosh', 3.5, 8.6, 'orange', 'Y', 35); 
INSERT INTO drink_info VALUES ('Lime Fizz', 2.5, 5.4, 'green', 'Y', 24); 
INSERT INTO drink_info VALUES ('Kiss on the Lips', 5.5, 42.5, 'purple', 'Y', 171); 
INSERT INTO drink_info VALUES ('Hot Gold', 3.2, 32.1, 'orange', 'N', 135); 
INSERT INTO drink_info VALUES ('Lone Tree', 3.6, 4.2, 'red', 'Y', 17); 
INSERT INTO drink_info VALUES ('Greyhound', 4, 14, 'yellow', 'Y', 50); 
INSERT INTO drink_info VALUES ('Indian Summer', 2.8, 7.2, 'brown', 'N', 30); 
INSERT INTO drink_info VALUES ('Bull Frog', 2.6, 21.5, 'tan', 'Y', 80); 
INSERT INTO drink_info VALUES ('Soda and It', 3.8, 4.7, 'red', 'N', 19); 
INSERT INTO drink_info VALUES ('Slim Shady', 4.35, NULL, 'clear', 'Y', NULL); 

CREATE DATABASE drinks;
USE drinks;

CREATE TABLE easy_drinksTWO(
drink_name VARCHAR(16), main VARCHAR(20), amount1 DEC(3,1),
second VARCHAR(20), amount2 DEC(4,2), directions VARCHAR(250)
);

INSERT INTO easy_drinksTwo
VALUES(
'Blackthorn', 'tonic water', 1.5, 'pineapple juice', 1, 'stir with ice, strain
into cocktail glass with lemon twist'), ('Blue Moon', 'soda', 1.5, 'blueberry
juice', .75, 'stir with ice, strain into cocktail glass with lemon twist'),
('Oh My Gosh', 'peach nectar', 1, 'pineapple juice', 1, 'stir with ice, strain
into shot glass'),
('Lime Fizz', 'Sprite', 1.5, 'lime juice', .75, 'stir with ice, strain into
cocktail glass'),
('Kiss on the Lips', 'cherry juice', 2, 'apricot nectar', 7, 'serve over ice
with straw'),
('Hot Gold', 'peach nectar', 3,' orange juice', 6, 'pour hot orange juice in
mug and add peach nectar'),
('Lone Tree', 'soda', 1.5, 'cherry juice', .75, 'stir with ice, strain into
cocktail glass'),
('Greyhound', 'soda', 1.5, 'grapefruit juice', 5, 'serve over ice, stir well'),
('Indian Summer', 'apple juice', 2, 'hot tea', 6, 'add juice to mug and top off
with hot tea'),
('Bull Frog', 'iced tea', 1.5, 'lemonade', 5, 'serve over ice with lime slice'),
('Soda and It', 'soda', 2, 'grape juice', 1, 'shake in cocktail glass, no ice');