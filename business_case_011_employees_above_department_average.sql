/*
============================================================
Business Case 011
Title: Employees Above Department Average
Author: Bohdan Varchenko
Database: employees
============================================================

Business Question:
Which current employees earn more than the average salary
of their current department?

Requirements:
- Include only current employees' salaries
- Include only current department assignments
- Calculate the average salary for each department
- Show only employees earning above their department average
- Calculate the difference between employee salary
  and department average salary
- Sort results by department and salary difference descending

Skills Demonstrated:
- Common Table Expressions (CTE)
- INNER JOIN
- GROUP BY
- AVG()
- Filtering Current Records
- Aggregate Functions
- Comparing Row-Level Data with Aggregated Data
============================================================
*/

WITH avg_dep_sal AS (
    SELECT 
        de.dept_no,
        d.dept_name,
        ROUND(AVG(s.salary), 2) AS dep_avg_salary
    FROM salaries s
    JOIN dept_emp de 
        ON s.emp_no = de.emp_no
    JOIN departments d 
        ON d.dept_no = de.dept_no
    WHERE s.to_date = '9999-01-01'
      AND de.to_date = '9999-01-01'
    GROUP BY 
        de.dept_no,
        d.dept_name
)

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    ads.dept_name,
    s.salary AS current_salary,
    ads.dep_avg_salary AS department_avg_salary,
    s.salary - ads.dep_avg_salary AS salary_difference
FROM employees e
JOIN salaries s 
    ON e.emp_no = s.emp_no
   AND s.to_date = '9999-01-01'
JOIN dept_emp de 
    ON e.emp_no = de.emp_no
   AND de.to_date = '9999-01-01'
JOIN avg_dep_sal ads 
    ON de.dept_no = ads.dept_no
WHERE s.salary > ads.dep_avg_salary
ORDER BY 
    ads.dept_name,
    salary_difference DESC;