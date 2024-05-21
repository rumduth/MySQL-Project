USE practice;

DROP TABLE employees;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 -- INSERT VALUE -- 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

SELECT department, AVG(salary) FROM employees 
GROUP BY department;

SELECT AVG(salary) OVER() FROM employees;

SELECT emp_no, department, salary, MIN(salary) OVER(PARTITION BY department) AS MIN,
MAX(salary) OVER (PARTITION BY department) AS MAX, COUNT(*) OVER(PARTITION BY department) AS total
FROM employees;

-- OVER(ORDER BY) ---
SELECT
	emp_no,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    AVG(salary) OVER(PARTITION BY department ORDER BY salary) AS solling_dept_avg,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

-- RANK --
SELECT
	emp_no,
    department,
    salary,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
	RANK() OVER(ORDER BY salary DESC) AS overall_ranking
FROM employees;

-- ROW_NUMBER
SELECT
	emp_no,
    department,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
	RANK() OVER(ORDER BY salary DESC) AS overall_ranking
FROM employees;

-- FIRST_ROW
SELECT
	emp_no,
    department,
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees;