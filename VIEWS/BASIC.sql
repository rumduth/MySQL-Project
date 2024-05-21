USE tv_db;

-- CREATE VIEWS -- 
CREATE VIEW full_reviews AS 
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- ROLL UP --
SELECT title, COUNT(rating) FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT released_year, AVG(rating)
FROM full_reviews
GROUP BY released_year WITH ROLLUP;