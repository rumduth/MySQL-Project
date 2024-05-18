USE pratice;

-- WRITE SCHEMA --
CREATE TABLE students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL
);

CREATE TABLE papers(
	title VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
);

-- ADDING DATA -- 
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



-- Print student who wrote the essay -- 
SELECT first_name, title, grade FROM students
JOIN papers 
ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT first_name, title, grade FROM students
LEFT JOIN papers 
ON students.id = papers.student_id;

SELECT first_name, IFNULL(title,'Missing'), IFNULL(grade,0) AS grade FROM students
LEFT JOIN papers 
ON students.id = papers.student_id;

-- PRINT AVERAGE of EACH student
SELECT first_name, IFNULL(AVG(grade),0) AS average FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

-- PRINT if student is passing or failing
SELECT first_name, IFNULL(AVG(grade),0) AS average,
CASE 
	WHEN AVG(grade) >= 75 THEN 'PASSING'
    ELSE 'FAILING'
END AS passing_status
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

