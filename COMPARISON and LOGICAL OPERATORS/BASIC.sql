USE book_shop;

-- NOT EQUAL --
SELECT * FROM books
WHERE released_year != 2017;

SELECT title, author_lname FROM books
WHERE author_lname != 'Gaiman';

-- NOT LIKE --
SELECT title FROM books
WHERE title NOT LIKE '% %';

SELECT title FROM books
WHERE title NOT LIKE '%e%';

-- GREATER THAN, GREATER THAN -- 
SELECT * FROM books
WHERE released_year > 2005;


-- AND --  -- OR --
-- SELECT books written by Dave Edggers published after the year 2010
SELECT title, CONCAT(author_fname,' ',author_lname), released_year AS author
FROM books WHERE CONCAT(author_fname,' ',author_lname) = 'Dave Eggers' AND released_year > 2010;


-- BETWEEN -- 
SELECT title, released_year FROM books
WHERE released_year >= 2004 AND released_year <= 2015;

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015;


-- DATE comparing --
SELECT * FROM people
WHERE birthdate < '2005-01-01';

SELECT CAST('09:00:00' AS TIME);

SELECT * FROM people
WHERE birthtime 
BETWEEN '1:00:00' AND '16:00:00';


-- IN --
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

-- Select all books not publised in even year --
SELECT title, author_lname, released_year FROM books
WHERE released_year % 2 = 1;


-- CASE --
SELECT title, released_year, 
	CASE
		WHEN released_year >= 2000 THEN 'modern list'
        ELSE '20th century'
	END AS genre
FROM books;

SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
	END AS STOCK
FROM books;


-- IS NULL --
SELECT * FROM books
WHERE author_fname IS NULL;