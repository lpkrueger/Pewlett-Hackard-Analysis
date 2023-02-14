# Pewlett-Hackard-Analysis
Module 7, SQL - UNCCH Data Analytics Bootcamp, Spring 2023


## Project Overview

### Purpose
Pewlett-Hackard has hired us to perform data analysis on their employees' information to determine the number employees expected to retire, in preparation for the “silver tsunami”, and also identify employees eligible to participate in a mentorship program. 

## Method
 Using PostgreSQL to import employee data via .csv files and run customized SQL queries to join data from separate tables, we created a comprehensive employee database, allowing us to group and sort the information into tables that can inform the leadership team and help make decisions. 

Queries were written and executed to perform the following steps:
1. Create a Retirement Titles table for employees born between January 1, 1952 and December 31, 1955.
2. Create a Unique Titles table containing the employee number, full name, and latest title.
3. Create a Retiring Titles table containing the quantity of retiring employees.
4. Create a Mentorship Eligibility table containing existing employees born in the year 1965, and display their respective titles. 

Sample SQL query used for Deliverable #2: Determine the employees eligible for the mentorship program. 
```
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
```

## Results
- The Number of Retiring Employees by Title
    [Number of Retiring Employees by Title](/Data/retiring_titles.csv)

    - Roles that may require being replaced by outgoing retirees including: 
        - 25,916 Senior Engineers
        - 24,926 Senior Staff
        - 9,285 Engineers
        - 7,636 Staff
        - 3,603 Technique Leaders
        - 1,090 Assistant Engineers
        - 2 Managers

- The Employees Eligible for the Mentorship Program
    [The Employees Eligible for the Mentorship Program](/Data/mentorship_eligibilty.csv)


## Summary

- A total of 72,458 roles may require being replaced by outgoing retirees, including: 
    - 25,916 Senior Engineers
    - 24,926 Senior Staff
    - 9,285 Engineers
    - 7,636 Staff
    - 3,603 Technique Leaders
    - 1,090 Assistant Engineers
    - 2 Managers
    ![retiring_titles](/Data/retiring_titles.png)

- There are 1,549 retirement-ready employees across departments that are qualified to mentor the next generation of employees. 
    ![mentorship_eligibilty](/Data/mentorship_eligibilty.png)

- Additional queries that could be used to provide more insight include:
    - Using from_date to determine the typical tenure of retirement-age employees to learn how long employees can reasonably be expected to work at Pewlett-Hackard, and possibly use this as a recruiting tool for fresh talent. 
    - Using from_date to determine how long the non-retirement-age employees have been with the company, to possibly inform who is eligible for promotion to some of the senior positions that will be losing folks to retirement in the near future. 
 
