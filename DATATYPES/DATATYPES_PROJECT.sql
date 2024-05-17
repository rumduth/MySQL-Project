-- What is a goo use case for Char --
-- When we know in advance the fix size of text, we can save up more space

USE practice;
-- Create Table
CREATE TABLE inventory (
	item_name VARCHAR(30),
    price DECIMAL(6,2),
    quanity INT
);


-- What is the difference between DATETIME and TIMESTAMP?
-- They are both the same but TIMSTAMP handle the small interval of time comparing to DATETIME 
-- we can save up more space

-- Print out the current date
SELECT CURDATE() AS today_day;

-- Print out the current day of the week
SELECT DAYOFWEEK(CURDATE()) as week_day;

-- Print out the day of the week
SELECT DAYNAME(CURDATE()) as day_name;

-- Print out the current date and time using this format: mm/dd/yyyy
SELECT DATE_FORMAT(NOW(),'%c/%d/%Y');

-- Print out the current date and time using this format: January 2nd at 3:15
SELECT DATE_FORMAT(NOW(),'%M %D at %H:%i');


-- CREATE a tweet table
CREATE TABLE tweets(
	text VARCHAR(50),
    username VARCHAR(20),
    create_at TIMESTAMP DEFAULT NOW()
);