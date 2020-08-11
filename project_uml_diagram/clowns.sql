-- POPULATING TABLES:

INSERT INTO clowns_info
VALUES
(
	1,"Elsie", "F", "Red hair"
);
    
INSERT INTO clowns_info(name, gender, description)
VALUES
(
	"Pickles", "M", "Orange shirt"
);
    
INSERT INTO clowns_info(name, gender, description)
VALUES
(
	"Snuggles", "M", "Blue pants"
);
    
INSERT INTO clowns_info(name, gender, description)
VALUES
(
	"Happy", "M", "Big shoes and red nose"  
);
    
INSERT INTO activities(activity)
VALUES("singing"), ("dancing"),("getting into little cars"),("violin"),("scaring kids");
    
INSERT INTO info_activities
VALUES
(
	1, 4
);
    
INSERT INTO info_activities
VALUES
(
	1, 2
);

insert into info_activities
values
(1,1),(2,3),(3,4),(3,1),(3,3),(4,1);

INSERT INTO location(location)
VALUES
( 
	"Cresta mall"
);

INSERT INTO location(location)
VALUES
( 
	"Greg's party"
);

INSERT INTO location(location)
VALUES
( 
	"Senati sands"
);

INSERT INTO info_location
VALUES
(
	1, 2, "14:30"
);

INSERT INTO info_location
VALUES
(
	2, 2, "14:30"
);

INSERT INTO info_location
VALUES
(
	3, 1, "14:30"
);

INSERT INTO info_location
VALUES
(
	4, 3, "14:30"
);

-- ----------------------------------------------------------------
-- ERRORS:

-- error nr #1
INSERT INTO info_activities
VALUES(
	10, 4 -- first primary key being referenced by foreign key here does not exist in it's main table yet.
    );
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`info_activities`, CONSTRAINT `fk_info_activities_clowns_info` FOREIGN KEY (`clowns_info_id`) REFERENCES `clowns_info` (`id`))

-- error nr #2
INSERT INTO info_activities
VALUES(
	1, 6 -- second primary key being referenced by foreign key here does not exist in it's main table yet.
    );
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`info_activities`, CONSTRAINT `fk_info_activities_clowns_info` FOREIGN KEY (`clowns_info_id`) REFERENCES `clowns_info` (`id`))

-- error nr #3
insert into clowns_info
values 
(
	2, "Bounce" , "F", "Scary" -- a primary key '2' already exists
);
-- Error Code: 1062. Duplicate entry '2' for key 'clowns_info.PRIMARY'

-- error nr #4
insert into info_location
values
(
	99, 3, "19:00" -- first primary key being referenced by foreign key here does not exist in it's main table yet.
);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`info_location`, CONSTRAINT `fk_info_location_clowns_info1` FOREIGN KEY (`clowns_info_id`) REFERENCES `clowns_info` (`id`))

-- error nr #5
insert into info_location
values
(
	4, 9, "19:00" -- second primary key being referenced by foreign key here does not exist in it's main table yet.
);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`info_location`, CONSTRAINT `fk_info_location_clowns_info1` FOREIGN KEY (`clowns_info_id`) REFERENCES `clowns_info` (`id`))

-- error nr #6
alter TABLE clowns_info
change id id int not null;
-- Error Code: 1833. Cannot change column 'id': used in a foreign key constraint 'fk_info_activities_clowns_info' of table 'mydb.info_activities'

UPDATE info_location 
SET 
    location_location_id = 15;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mydb`.`info_location`, CONSTRAINT `fk_info_location_location1` FOREIGN KEY (`location_location_id`) REFERENCES `location` (`location_id`))

-- see img for proof of errors. 