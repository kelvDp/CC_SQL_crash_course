-- A CHECK constraint restricts what values you can insert into a column. 
-- It uses the same conditionals as a WHERE clause.

CREATE TABLE piggy_bank
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    coin CHAR(1) CHECK( coin IN ("P", "N", "D", "Q"))
);

INSERT INTO piggy_bank(coin)
VALUES
(
	"U"
); -- error

INSERT INTO piggy_bank(coin)
VALUES
(
	"o"
); -- error

INSERT INTO piggy_bank(coin)
VALUES
(
	"P"
); -- success

-- adding constraint to my_contacts to only accept 'M' and 'F' in gender column:
ALTER TABLE my_contacts
ADD CONSTRAINT CHECK (gender IN ("M", "F"));

-- page 464:
SELECT mc.first_name, mc.last_name, mc.phone, mc.email
FROM my_contacts AS mc
NATURAL JOIN 
job_desired AS jd
WHERE jd.title = "Web Designer";

SELECT title, salary, description, zip
FROM job_listings
WHERE title = "Technical Writing";
-- ----------------------------------------------

-- CREATING VIEWS:
CREATE VIEW web_designer AS
SELECT mc.first_name, mc.last_name, mc.phone, mc.email
FROM my_contacts AS mc
NATURAL JOIN 
job_desired AS jd
WHERE jd.title = "Web Designer";

CREATE VIEW tech_writer_jobs AS
SELECT title, salary, description, zip
FROM job_listings
WHERE title = 'Technical Writer';

-- To see what’s in it, we simply treat it as though it were a table. We can use a SELECT:
SELECT * FROM web_designer;

-- page 470:
CREATE VIEW job_raises AS
SELECT mc.first_name, mc.last_name, mc.email, mc.phone, jc.contact_id, jc.salary, jd.salary_low,
jd.salary_low - jc.salary AS raise
FROM job_current jc
INNER JOIN job_desired jd
INNER JOIN my_contacts mc
WHERE jc.contact_id = jd.contact_id
AND jc.contact_id = mc.contact_id;

-- to see the above ordered:
SELECT * FROM job_raises
ORDER BY last_name;
-- --------------------------------------------------

-- turning a table into a view:
CREATE VIEW pb_quarters AS
SELECT * FROM piggy_bank
WHERE coin = 'Q';

-- page 473:
INSERT INTO piggy_bank(coin, year) VALUES ('Q', 1950), ('P', 1972),('N', 2005),
('Q', 1999),('Q', 1981),('D', 1940),('Q', 1980),('P', 2001),('D',1926),('P', 1999);

CREATE VIEW pb_dimes AS SELECT * FROM piggy_bank WHERE coin = 'D' WITH CHECK OPTION;
-- WITH CHECK OPTION checks each query you try to INSERT or UPDATE to see if it’s allowed
-- according to the WHERE clause in your view.

INSERT INTO pb_quarters(coin,year) 
VALUES
(
	"Q", 1993
);

INSERT INTO pb_quarters(coin, year)
VALUES
(
	"N", 1942
);

INSERT INTO pb_dimes(coin, year)
VALUES
(
	"Q", 2005
);

DELETE FROM pb_quarters
WHERE coin = "N" OR coin = "P" OR coin = "D";

UPDATE pb_quarters
SET coin = "Q" 
WHERE coin = "P";
-- ---------------------------------------------------

-- An updatable view includes all the NOT NULL columns from the tables it references.

-- dropping a view:
DROP VIEW pb_dimes;

-- During a transaction, if all the steps can’t be completed without interference,
-- none of them should be completed.
-- A transaction is a set of SQL statements that accomplish a single unit of work.

START TRANSACTION; -- keeps track of all the SQL that follows until you enter either COMMIT or ROLLBACK.

COMMIT; -- type COMMIT to make the code permanent.

ROLLBACK; -- If something isn’t quite right, ROLLBACK reverses everything to the way it was before you typed START TRANSACTION

-- no changes will occur to the database until you commit.

-- TRANSACTION EXAMPLE:
START TRANSACTION;
SELECT * FROM piggy_bank;
UPDATE piggy_bank SET coin = "Q" WHERE coin = "P";
SELECT * FROM piggy_bank;
ROLLBACK;
SELECT * FROM piggy_bank;

-- now commit changes:
START TRANSACTION;
SELECT * FROM piggy_bank;
UPDATE piggy_bank SET coin = 'Q' WHERE coin= 'P';
SELECT * FROM piggy_bank;
COMMIT;
SELECT * FROM piggy_bank;
