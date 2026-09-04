/*
============================================================
Business Case 013
Title: Employees Who Changed Job Titles
Author: Bohdan Varchenko
Database: employees
============================================================

Business Question:
Which employees have held more than one different job title
during their employment history?

Requirements:
- Analyze the complete job title history
- Count the number of distinct job titles per employee
- Identify the first job title start date
- Identify the most recent job title start date
- Include only employees who held more than one distinct title
- Sort by number of job titles descending, then by employee ID

Skills Demonstrated:
- INNER JOIN
- GROUP BY
- HAVING
- COUNT(DISTINCT)
- MIN()
- MAX()
- Aggregate Functions
- Historical Data Analysis
============================================================
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    COUNT(DISTINCT t.title) AS titles_count,
    MIN(t.from_date) AS first_title_date,
    MAX(t.from_date) AS last_title_date
FROM employees e
JOIN titles t 
    ON e.emp_no = t.emp_no
GROUP BY 
    e.emp_no,
    e.first_name,
    e.last_name
HAVING COUNT(DISTINCT t.title) > 1
ORDER BY 
    titles_count DESC,
    e.emp_no;