USE practice;

CREATE TABLE Employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
    last_name varchar(50) NOT NULL,
    first_name varchar(50) NOT NULL,
    middle_name varchar(50) DEFAULT 'not provided',
    age INT NOT NULL,
    current_status varchar(50) NOT NULL DEFAULT 'employed'
);

INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);