DROP DATABASE practice;
CREATE DATABASE practice;
USE practice;

CREATE TABLE friends(
	name VARCHAR(10)
);

CREATE TABLE states(
	abbr CHAR(2)
);

CREATE TABLE products(price DECIMAL(5,2));

CREATE TABLE people(
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    bidthdt DATETIME
);

CREATE TABLE captions(
	text VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW() 
);
INSERT INTO captions(text) 
VALUES('beautiful sunset');

CREATE TABLE captions2(
	text VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP ON UPDATE NOW()
);
INSERT INTO captions2(text) 
VALUES('beautiful sunset');
INSERT INTO captions2(text) 
VALUES('never be a  sunset');

UPDATE captions2 SET text = "CHANGING"
WHERE text = 'beautiful sunset';


INSERT INTO people(name, birthdate, birthtime, bidthdt)
VALUES ('Elton','2000-12-25', '11:00:00','2000-12-25 11:00:00');

INSERT INTO people(name, birthdate, birthtime, bidthdt)
VALUES ('Juan','2020-08-15', '23:59:00','2020-08-15 23:59:00');

INSERT INTO people(name, birthdate, birthtime, bidthdt)
VALUES ('Lulu','1985-04-11', '9:45:10','1985-04-11 9:45:10');

INSERT INTO friends(name)
VALUES ('Juan'), ('juan pablo'), ('james'), (NULL);

INSERT INTO states(abbr) 
VALUES ('CA'), ('NY');

INSERT INTO products(price)
VALUES (4.22),(1.2345);


-- 'April 11 1985'
SELECT MONTHNAME(bidthdt), DAY(bidthdt), YEAR(bidthdt) FROM people;
SELECT CONCAT_WS('-',MONTHNAME(bidthdt), DAY(bidthdt), YEAR(bidthdt)) FROM PEOPLE;
SELECT birthdate, DATE_FORMAT(birthdate, '%c') FROM people;