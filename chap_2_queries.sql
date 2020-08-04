SELECT * FROM my_contacts
WHERE first_name = "Anne";

SELECT * FROM easy_drinks
WHERE main = "Sprite";

SELECT * FROM easy_drinks
WHERE main = soda;

SELECT * FROM easy_drinks
WHERE amount2 = 6;

SELECT * FROM easy_drinks
WHERE second = "orange juice";

SELECT * FROM easy_drinks
WHERE amount1 < 1.5;

SELECT * FROM easy_drinks
WHERE amount2 < "1";
 
SELECT * FROM easy_drinks
WHERE main = "soda";

SELECT * FROM easy_drinks
WHERE amount1 = "1.5";


-- option 1:
SELECT * FROM my_contacts
WHERE
location = 'Grover\'s Mill, NJ';

-- option 2:
SELECT * FROM my_contacts
WHERE
location = 'Grover''s Mill, NJ';

-- specify which columns you want to see:
SELECT drink_name,main,second
FROM easy_drinks
WHERE main = "soda";

SELECT drink_name 
FROM easy_drinks
WHERE main = "cherry juice";

SELECT drink_name
FROM easy_drinks
WHERE drink_name = "Kiss on the Lips";

SELECT drink_name
FROM easy_drinks
WHERE second = "apricot nectar";

SELECT drink_name
FROM easy_drinks
WHERE amount2 = 7;

SELECT drink_name
FROM easy_drinks
WHERE directions = "serve over ice with straw";

-- three SELECT statements that will give you a Bull Frog:
SELECT drink_name 
FROM easy_drinks
WHERE main = "iced tea";

SELECT drink_name
FROM easy_drinks
WHERE drink_name = "Bull Frog";

SELECT drink_name
FROM easy_drinks
WHERE second = "lemonade";

SELECT location, rating 
FROM doughnut_ratings
WHERE type = 'plain glazed';

-- or :
SELECT location, type 
FROM doughnut_ratings
WHERE rating = 10;

-- We can handle the two things we’re searching for, 'plain glazed' for the type and 10 for the rating into a single query using the keyword AND.
SELECT location
FROM doughnut_ratings
WHERE type = "plain glazed"
AND rating = 10;

SELECT email
FROM my_contacts
WHERE profession = "Computer Programmer";

SELECT first_name, last_name,location
FROM my_contacts
WHERE birthday = "2000-02-14";

SELECT first_name,last_name,email
FROM my_contacts
WHERE location = "San Diego, CA"
AND status = "single"
AND gender = "M";

SELECT first_name,last_name,email
FROM my_contacts
WHERE first_name = "Anne"
AND location = "San Fran, CA";

-- can do the following to query more than one thing at a time:
SELECT drink_name
FROM easy_drinks
WHERE main = 'soda'
AND amount1 > 1;

SELECT drink_name 
FROM drink_info
WHERE cost >= 3.5
AND calories < 50;

SELECT drink_name,cost
FROM drink_info
WHERE ice = "Y"
AND color = "yellow"
AND calories > 33;

SELECT drink_name,color
FROM drink_info
WHERE carbs < 4
AND ice = "Y";

SELECT drink_name,cost
FROM drink_info
WHERE calories >= 80;

SELECT drink_name,color,ice
FROM drink_info
WHERE cost >= 4;

-- can use these operators on strings/characters as well:
SELECT drink_name
FROM drink_info
WHERE
drink_name >= 'L'
AND
drink_name < 'M';
-- This query returns drinks whose first letter is L or later, butwhose first letters come earlier in the alphabet than M.

SELECT drink_name 
FROM easy_drinks 
WHERE main = 'orange juice'
OR main = "apple juice";

SELECT type
FROM doughnut_ratings
WHERE location = 'Krispy King' 
AND rating <> 6;

SELECT type
FROM doughnut_ratings
WHERE location = 'Krispy King' 
AND rating = 3;

SELECT type
FROM doughnut_ratings
WHERE location = 'Snappy Bagel' 
AND rating >= 6;

SELECT type
FROM doughnut_ratings
WHERE location = 'Krispy King' 
OR rating > 5;

SELECT type
FROM doughnut_ratings
WHERE location = 'Krispy King' 
OR rating = 3;

SELECT type
FROM doughnut_ratings
WHERE location = 'Snappy Bagel' 
OR rating = 6;

-- this is how you select a value that is NU:
SELECT drink_name
FROM drink_info
WHERE calories IS NULL;

SELECT first_name 
FROM my_contacts
WHERE first_name LIKE '%im';  -- looks for all names ending with an im
-- stand in for any number of unknown characters.

-- underscore, _  stands for just one unknown character.
SELECT first_name 
FROM my_contacts
WHERE first_name LIKE '_im';

-- if you want to start with the first character of a word, just use first character ...see 217:

SELECT drink_name 
FROM drink_info
WHERE calories >= 30
AND calories <= 60;

-- or easier way :
SELECT drink_name 
FROM drink_info
WHERE calories BETWEEN 30 AND 60;

SELECT drink_name
FROM drink_info
WHERE calories > 60
OR calories < 30;

SELECT drink_name
FROM drink_info
WHERE drink_name BETWEEN "G" AND "P";

-- instead of using a lot of OR statements , you can use IN :
SELECT date_name
FROM black_book
WHERE rating IN ('innovative','fabulous', 'delightful','pretty good');
-- you can also use NOT IN to get the opposite values.

-- You can use NOT with BETWEEN and LIKE just as you can with IN. The important thing to keep in mind is NOT goes right after WHERE,AND,OR in your statement.
SELECT drink_name FROM drink_info
WHERE NOT carbs BETWEEN 3 AND 5;

SELECT date_name from black_book
WHERE NOT date_name LIKE 'A%'
AND NOT date_name LIKE 'B%';

SELECT drink_name
FROM easy_drinks
WHERE amount1 > 1.50;

SELECT drink_name 
FROM drink_info
WHERE ice = 'N';

SELECT drink_name
FROM drink_info
WHERE calories > 20;

SELECT drink_name
FROM easy_drinks
WHERE main = 'peach nectar' 
OR main = 'soda';

SELECT drink_name 
FROM drink_info
WHERE calories > 0;

SELECT drink_name 
FROM drink_info
WHERE carbs < 3
OR carbs > 5;

SELECT date_name 
FROM black_book
WHERE date_name LIKE "C%";