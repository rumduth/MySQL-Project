USE book_shop;

-- Adding more data --
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
       ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


-- DISTINCT --
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT released_year FROM books;
SELECT DISTINCT CONCAT(author_fname,' ',author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;
SELECT DISTINCT author_fname, author_lname, released_year FROM books;


-- ORDER BY -- 
INSERT INTO books(title, author_lname) VALUES('my life','thong');
SELECT book_id, author_lname FROM books ORDER BY author_fname;
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname;
SELECT title, pages FROM books ORDER BY pages;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 4;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 1,2;

-- LIMIT -- 
SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 5;


-- LIKE --
SELECT title, author_fname, author_lname FROM books 
WHERE author_fname LIKE '%da%'; 

SELECT * FROM books
WHERE title LIKE '%:%';

SELECT * FROM books
WHERE author_fname LIKE '____';

SELECT * FROM books 
WHERE title LIKE '%\%%';

SELECT * FROM books 
WHERE title LIKE '%\_%';