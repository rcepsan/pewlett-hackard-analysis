--Creating retirement_titles table
SELECT e.emp_no, 
e.first_name, 
e.last_name, 
ti.title, 
ti.from_date, 
ti.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as ti
	ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Use Dictinct with Orderby to remove duplicate rows, creating unique_titles table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Creating retiring_titles table, count of titles
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
