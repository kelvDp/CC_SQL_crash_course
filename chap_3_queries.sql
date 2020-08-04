INSERT INTO clown_info
VALUES(
'Zippo' ,'Millstone Mall', 'F, orange suit, baggy pants', 'dancing, singing'
);

INSERT INTO clown_info 
VALUES(
'Snuggles' ,'Ball?Mart' ,'F, yellow shirt, baggy blue pants', 'horn, umbrella'
);

INSERT INTO clown_info 
VALUES(
'Bonzo' ,'Dickson Park','M, in drag, polka dotted dress', 'singing, dancing'
);

INSERT INTO clown_info 
VALUES(
'Sniffles' ,'Tracy\'s', 'M, green and purple suit, pointy nose','climbing into tiny car'
); 

SELECT * 
FROM clown_info
WHERE name = "Zippo";

DELETE 
FROM clown_info
WHERE activities = "dancing";

INSERT INTO clown_info
VALUES(
'Clarabelle', 'Belmont Senior Center', 'F, pink hair,
huge flower, blue dress', 'dancing'
);

DELETE
FROM clown_info
WHERE activities = "yelling, dancing"
AND name = "Clarabelle";

USE gregs_list;

INSERT INTO drink_info
VALUES(
"Kiss on the Lips",5.5, 42.5, "purple", "Y", 170
);

DELETE 
FROM drink_info
WHERE drink_name = "Kiss on the Lips"
AND calories = 171;

INSERT INTO drink_info
VALUES(
"Blackthorn", 3, 8.4, "gold", "Y", 33
);

INSERT INTO drink_info
VALUES(
"Greyhound", 4, 14, "gold", "Y", 50
);

DELETE
FROM drink_info
WHERE color = "yellow";

INSERT INTO drink_info
VALUES(
"Oh My Gosh", 4.5, 8.6, "orange", "Y", 35
);

DELETE
FROM drink_info
WHERE cost = 3.5;

INSERT INTO drink_info
VALUES(
"Blue Moon", 3.5, 3.2, "blue", "Y", 12),
("Lime Fizz", 3.5, 5.4, "green", "Y", 24
);

DELETE
FROM drink_info
WHERE cost = 2.5;

-- Change only the records you mean to by using a SELECT statement first
SELECT * FROM clown_info
WHERE activities = 'dancing';

-- now insert the new record:
INSERT INTO clown_info
VALUES(
	'Clarabelle', 'Belmont Senior Center', 'F, pink hair,\nhuge flower, blue dress', 'dancing, singing'
    );

-- Finally, DELETE the old records with the same WHERE clause you used with your SELECT back at the start of the ol’ three-step.
DELETE FROM clown_info
WHERE activities = "dancing";

-- you can update rows without having to insert and delete first:
UPDATE doughnut_ratings
SET type = "glazed"
WHERE type = "plain glazed";

UPDATE clown_info
SET last_seen = "Tracy's"
WHERE name = "Mr. Hobo"
AND last_seen = "Party for Eric Gray";

UPDATE clown_info
SET appearance = "F, yellow shirt, baggy blue pants"
WHERE name = "Snuggles";

UPDATE clown_info
SET last_seen = "Dickson Park"
WHERE name = "Bonzo";

UPDATE clown_info
SET activities = "climbing into tiny car"
WHERE name = "Sniffles";

UPDATE clown_info
SET last_seen = "Party for Eric Gray"
WHERE name = "Mr. Hobo";

UPDATE drink_info
SET cost = 3.5
WHERE drink_name = "Blue Moon";

-- can update multiple rows with one update statement:
UPDATE drink_info
SET cost = cost + 1
WHERE drink_name = "Oh My Gosh"
OR drink_name = "Lime Fizz";