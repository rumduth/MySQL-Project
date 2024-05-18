USE practice;

CREATE TABLE customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
-- SELECT all orders that placed by Boy George

SELECT * FROM orders 
WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Boy' AND last_name = 'George');

-- CROSS JOIN --
SELECT * FROM customers, orders;

-- INNER JOIN -- 
SELECT * FROM customers
JOIN orders
ON customers.id = orders.customer_id;

-- FIND total amount each customer spent
SELECT customers.id, first_name, last_name, SUM(amount) AS total_spent FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

-- LEFT JOIN
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders 
ON customers.id = orders.customer_id;

SELECT first_name, last_name, 
CASE 
	WHEN SUM(amount) >= 0 THEN SUM(amount)
    ELSE 0
END AS total_sum
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

SELECT first_name, last_name, IFNULL(SUM(amount),0) AS money_spent
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

-- RIGHT JOIN --
SELECT first_name, last_name, order_date, amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;


