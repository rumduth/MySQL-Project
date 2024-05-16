USE book_shop;

-- COUNT -- 
SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT released_year) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

-- Count how many title contain "the"
SELECT COUNT(*) FROM books
WHERE title LIKE "%the%";


-- GROUP BY ---
SELECT author_lname FROM books
GROUP BY author_lname;

-- COUNT how many books each author has written
SELECT author_lname, COUNT(*) AS book_written
FROM books GROUP BY author_lname
ORDER BY book_written DESC;

SELECT released_year AS year, COUNT(*) AS book_written FROM books
GROUP BY released_year
ORDER BY book_written;

-- MIN and MAX 
SELECT MIN(released_year) AS year FROM books;
SELECT MAX(pages) AS pages FROM books;

-- Find the title of the longest book --
-- ORDER BY --
SELECT title FROM books 
ORDER BY pages DESC 
LIMIT 1;
-- SUBQUERY -- 
SELECT title FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT title, released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);


-- GROUP BY multiple columns -- 
SELECT CONCAT(author_fname,' ',author_lname) AS author, count(*) AS written_book
FROM books GROUP BY author;


-- Find the year each author published thier first book
SELECT CONCAT(author_fname,' ',author_lname) AS author, MIN(released_year) AS oldest,
MAX(released_year) AS latest, COUNT(*) AS books_written, MAX(pages) AS longest_page_count
FROM books GROUP BY author;


-- SUM --
SELECT SUM(pages) FROM books;
-- SUM all pages each author has written
SELECT 
	CONCAT(author_fname,' ',author_lname) AS author, 
	SUM(pages) AS pages_written,
    COUNT(*) AS books_written
FROM books
GROUP BY author;


-- AVG --
SELECT AVG(pages) FROM books;
-- Calculate the average stock quantity for books released in the same year
SELECT AVG(stock_quantity) as AVERAGE_STOCK_QUANTITY, released_year FROM books
GROUP BY released_year;







