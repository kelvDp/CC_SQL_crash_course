-- page 384:

SELECT mc.first_name, mc.last_name, mc.phone
FROM my_contacts AS mc 
NATURAL JOIN 
job_desired AS jd
WHERE jd.title = "Web Developer"
AND jd.salary_low < 105000;
-- -------------------------------------------

-- A subquery is a query that is wrapped within another query. It’s also called an INNER query.
SELECT mc.first_name, mc.last_name, mc.phone, jc.title
FROM job_current AS jc 
NATURAL JOIN
my_contacts AS mc
WHERE jc.title IN (SELECT title FROM job_listings);
-- The first query is known as the outer query. The one inside is known as the inner query. (subquery)

SELECT last_name, first_name
FROM my_contacts
WHERE zip_code = (SELECT zip_code FROM zip_code WHERE city = "Memphis" AND state = "TN");
-- example ^

-- another example:
SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc
NATURAL JOIN
job_current AS jc
WHERE jc.salary = (SELECT MAX(jc.salary) FROM job_current AS jc);

-- page 396:
SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc
NATURAL JOIN
job_current AS jc
ORDER BY jc.salary DESC
LIMIT 1;
-- --------------------------------------------------

-- A subquery can be used as one of the columns in a SELECT statement.
SELECT mc.first_name, mc.last_name, (SELECT state FROM zip_code WHERE mc.zip_code = zip_code) AS state
FROM my_contacts AS mc;

-- example
SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc
NATURAL JOIN
job_current AS jc
WHERE jc.salary > (SELECT jc.salary FROM job_current AS jc NATURAL JOIN my_contacts AS mc WHERE mc.email = "andy@mail.com");

-- If the subquery stands
-- alone and doesn’t
-- reference anything from
-- the outer query, it is a
-- noncorrelated subquery.

-- page 401:
SELECT AVG(salary)
FROM job_current 
WHERE title = "Web Developer";

SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc
NATURAL JOIN
job_current AS jc
WHERE jc.title = "Web Developer";

SELECT mc.first_name, mc.last_name, jc.salary, jc.salary - (SELECT AVG(salary) FROM job_current WHERE title = "Web Developer")
FROM my_contacts AS mc 
NATURAL JOIN 
job_current AS jc
WHERE jc.title = "Web Developer";
-- --------------------------------------------------

-- page 404:
SELECT title 
FROM job_listings
WHERE salary = (SELECT MAX(salary) FROM job_listings);

SELECT mc.first_name, mc.last_name
FROM my_contacts AS mc
NATURAL JOIN job_current AS jc
WHERE jc.salary > (SELECT AVG(salary) FROM job_current);

SELECT mc.first_name, mc.last_name, mc.phone
FROM my_contacts AS mc
NATURAL JOIN 
job_current AS jc 
WHERE jc.title = "Web Designer" 
AND mc.zip_code IN (SELECT zip FROM job_listings WHERE title = "Web Designer");

SELECT first_name, last_name
FROM my_contacts
WHERE zip_code IN (SELECT mc.zip_code FROM my_contacts AS mc NATURAL JOIN job_current AS jc
	WHERE jc.salary = (SELECT MAX(salary) FROM job_current));
-- ---------------------------------------------------------------------------

-- A correlated subquery means that the inner query relies on the outer query before it can be resolved.
-- The query below counts the number of interests in the interest table for each person in my_contacts, 
-- then returns the first and last name of those people who have three interests.

SELECT mc.first_name, mc.last_name
FROM my_contacts AS mc
WHERE 3 = (SELECT COUNT(*) FROM contact_interest WHERE contact_id = mc.contact_id);
-- The outer query has to be executed before we know what the value of mc.contact_id is.

-- Suppose Greg needs more clients for his growing recruiting business, and wants to send out an email to everyone in my_contacts who
-- is not currently in the job_current table.
SELECT mc.first_name, mc.last_name, mc.email
FROM my_contacts AS mc
WHERE NOT EXISTS (SELECT * FROM job_current AS jc WHERE mc.contact_id = jc.contact_id);
-- NOT EXISTS finds the first and last names and email addresses of the people from the my_contacts table
-- who are not currently listed in the job_current table.

-- The query below returns data from my_contacts where the contact_ids show up
-- at least once in the contact_interest table.
SELECT mc.first_name, mc.last_name, mc.email
FROM my_contacts AS mc
WHERE EXISTS (SELECT * FROM contact_interest AS ci WHERE mc.contact_id = ci.contact_id);

-- page 411:
SELECT mc.email
FROM my_contacts AS mc
WHERE EXISTS (SELECT * FROM contact_interest AS ci WHERE mc.contact_id = ci.contact_id)
AND
NOT EXISTS (SELECT * FROM job_current AS jc WHERE mc.contact_id = jc.contact_id);
