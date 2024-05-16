USE book_shop;

-- Print the number of books in the database
SELECT COUNT(*) as total_books FROM books;

-- Print out how many books were released each year
SELECT COUNT(*) books_released, released_year
FROM books
GROUP BY released_year;

-- Print out the total number of books in stock
SELECT SUM(stock_quantity) as stock_quantity FROM books;

-- Find the average relased year for each author
SELECT
	CONCAT(author_fname,' ',author_lname) AS author,
	AVG(released_year) AS average_released_year
FROM books
GROUP BY author;


-- Find the full name of the author who wrote the longest book
SELECT 
	CONCAT(author_fname,' ',author_lname) AS author,
    title,
    pages
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);


-- Find the number of books released in each year, sort the year from oldest -> latest
-- Also, find the avg pages in each year

SELECT
	released_year as year,
    COUNT(*) as books,
    AVG(pages) as 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;