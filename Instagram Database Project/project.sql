CREATE DATABASE db_instagam;
USE db_instagram;

-- CREATE TABLES --
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
	user_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments(
	id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
	user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

CREATE TABLE likes(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id) 
);

CREATE TABLE follows(
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id,followee_id) 
);

CREATE TABLE tags(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
	photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id,tag_id)
 );


-- QUESTION 1 --
-- Find the 5 oldest users -- 
SELECT * FROM users
ORDER BY created_at
LIMIT 5;


-- QUESTION 2 --
-- What day of the week do most users register on? 
SELECT DAYNAME(created_at) AS most_active_day, COUNT(*) AS total FROM users
GROUP BY DAYNAME(created_at)
HAVING COUNT(*) = (
	SELECT COUNT(*) FROM users
    GROUP BY DAYNAME(created_at)
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- QUESTION 3 -- 
-- Find the users who have never posted a photo
SELECT users.id, users.username FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE Photos.id IS NULL
GROUP BY users.id;

-- QUESTION 4 --
-- Who has the most likes on a single photo 

-- FIRST WAY --
CREATE OR REPLACE VIEW helper AS
SELECT photos.user_id, photos.id AS photos_id, COUNT(*) AS most_like FROM photos
INNER JOIN likes
ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY most_like DESC
LIMIT 1;

SELECT username, users.id, photos_id, most_like FROM users
JOIN helper
WHERE users.id = helper.user_id;

-- SECOND WAY --

SELECT username, photos.id, photos.image_url, COUNT(*) AS total
FROM photos
INNER JOIN likes ON photos.id = likes.photo_id
INNER JOIN users ON photos.user_id = users.id
GROUP BY photos.id
HAVING COUNT(*) = (
	SELECT COUNT(*) AS total
	FROM photos
	INNER JOIN likes ON photos.id = likes.photo_id
	INNER JOIN users ON photos.user_id = users.id
	GROUP BY photos.id
    ORDER BY total DESC LIMIT 1
);



-- QUESTION 5 --
-- How many time does the average user post?
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS average_post_user;


-- QUESTION 6 --
-- What are the top 5 most commonly used hashtags?
SELECT tags.tag_name, COUNT(*) AS time_used FROM tags
INNER JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tags.tag_name
ORDER BY time_used DESC
LIMIT 5;

