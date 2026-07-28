/*
============================================================
Business Case 009
Title: Employee Department History
Author: Bohdan Varchenko
Database: employees
============================================================

Task:
Find all employees who have worked in more than one department
during their career and display their current department.

Output:
- Employee Number
- First Name
- Last Name
- Current Department
- Number of Departments Worked In

Skills Used:
- Common Table Expressions (CTE)
- COUNT(DISTINCT)
- INNER JOIN
- Filtering current records
- Business Reporting
============================================================
*/

WITH dept_count AS (

    SELECT
        emp_no,
        COUNT(DISTINCT dept_no) AS departments_count
    FROM dept_emp
    GROUP BY emp_no

)

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name AS current_department,
    dc.departments_count
FROM employees e
JOIN dept_emp de
    ON e.emp_no = de.emp_no
JOIN departments d
    ON de.dept_no = d.dept_no
JOIN dept_count dc
    ON e.emp_no = dc.emp_no
WHERE de.to_date = '9999-01-01'
  AND dc.departments_count > 1
ORDER BY dc.departments_count DESC;