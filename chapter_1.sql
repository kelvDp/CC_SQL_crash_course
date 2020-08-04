CREATE DATABASE gregs_list;
USE gregs_list;

CREATE TABLE doughnut_list(
doughnut_name VARCHAR(10),
doughnut_type VARCHAR(6)
);

CREATE TABLE my_contacts(
last_name VARCHAR(30),
first_name VARCHAR(20),
email VARCHAR(50),
birthday DATE,
profession VARCHAR(50),
location VARCHAR(50),
status VARCHAR(20),
interests VARCHAR(100),
sekking VARCHAR(100)
);

DROP TABLE my_contacts;

CREATE TABLE my_contacts(
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

DESC my_contacts;

INSERT INTO my_contacts(
last_name,first_name,email,gender,birthday,profession,location,status,interests,seeking)
VALUES(
"Anderson","Jillian","jill_anderson@gmail.com","F","1990-09-05",
"Technical writer","Palo Alto,CA","single","Kayaking, reptiles",
"Relationship, Friends"
);

INSERT INTO my_contacts(
first_name,email,profession,location)
VALUES(
"Pat","patpost@email.co.za","Postal worker","Princeton, NJ"
);

DROP TABLE doughnut_list;