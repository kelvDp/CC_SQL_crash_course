-- POPULATING THE TABLES:
-- my_contacts table:

INSERT INTO `my_contacts`  VALUES (1,'Anderson','Jillian',"0123456789",'jill_anderson@email.com','F','1980-09-05', 1, 183, 1);
INSERT INTO `my_contacts`  VALUES (NULL,'Kenton','Leo',"01245687",'lkenton@email.com','M','1974-01-10', 2, 184, 2);
INSERT INTO `my_contacts`  VALUES (NULL,'McGavin','Darrin',"025648976",' captainlove@email.com','M','1966-01-23', 3, 183, 3);
INSERT INTO `my_contacts` VALUES (NULL,'Franklin','Joe',"0322659874",'joe_franklin@email.com','M','1977-04-28', 3, 185, 4);
INSERT INTO `my_contacts`  VALUES (NULL,'Hamilton','Jamie',"0258796431",'dontbother@email.com','F','1964-09-10', 1, 183, 2);
INSERT INTO `my_contacts`  VALUES (NULL,'Chevrolet','Maurice',"0125466698",'bookman4u@email.net','M','1962-07-01', 6, 186, 4);
INSERT INTO `my_contacts`  VALUES (NULL,'Kroger','Renee',"0335644788",'poorrenee@email.net','F','1976-12-03', 7, 189, 1);
INSERT INTO `my_contacts`  VALUES (NULL,'Mendoza','Angelina',"0247855566",'angelina@email.com','F','1979-08-19', 7, 185, 1);
INSERT INTO `my_contacts`  VALUES (NULL,'Murphy','Donald',"0012455698",'padraic@email.com','M','1967-01-23', 4, 186, 3);

-- profession_table:
INSERT INTO profession(profession) VALUES ("Artist");
INSERT INTO profession(profession) VALUES ("Web Developer");
INSERT INTO profession(profession) VALUES ("Manager");
INSERT INTO profession(profession) VALUES ("UNIX Sysadmin");
INSERT INTO profession(profession) VALUES ("Postal Worker");
INSERT INTO profession(profession) VALUES ("Banker");
INSERT INTO profession(profession) VALUES ("Student");

-- zip_code_table:
INSERT INTO zip_code VALUES (0183, "Palo Alto", "CA");
INSERT INTO zip_code VALUES (NULL, "Princeton", "NJ");
INSERT INTO zip_code VALUES (NULL, "San Diego", "CA");
INSERT INTO zip_code VALUES (NULL, "Dallas", "TX");
INSERT INTO zip_code VALUES (NULL, "Mountain View", "CA");
INSERT INTO zip_code VALUES (NULL, "Woodstock", "NY");
INSERT INTO zip_code VALUES (NULL,"New York City", "NY");

-- status_table:
INSERT INTO status(status) VALUES ("single");
INSERT INTO status(status) VALUES ("divorced");
INSERT INTO status(status) VALUES ("married");
INSERT INTO status(status) VALUES ("relationship");


-- interests_table:
INSERT INTO interests(interest) VALUES ("acting");
INSERT INTO interests(interest) VALUES ("rpg");
INSERT INTO interests(interest) VALUES ("dancing");
INSERT INTO interests(interest) VALUES ("playing games");
INSERT INTO interests(interest) VALUES ("oragami");
INSERT INTO interests(interest) VALUES ("running");
INSERT INTO interests(interest) VALUES ("animals");
INSERT INTO interests(interest) VALUES ("shopping");

-- contact_interest_table:
INSERT INTO contact_interest VALUES (1, 2);
INSERT INTO contact_interest VALUES (1, 4);
INSERT INTO contact_interest VALUES (2, 5);
INSERT INTO contact_interest VALUES (1, 2);
INSERT INTO contact_interest VALUES (3, 1);
INSERT INTO contact_interest VALUES (3, 4);
INSERT INTO contact_interest VALUES (3, 5);
INSERT INTO contact_interest VALUES (4, 2);
INSERT INTO contact_interest VALUES (4, 8);
INSERT INTO contact_interest VALUES (5, 5);
INSERT INTO contact_interest VALUES (6, 7);
INSERT INTO contact_interest VALUES (7, 2);
INSERT INTO contact_interest VALUES (8, 4);
INSERT INTO contact_interest VALUES (9, 1);

-- seeking_table:
INSERT INTO seeking(seeking) VALUES ("relationship");
INSERT INTO seeking(seeking) VALUES ("women to date");
INSERT INTO seeking(seeking) VALUES ("friendship");
INSERT INTO seeking(seeking) VALUES ("men to date");
INSERT INTO seeking(seeking) VALUES ("employment");

-- contact_seeking table:
INSERT INTO contact_seeking VALUES (1, 1);
INSERT INTO contact_seeking VALUES (2, 2);
INSERT INTO contact_seeking VALUES (3, 2);
INSERT INTO contact_seeking VALUES (4, 5);
INSERT INTO contact_seeking VALUES (5, 5);
INSERT INTO contact_seeking VALUES (6, 1);
INSERT INTO contact_seeking VALUES (7, 4);
INSERT INTO contact_seeking VALUES (8, 4);
INSERT INTO contact_seeking VALUES (9, 3);

-- -------------------------------------------------------------------------------

-- TESING FOR CONSTRAINT ERRORS:

-- error nr #1
INSERT INTO profession
VALUES(
	4, "Web Designer"
    );
-- Error Code: 1062. Duplicate entry '4' for key 'profession.PRIMARY'

-- error nr #2
INSERT INTO zip_code
VALUES(
	184, "Joburg","GP"
    );
-- Error Code: 1062. Duplicate entry '184' for key 'zip_code.PRIMARY'

-- error nr #3
INSERT INTO my_contacts
VALUES 
(
	1,'Anderson','Jillian',"0123456789",'jill_anderson@email.com','F','1980-09-05', 1, 183, 4 
);
-- Error Code: 1062. Duplicate entry '1' for key 'my_contacts.PRIMARY'

-- error nr #4
INSERT INTO my_contacts
VALUES
(
	10,'Anderson','Megan',"0123456546",'m_anderson@email.com','F','1980-09-05', 14, 193, 12 -- fkeys here don't exist yet
);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`my_contacts`, CONSTRAINT `fk_my_contacts_profession` FOREIGN KEY (`profession_prof_id`) REFERENCES `profession` (`prof_id`))

-- error nr #5
INSERT INTO contact_interest
VALUES
(
	11, 1 -- the first prim key being referenced here as a fkey does not exist yet.
);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`contact_interest`, CONSTRAINT `fk_contact_interest_my_contacts1` FOREIGN KEY (`my_contacts_contact_id`) REFERENCES `my_contacts` (`contact_id`))

-- error nr #6
INSERT INTO contact_interest
VALUES
(
	1, 28 -- the second prim key being referenced here as a fkey does not exist yet.
);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`contact_interest`, CONSTRAINT `fk_contact_interest_my_contacts1` FOREIGN KEY (`my_contacts_contact_id`) REFERENCES `my_contacts` (`contact_id`))

-- error nr #7
INSERT INTO contact_seeking
VALUES
(
	18, 1 -- the first prim key being referenced here as a fkey does not exist yet.
);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`contact_seeking`, CONSTRAINT `fk_table6_my_contacts1` FOREIGN KEY (`my_contacts_contact_id`) REFERENCES `my_contacts` (`contact_id`))

-- error nr #8
INSERT INTO contact_seeking
VALUES
(
	1, 27 -- the first prim key being referenced here as a fkey does not exist yet.
);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`contact_seeking`, CONSTRAINT `fk_table6_seeking1` FOREIGN KEY (`seeking_seeking_id`) REFERENCES `seeking` (`seeking_id`))

-- error nr #9
INSERT INTO interests
VALUES
(
	4, "Hiking"
);
-- Error Code: 1062. Duplicate entry '4' for key 'interests.PRIMARY'

-- error nr #10
INSERT INTO seeking
VALUES
(
	3, "Relationship"
);
-- Error Code: 1062. Duplicate entry '3' for key 'seeking.PRIMARY'

-- error nr #11
DELETE FROM seeking
WHERE seeking_id = 2;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`contact_seeking`, CONSTRAINT `fk_table6_seeking1` FOREIGN KEY (`seeking_seeking_id`) REFERENCES `seeking` (`seeking_id`))

-- error nr #12
DELETE FROM interests
WHERE interest_id = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`contact_interest`, CONSTRAINT `fk_contact_interest_interests1` FOREIGN KEY (`interests_interest_id`) REFERENCES `interests` (`interest_id`))

-- error nr #13
DELETE FROM my_contacts
WHERE contact_id = 5;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`contact_interest`, CONSTRAINT `fk_contact_interest_my_contacts1` FOREIGN KEY (`my_contacts_contact_id`) REFERENCES `my_contacts` (`contact_id`))

-- error nr #14
DELETE FROM profession
WHERE prof_id = 2;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`my_contacts`, CONSTRAINT `fk_my_contacts_profession` FOREIGN KEY (`profession_prof_id`) REFERENCES `profession` (`prof_id`))

-- error nr #15
DELETE FROM zip_code
WHERE zip_code = 185;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`my_contacts`, CONSTRAINT `fk_my_contacts_zip_code1` FOREIGN KEY (`zip_code_zip_code`) REFERENCES `zip_code` (`zip_code`))

-- error nr #16
DELETE FROM status
WHERE status_id = 2;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`my_contacts`, CONSTRAINT `fk_my_contacts_status1` FOREIGN KEY (`status_status_id`) REFERENCES `status` (`status_id`))

-- error nr #17
ALTER TABLE interests
CHANGE interest_id other_id INT NOT NULL;
-- Error Code: 1846. ALGORITHM=COPY is not supported. Reason: Columns participating in a foreign key are renamed. Try ALGORITHM=INPLACE.

-- error nr #18
ALTER TABLE seeking
CHANGE seeking_id another_id_again INT NOT NULL;
-- Error Code: 1846. ALGORITHM=COPY is not supported. Reason: Columns participating in a foreign key are renamed. Try ALGORITHM=INPLACE.

-- error nr #19
UPDATE my_contacts
SET contact_id = 5
WHERE last_name = "Anderson";
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`mydb`.`contact_interest`, CONSTRAINT `fk_contact_interest_my_contacts1` FOREIGN KEY (`my_contacts_contact_id`) REFERENCES `my_contacts` (`contact_id`))
