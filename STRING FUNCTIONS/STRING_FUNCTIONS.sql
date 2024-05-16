CREATE DATABASE book_shop;
USE book_shop;

-- Inserting data - 
CREATE TABLE books (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY (book_id)
);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


-- CONCAT -- 
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author_name
FROM
    books;
SELECT 
    CONCAT_WS('-', title, author_fname, author_lname)
FROM
    books;

-- Substring --
SELECT SUBSTRING('Hello World', 1, 4);
SELECT 
    SUBSTRING(title, 1, 15)
FROM
    books;
SELECT 
    SUBSTR(author_lname, 1, 1) AS initital, author_lname
FROM
    books;

-- Combining Concat and Substring --
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM
    books;
SELECT 
    SUBSTR(author_fname, 1, 1), SUBSTR(author_lname, 1, 1)
FROM
    books;

SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS author_initials
FROM
    books;
    
-- REPLACE --- 
SELECT REPLACE('Hello World','Hell', '@@@');
SELECT REPLACE(title,' ','-') FROM books;

-- REVERSE --
SELECT REVERSE('chicken nuggets');
SELECT REVERSE(author_fname) from books;
SELECT CONCAT(author_fname,REVERSE(author_fname)) from books;

-- CHAR_LENGTH --
SELECT CHAR_LENGTH('Dolphin');
SELECT CHAR_LENGTH(title) AS title_len, title FROM books;

-- UPPER AND LOWER --
SELECT UPPER('hello');
SELECT UPPER(title) FROM books;
SELECT UPPER(CONCAT('i love',' ',title,' ','!!!')) FROM books; 


-- EXERCISES ---

-- REVERSE and UPPERCCASE the following sentences --
-- "Why does my cat look at me with such hatred?"
SELECT REVERSE(UPPER("Why does my cat look at me with such hatred?"));

-- REPLACE spaces in titles with '->'
SELECT REPLACE(title,' ','->') AS title FROM books;

-- print author_lname and its backwards
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

-- full name in caps
SELECT CONCAT_WS(' ',UPPER(author_fname), UPPER(author_lname)) as 'full name in caps' FROM books;

-- blurb -- 
SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books; 

-- print book titles and the length of each title
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

-- print short title, author, quantity
SELECT
	CONCAT(SUBSTR(title,1,10),'...') AS 'short title',
    CONCAT_WS(',',author_lname, author_fname) AS author,
    CONCAT(stock_quantity,' int stock') AS quantity
FROM books;