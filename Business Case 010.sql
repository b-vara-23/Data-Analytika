/*
============================================================
Business Case 010
Title: Department Salary Report
Author: Bohdan Varchenko
Database: employees
============================================================

Task:
Generate a salary report for each current department.
The report should display the number of current employees,
average salary, highest salary, lowest salary, and the salary range.

Output:
- Department
- Employees Count
- Average Salary
- Highest Salary
- Lowest Salary
- Salary Range

Skills Used:
- INNER JOIN
- GROUP BY
- Aggregate Functions (COUNT, AVG, MIN, MAX)
- Filtering Current Records
- Business Reporting
============================================================
*/

SELECT
    d.dept_name AS department,
    COUNT(DISTINCT de.emp_no) AS employees_count,
    ROUND(AVG(s.salary), 2) AS average_salary,
    MAX(s.salary) AS highest_salary,
    MIN(s.salary) AS lowest_salary,
    MAX(s.salary) - MIN(s.salary) AS salary_range
FROM departments d
JOIN dept_emp de
    ON d.dept_no = de.dept_no
JOIN salaries s
    ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC;