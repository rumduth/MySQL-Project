USE book_shop;

-- check true/false queries
SELECT 10 != 10; -- 0
SELECT 15 > 14 AND 99 - 5 <= 94; -- 1
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10; -- 1

-- SELECT all books written before 1980
SELECT title, released_year FROM books
WHERE released_year < 1980
ORDER BY released_year;

-- SELECT all books written by Eggers or Chabon
SELECT title, author_lname FROM books
WHERE author_lname in ('Eggers','Chabon');

-- SELECT all books written by Lahiri, published ater 2000
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

-- SELECT all books with page counts between 100 and 200
SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;


-- SELECT all books where author_lname starts with a 'C' or an 'S'
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

-- If title contain 'stories' -> Short stories
-- Just Kids ans A Hearthbreaking Work -> Memoid
-- Everything Else-> novel

SELECT title, author_lname,
	CASE 
		WHEN LOWER(title) LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' THEN 'Memoir'
        WHEN title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
	END AS TYPE
FROM books;


-- Print out author_lname, author_fname and the number of books they published
SELECT author_fname, author_lname, 
	CASE
		WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*),' ','book')
        ELSE CONCAT(COUNT(*),' ','books')
	END AS COUNT
FROM books
WHERE author_fname IS NOT NULL
GROUP BY author_fname, author_lname;