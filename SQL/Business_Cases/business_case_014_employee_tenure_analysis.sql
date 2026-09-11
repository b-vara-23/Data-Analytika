/*
============================================================
Business Case 014
Title: Employee Tenure Analysis
Author: Bohdan Varchenko
Database: employees
============================================================

Business Question:
How long have current employees been working for the company,
and which tenure group does each employee belong to?

Requirements:
- Include employees with current department assignments
- Calculate years of service based on hire date
- Classify employees into tenure groups
- Sort employees by years of service descending

Skills Demonstrated:
- Date Functions
- TIMESTAMPDIFF()
- CURDATE()
- Common Table Expressions (CTE)
- CASE
- INNER JOIN
- Current Record Filtering
- Employee Tenure Analysis
============================================================
*/

WITH years_service AS (
    SELECT 
        e.emp_no,
        e.hire_date,
        TIMESTAMPDIFF(
            YEAR,
            e.hire_date,
            CURDATE()
        ) AS service_years
    FROM employees e
    JOIN dept_emp de 
        ON de.emp_no = e.emp_no
       AND de.to_date = '9999-01-01'
)

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    ys.service_years,
    CASE 
        WHEN ys.service_years < 5 THEN '< 5 years'
        WHEN ys.service_years BETWEEN 5 AND 9 THEN '5-9 years'
        WHEN ys.service_years BETWEEN 10 AND 14 THEN '10-14 years'
        ELSE '15+ years'
    END AS tenure_group
FROM employees e
JOIN years_service ys 
    ON ys.emp_no = e.emp_no
ORDER BY ys.service_years DESC;