CREATE DATABASE shirts_db;
USE shirts_db;
CREATE TABLE shirts(
	shirt_id INT PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(20) NOT NULL,
    color VARCHAR(20) NOT NULL,
    shirt_size VARCHAR(5) NOT NULL,
    last_worn INT NOT NULL DEFAULT 0
);

-- Inserting Value -- 
INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES  ('t-shirt', 'white', 'S', 10),
		('t-shirt', 'green', 'S', 200),
		('polo shirt', 'black', 'M', 10),
		('tank top', 'blue', 'S', 50),
		('t-shirt', 'pink', 'S', 0),
		('polo shirt', 'red', 'M', 5),
		('tank top', 'white', 'S', 200),
		('tank top', 'blue', 'M', 15);


-- Adding a new shirt --
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES ('polo shirt','purple','M',50);


-- Select all shirts but only print out article and color
SELECT article, color FROM shirts;

-- Select all medium shirts, print out everything but shirt_id 
SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size = 'M';

-- Update all polo shirts -- 
UPDATE shirts SET shirt_size = 'L'
WHERE article = 'polo shirt';

-- Update the shirt last worn 15 days ago -- 
UPDATE shirts SET last_worn = 0
WHERE last_worn = 15;

-- Update all white shirts, change size to 'XS' and color to 'off white'
UPDATE shirts SET shirt_size = 'XS', color = 'off white'
WHERE color = 'white';

-- DELETE all old shirst, last worn 200 days ago --
DELETE FROM shirts WHERE last_worn = 200;

-- DELETE all tank tops --
DELETE FROM shirts WHERE article = 'tank top';

-- DELETE all shirts -- 
DELETE FROM shirts;

-- DROP the entire shirts table --
DROP TABLE shirts;