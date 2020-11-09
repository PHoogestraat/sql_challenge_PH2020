-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.

-- Merges data from employees table and salaries
-- Changes colomn names

SELECT *
FROM employees
ORDER BY employees.emp_no DESC

SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS " Last Name",
	employees.first_name AS "First Name",
	employees.sex AS "Gender",
	salaries.salary As "Salary"

FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;
-----------------------------------------------------------------------------
-- 2) List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS " Last Name",
	employees.first_name AS "First Name",
	employees.hire_date AS "Hire Date"
	
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31'
ORDER BY hire_date;
-----------------------------------------------------------------------------
-- 3) List the manager of each department with the following information: 
--     department number, department name, the manager's employee number, 
--     last name, first name.

SELECT dept_manager.dept_no AS "Dept. Number",
	departments.dept_name AS "Dept. Name", 
	dept_manager.emp_no AS "Employee Number", 
	employees.last_name AS "Last Name", 
 	employees.first_name As "First Name"

FROM employees
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no

INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
ORDER BY last_name;

--------------------------------------------------------
-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name", 
 	employees.first_name As "First Name",
	departments.dept_name AS "Dept. Name" 

FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no

JOIN departments
ON  dept_emp.dept_no = departments.dept_no;

----------------------------------------------------------------------------
---5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name As "First Name",
	employees.last_name AS "Last Name", 
	employees.sex AS "Gender"

FROM employees
WHERE employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name", 
 	employees.first_name As "First Name",
	departments.dept_name AS "Dept. Name" 
	
FROM employees

JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no

JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY last_name, first_name;

-- 7) List all employees in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name.

SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name", 
 	employees.first_name As "First Name",
	departments.dept_name AS "Dept. Name" 

FROM employees

JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no

JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Development'
OR departments.dept_name = 'Sales'

ORDER BY last_name, first_name;

-- 8) In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.

SELECT employees.last_name AS "Last Name",
	COUNT(employees.last_name) AS "Name frequency"
FROM employees

GROUP BY employees.last_name
ORDER BY COUNT(employees.emp_no)
DESC;


SELECT employees.first_name As "First Name",
	COUNT(employees.first_name) AS "Name frequency"
FROM employees

GROUP BY employees.first_name
ORDER BY COUNT(employees.emp_no)
DESC;


