-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/H6wJ1j
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- CREATE TABLE RELATIONS

CREATE TABLE employees (
    "emp_no" INTEGER   NOT NULL,
    "emp_title" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(40)   NOT NULL,
    "last_name" VARCHAR(40)   NOT NULL,
    "sex" VARCHAR(2)   NOT NULL,
    "hire_date" DATE   NOT NULL,
	PRIMARY KEY(emp_no)
);

--    Does not work
--   ERROR:  there is no unique constraint matching given keys for referenced table "dept_emp"
--   SQL state: 42830
CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    PRIMARY KEY(dept_no)
--	FOREIGN KEY(dept_no) REFERENCES dept_emp (dept_no)
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    PRIMARY KEY(emp_no)
--	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    PRIMARY KEY(emp_no)
--	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);


CREATE TABLE "titles" (
    "emp_no" INTEGER   NOT NULL,
    "title" VARCHAR(10)   NOT NULL,
    PRIMARY KEY(emp_no)
--	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

-- 
CREATE TABLE "dept_manager" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    PRIMARY KEY(emp_no)
--	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "titles" ("emp_no");

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

--    ERROR:  constraint "fk_dept_emp_emp_no" for relation "dept_emp" already exists
--    SQL state: 42710
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

