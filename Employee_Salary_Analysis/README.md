# Employee Salary Analysis

## Project Overview

This project combines SQL and Power BI to analyze the current workforce and salary structure of a fictional company.

The data was extracted from the MySQL Employees Sample Database. SQL was used to combine employee, salary, job title, and department information. The resulting dataset was then imported into Power BI for analysis and visualization.

![Employee Salary Dashboard](employee_salary_dashboard.png)

## Business Questions

The report was created to answer the following questions:

- How many employees currently work for the company?
- What are the total, average, and maximum salary values?
- Which departments have the highest average salaries?
- Which departments have the largest number of employees?
- Which job titles have the highest average salaries?
- How are employees distributed across salary bands?
- Is there a difference between average salaries by gender?
- Who are the top 10 highest-paid employees?

## Tools Used

- MySQL
- SQL
- Power Query
- Power BI
- DAX

## Data Extraction

The SQL query combines data from five tables:

- `employees`
- `salaries`
- `titles`
- `dept_emp`
- `departments`

Only current employee records were selected. Active salary, job title, and department assignments were identified using the condition `to_date = '9999-01-01'`.

The SQL query returns the following information:

- Employee ID
- Employee name
- Gender
- Current salary
- Current job title
- Current department

## Data Preparation

The extracted data was loaded into Power BI and checked for missing values, duplicate employee IDs, and incorrect data types.

In Power Query, employees were grouped into five salary bands:

- Below 50K
- 50K–70K
- 70K–90K
- 90K–110K
- 110K+

A separate numerical column was created to display the salary bands in the correct order.

## DAX Measures

The following DAX measures were created for the report:

- Total Employees
- Total Payroll
- Average Salary
- Maximum Salary
- Current Salary

The Top 10 employee table was created using a Top N visual-level filter based on current salary and the unique employee ID.

## Dashboard Features

The Power BI dashboard includes:

- KPI cards for total employees, total payroll, average salary, and maximum salary
- Average salary and employee count by department
- Employee distribution by salary band
- Average salary by job title
- Average salary comparison by gender
- Top 10 highest-paid employees
- Department, job title, and gender slicers

Some slicer interactions were intentionally disabled for corresponding comparison visuals.

For example, the department slicer does not filter the department chart. This preserves the complete departmental comparison while the slicer continues to filter other relevant visuals.

## Key Insights

- The company has **81,635 current employees**.
- Total payroll is approximately **5.87 billion salary units**.
- The average salary is **71,965**.
- The maximum salary is **158,220**.
- Sales has the highest average departmental salary at approximately **89.01K**.
- Production has the largest workforce, with approximately **20.9K employees**.
- The largest salary band is **50K–70K**, containing **34,355 employees**.
- The second-largest salary band is **70K–90K**, containing **27,586 employees**.
- Average salaries for male and female employees are almost equal.

## Project Files

- `employee_salary_analysis.sql` — SQL query used to extract the data
- `employee_salary_analysis.pbix` — interactive Power BI report
- `employee_salary_dashboard.png` — dashboard preview
- `README.md` — project documentation

## Data Source

The project uses the [MySQL Employees Sample Database](https://github.com/datacharmer/test_db).

The dataset is fictional and was created for testing and educational purposes. The original source does not specify a real currency, so salary values in this project should be interpreted as sample salary units.

## Author

**Bohdan Varchenko**

Aspiring Data Analyst developing practical skills in SQL, Power BI, DAX, Power Query, and data visualization.
