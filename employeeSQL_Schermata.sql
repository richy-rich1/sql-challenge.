DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE "departments" (
"dept_no" VARCHAR NOT NULL,
"dept_name" VARCHAR NOT NULL,
CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

SELECT * FROM departments;

CREATE TABLE "dept_emp" (
"emp_no" INTEGER NOT NULL,
"dept_no" VARCHAR NOT NULL,
CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no","dept_no")
);

SELECT * FROM dept_emp;

CREATE TABLE "dept_manager" (
"dept_no" VARCHAR NOT NULL,
"emp_no" INTEGER NOT NULL
);

SELECT * FROM dept_manager;

CREATE TABLE "employees" (
"emp_no" INTEGER NOT NULL,
"emp_title_id" VARCHAR NOT NULL,
"birth_date" DATE NOT NULL,
"first_name" VARCHAR NOT NULL,
"last_name" VARCHAR NOT NULL,
"sex" VARCHAR NOT NULL,
"hire_date" DATE NOT NULL,
CONSTRAINT "pk_employees" PRIMARY KEY("emp_no")
);

SELECT * FROM employees;

CREATE TABLE "salaries" (
"emp_no" INTEGER NOT NULL,
"salary" INTEGER NOT NULL,
CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no")
);

SELECT * FROM salaries;

CREATE TABLE "titles" (
"title_id" VARCHAR NOT NULL,
"title" VARCHAR NOT NULL,
CONSTRAINT "pk_titles" PRIMARY KEY("title_id")
);

SELECT * FROM titles;

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dep_emp_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
