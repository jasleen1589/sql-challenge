-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT sal.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees AS emp
INNER JOIN salaries AS sal 
ON emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees 
-- who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT dm.dept_no, dept.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS dm
INNER JOIN departments AS dept
ON dm.dept_no = dept.dept_no
INNER JOIN employees AS emp
ON dm.emp_no = emp.emp_no;


-- List the department number for each employee along with that
-- employee’s employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dedept_name
FROM employees AS emp
LEFT JOIN dept_emp as de
ON emp.emp_no = de.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no;


-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.last_name, emp.first_name, emp.sex
FROM employees AS emp
WHERE (emp.first_name = 'Hercules') AND (LOWER(emp.last_name) LIKE 'b%');

-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no
WHERE LOWER(dept.dept_name) = 'sales';


-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no
WHERE (LOWER(dept.dept_name) = 'sales') OR (LOWER(dept.dept_name) = 'development');

-- List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
