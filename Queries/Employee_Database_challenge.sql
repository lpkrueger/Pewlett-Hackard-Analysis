-- Module 7 Challenge: Employee_Database_challenge.sql

--Deliverable 1: The Number of Retiring Employees by Title 

-- Retirement eligibility
DROP TABLE retirement_titles;
SELECT em.emp_no,
    em.first_name,
	em.last_name,
    ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as em
LEFT JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

SELECT * FROM retirement_titles;
---export retirement_titles to CSV

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;



--Deliverable 2: The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
    de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as em
INNER JOIN dept_emp as de
ON em.emp_no = de.emp_no
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE (de.to_date >= '2023-02-09')
AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibilty;


