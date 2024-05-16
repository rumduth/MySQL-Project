use book_shop;

-- SELECT all Story Collections Project -- titles that contaisn 'stories'
SELECT title FROM books 
WHERE title LIKE '%stories%';

-- FIND the longest books -- print out the tile and page count
SELECT title, pages FROM books
ORDER BY pages DESC LIMIT 1;

-- Print a summary containing the title and year, for the 3 most recent book
SELECT CONCAT_WS(' - ',title,released_year) AS summary FROM books
ORDER BY released_year DESC LIMIT 3;


-- Find all books with an author_lname that contains a space
SELECT title, author_lname FROM books
WHERE author_lname LIKE '% %';

-- Find the 3 books with the lowest stock
SELECT title, released_year, stock_quantity FROM books
WHERE released_year LIKE '%'
ORDER BY stock_quantity, title LIMIT 3;

-- Print title and author_lname, sorted first by author_lname and then by title
SELECT title, author_lname FROM books
ORDER BY author_lname, title;

-- Sorted alphabetically by last name
SELECT UPPER(CONCAT_WS(' ','my favourite author is',author_fname,author_lname)) AS yell FROM books
ORDER BY author_lname;