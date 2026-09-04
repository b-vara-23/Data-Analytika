/*
============================================================
Business Case 012
Title: Current Salary by Job Title
Author: Bohdan Varchenko
Database: employees
============================================================

Business Question:
How do current salary levels differ across job titles?

Requirements:
- Include only current job titles
- Include only current salaries
- Calculate the number of employees for each job title
- Calculate average, minimum, and maximum salary
- Calculate the salary range for each job title
- Include only job titles with more than 10,000 employees
- Sort results by average salary descending

Skills Demonstrated:
- INNER JOIN
- GROUP BY
- HAVING
- COUNT(DISTINCT)
- AVG()
- MIN()
- MAX()
- Aggregate Functions
- Filtering Current Records
- Salary Analysis
============================================================
*/

SELECT 
    t.title,
    COUNT(DISTINCT t.emp_no) AS employees_count,
    ROUND(AVG(s.salary), 2) AS avg_salary,
    MIN(s.salary) AS min_salary,
    MAX(s.salary) AS max_salary,
    MAX(s.salary) - MIN(s.salary) AS salary_range
FROM
    titles t
        JOIN
    salaries s ON t.emp_no = s.emp_no
WHERE
    t.to_date = '9999-01-01'
        AND s.to_date = '9999-01-01'
GROUP BY t.title
HAVING COUNT(DISTINCT t.emp_no) > 10000
ORDER BY avg_salary DESC;