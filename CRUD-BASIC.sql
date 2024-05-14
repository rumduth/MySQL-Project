USE practice;
-- Creating ---
CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
       
-- Reading -- 
SELECT name from cats;
SELECT age from cats;
SELECT name,age from cats;
SELECT * FROM cats where age = 4;
SELECT * FROM cats where name ='Egg';

-- Query for getting only cat_id -- 
SELECT cat_id from cats;

-- Query for getting name and breed -- 
SELECT name, breed FROM cats;

-- Query for getting name,age of Tabby cats --
SELECT name,age FROM cats WHERE breed = 'Tabby';

-- Query for getting cat_id equal to age --
SELECT name, cat_id, age FROM cats where cat_id = age;


-- Updating ---
UPDATE cats SET age = 14
WHERE name = 'Misty';

-- Changing Jackson to Jack --
UPDATE cats SET name = 'Jack'
WHERE name = 'Jackson';

-- Changing Ringo's breed to British Shorthair"
UPDATE cats SET breed = 'British Shorthair'
WHERE name = 'Ringo';

-- Update both Maine Coons' ages to be 12 --
UPDATE cats SET age = 12
WHERE breed = 'Maine Coon';


-- Deleting --
DELETE FROM cats WHERE name ='Egg';

-- DELETE all 4 yea old cats --
DELETE FROM cats WHERE age = 4;
-- DELETE cats whose age is the same as their cat_id
DELETE FROM cats WHERE age = cat_id;
-- Delete all cats --
DELETE FROM cats;