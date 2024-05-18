USE practice;
-- UNIQUE --

CREATE TABLE contacts(
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

-- CHECK --

CREATE TABLE users(
	username VARCHAR(20) NOT NULL,
    age INT CHECK(age > 0)
);

CREATE TABLE palindromes(
	word VARCHAR(100) CHECK (word = REVERSE(word))
);

-- CONSTRAINT --

CREATE TABLE users2(
	username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

CREATE TABLE palindromes2(
	word VARCHAR(100),
	CONSTRAINT word_is_palindrome CHECK (word = REVERSE(word))
);


-- MULTIPLE COLUMNS CHECK --
CREATE TABLE companies(
	name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE(name, address)
);

INSERT INTO companies(name, address)
VALUES('blackbird auto','123 spruce');

INSERT INTO companies(name, address)
VALUES('blackbird auto','123 spruce');


CREATE TABLE houses(
	purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sp_gt_pc CHECK (sale_price >= purchase_price)
);

INSERT INTO houses(purchase_price, sale_price) 
VALUES(100,200);

INSERT INTO houses(purchase_price, sale_price) 
VALUES(300,200);

-- ALTER --

-- ADD --
ALTER TABLE companies
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL;

-- DROP --
ALTER TABLE companies
DROP COLUMN phone;

ALTER TABLE companies
DROP COLUMN employee_count;

-- RENAME -- 
RENAME TABLE companies TO suppliers;
ALTER TABLE suppliers RENAME TO companies;

ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- MODIFY -- 
ALTER TABLE companies
MODIFY company_name VARCHAR(50);


-- ADD CONTRAINT

CREATE TABLE houses3(
	purchase_price INT NOT NULL,
    sale_price INT NOT NULL
);

INSERT INTO houses3(purchase_price, sale_price)
VALUES (200,200);
INSERT INTO houses3(purchase_price, sale_price)
VALUES (300,200);
ALTER TABLE houses3
ADD CONSTRAINT positive_price_3 CHECK(sale_price >= purchase_price);

ALTER TABLE houses3
DROP CONSTRAINT positive_price_3;