--CREATING TABLES

DROP TABLE "department";
DROP TABLE "Dept_emp";
DROP TABLE "Dept_manager";
DROP TABLE "Employees";
DROP TABLE "salary";
DROP TABLE "Titles";

SELECT * FROM "department";
SELECT * FROM "Dept_emp";
SELECT * FROM "Dept_manager";
SELECT * FROM "Employees";
SELECT * FROM "salary";
SELECT  * FROM "Titles";

CREATE TABLE "department" (
    "dept_no" Varchar   NOT NULL,
    "dept_name" Varchar   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_emp" (
	
    "emp_no" Integer   NOT NULL,
    "dept_no" Varchar   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);




CREATE TABLE "Dept_manager" (
    "dept_no" Varchar   NOT NULL,
    "emp_no" Integer   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "emp_no"
     )
);





CREATE TABLE "Employees" (
    "emp_no" Integer   NOT NULL,
    "birthdate" Date   NOT NULL,
    "first_name" Varchar   NOT NULL,
    "last_name" Varchar   NOT NULL,
    "gender" Varchar   NOT NULL,
    "hire_date" Date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);




CREATE TABLE "salary" (
    "salary" Integer   NOT NULL,
    "emp_no" Integer   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_no","from_date","to_date","salary"
     )
);







CREATE TABLE "Titles" (
    "emp_no" Varchar   NOT NULL,
    "title" Varchar   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "emp_no","from_date"
     )
);




ALTER TABLE "department" ADD CONSTRAINT "fk_department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_emp" ("dept_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_manager" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Dept_emp" ("emp_no");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.gender , salary.salary
FROM "Employees" as e
INNER JOIN 
salary ON e.emp_no = salary.emp_no



select * from "Employees" limit(10);

--List employees who were hired in 1986.
SELECT first_name, last_name , hire_date
FROM "Employees"
Where hire_date
between '1986-01-01' AND '1986-12-31';






--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no,d.dept_name ,dm.emp_no, e.first_name, e.last_name, dm.from_date , dm.to_date
FROM "department" as d
INNER JOIN "Dept_manager" as dm
ON d.dept_no = dm.dept_no 
INNER JOIN "Employees" as e
ON dm.emp_no=e.emp_no




--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM "Dept_emp";

SELECT e.emp_no,e.first_name, e.last_name, dep.dept_name
FROM "Employees"  AS e
INNER JOIN "Dept_emp" as de
ON e.emp_no = de.emp_no
INNER JOIN "department" as dep
ON de.dept_no = dep.dept_no




--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM "Employees"
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%'
SELECT * FROM "department";

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no,e.first_name, e.last_name,d.dept_name
FROM "Employees" e
INNER JOIN "Dept_emp" de
ON e.emp_no = de.emp_no
INNER JOIN "department" d
ON d.dept_no = de.dept_no
WHERE dept_name ='Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.first_name, e.last_name,d.dept_name
FROM "Employees" e
INNER JOIN "Dept_emp" de
ON e.emp_no = de.emp_no
INNER JOIN "department" d
ON d.dept_no = de.dept_no
WHERE dept_name ='Sales'
OR dept_name = 'Department'
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;
