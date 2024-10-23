-- 1. Employee salary details
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees AS e
    INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- 2. Employees hired in 1986
SELECT 
    first_name,
    last_name,
    hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. Department manager details
SELECT 
    dm.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM dept_manager AS dm
    INNER JOIN departments AS d ON dm.dept_no = d.dept_no
    INNER JOIN employees AS e ON dm.emp_no = e.emp_no;

-- 4. Employee department details
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees AS e
    INNER JOIN dept_employee AS de ON e.emp_no = de.emp_no
    INNER JOIN departments AS d ON de.dept_no = d.dept_no;

-- 5. Employees named Hercules B...
SELECT 
    first_name,
    last_name,
    sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6. Sales department employees
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM employees AS e
    INNER JOIN dept_employee AS de ON e.emp_no = de.emp_no
    INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. Sales and Development department employees
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees AS e
    INNER JOIN dept_employee AS de ON e.emp_no = de.emp_no
    INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. Employee last name frequency
SELECT 
    last_name,
    COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;