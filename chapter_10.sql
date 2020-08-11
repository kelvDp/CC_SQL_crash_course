-- An outer joins returns all rows from one of the tables, along with
-- matching information from another table.

SELECT 
    b.boy, t.toy
FROM
    boys AS b
        LEFT OUTER JOIN
    toys AS t ON b.toy_id = t.toy_id;

-- an outer join gives you a row whether there’s a match with the other table or not.

SELECT 
    t.toy, b.boy
FROM
    toys AS t
        LEFT OUTER JOIN
    boys AS b ON b.toy_id = t.toy_id;

-- page 423:
SELECT 
    g.girl, t.toy
FROM
    girls AS g
        LEFT OUTER JOIN
    toys AS t ON g.toy_id = t.toy_id;

SELECT 
    t.toy, g.girl
FROM
    toys AS t
        LEFT OUTER JOIN
    girls AS g ON g.toy_id = t.toy_id;
-- -------------------------------------------------------

SELECT 
    b.boy, t.toy
FROM
    toys AS t
        RIGHT OUTER JOIN
    boys AS b ON b.toy_id = t.toy_id;

SELECT 
    b.boy, t.toy
FROM
    boys AS b
        LEFT OUTER JOIN
    toys AS t ON b.toy_id = t.toy_id;

-- A SELF-REFERENCING foreign key is the primary key of a table used
-- in that same table for another purpose.

SELECT 
    clown1.name, clown2.name AS boss
FROM
    clown_info1 AS clown1
        INNER JOIN
    clown_info2 AS clown2 ON clown1.id = clown2.boss_id;
-- ----------------------------------------------------------------
-- would never have two copies of the same table. Instead, we
-- can use a self-join to simulate having two tables.
SELECT 
    clown1.name, clown2.name AS boss
FROM
    clown_info AS clown1
        INNER JOIN
    clown_info AS clown2 ON clown1.boss_id = clown2.id;
-- THIS IS A SELF JOIN^
-- The self-join allows you to query a single table as though there were two
-- tables with exactly the same information in them.

SELECT 
    title
FROM
    job_current 
UNION SELECT 
    title
FROM
    job_desired 
UNION SELECT 
    title
FROM
    job_listing;
-- this won't give you any duplicate names, but if you want duplicates to appear
-- say UNION ALL instead of just union

CREATE TABLE my_union AS SELECT title FROM
    job_current 
UNION SELECT 
    title
FROM
    job_desired 
UNION SELECT 
    title
FROM
    job_listings;


-- page 441:
SELECT 
    contact_id
FROM
    job_current 
UNION SELECT 
    salary
FROM
    job_listings;

CREATE TABLE another_union AS SELECT contact_id FROM
    job_current 
UNION SELECT 
    salary
FROM
    job_listings;
-- ------------------------------------------------------

SELECT 
    title
FROM
    job_listings
ORDER BY salary DESC
LIMIT 1;
-- -------------------------------------------

SELECT 
    clown1.name,
    (SELECT 
            name
        FROM
            clown_info
        WHERE
            clown1.boss_id = id) AS boss
FROM
    clown_info AS clown1;