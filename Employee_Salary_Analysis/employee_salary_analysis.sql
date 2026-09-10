SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.gender,
    e.birth_date,
    s.salary,
    t.title,
    de.dept_no,
    d.dept_name
FROM
    employees e
        JOIN
    salaries s ON s.emp_no = e.emp_no
        AND s.to_date = '9999-01-01'
        JOIN
    titles t ON e.emp_no = t.emp_no
        AND t.to_date = '9999-01-01'
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        AND de.to_date = '9999-01-01'
        JOIN
    departments d ON de.dept_no = d.dept_no;
