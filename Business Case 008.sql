/*
=========================================================
Business Case 008
Employee Salary Change Status
=========================================================

Business Question:
Show every employee's salary history and indicate
whether the salary increased, decreased,
or stayed the same compared to the previous salary.

Skills Used:
- Common Table Expression (CTE)
- LAG()
- CASE WHEN
- Window Functions

Database:
employees
=========================================================
*/

WITH previous_salaries AS (

    SELECT
        emp_no,
        from_date,
        salary,
        LAG(salary) OVER (
            PARTITION BY emp_no
            ORDER BY from_date
        ) AS previous_salary
    FROM salaries

)

SELECT
    emp_no,
    from_date,
    salary,
    previous_salary,
    CASE
        WHEN previous_salary IS NULL THEN 'First Salary'
        WHEN salary > previous_salary THEN 'Increased'
        WHEN salary < previous_salary THEN 'Decreased'
        ELSE 'No Change'
    END AS salary_status
FROM previous_salaries
ORDER BY emp_no, from_date;