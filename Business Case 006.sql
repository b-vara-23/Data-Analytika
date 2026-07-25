/*Business Case 006
Find all current employees who belong to the top 3 salary levels in their department*/


with ranked_salaries as (
select e.emp_no,
		e.first_name, 
        e.last_name, 
        d.dept_name, 
        s.salary, 
dense_rank() 
over (partition by d.dept_name order by s.salary desc) as salary_rank
from employees e 
join dept_emp de 
	on e.emp_no = de.emp_no
join departments d
	on de.dept_no = d.dept_no
join salaries s 
	on e.emp_no = s.emp_no
where de.to_date = '9999-01-01' and s.to_date = '9999-01-01')

select emp_no,
		first_name, 
        last_name, 
        dept_name, 
        salary, 
        salary_rank
from ranked_salaries
where salary_rank <= 3
order by dept_name,salary_rank, salary desc;