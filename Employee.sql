# Employee Data Analysis
# Initial exploration and staging of employee data.
SELECT * 
FROM emp;

# Creating a staging table to maintain a working copy of the employee data for analysis.
CREATE TABLE emp_staging 
LIKE emp;

# Inserting all employee data into the staging table.
INSERT emp_staging
SELECT * FROM emp;

# Verifying the data in the staging table.
SELECT * 
FROM emp_staging;

# Q. How many employees are in each department?
# This query groups employees by department and counts the number of employees in each department, sorted by department size in descending order.
SELECT 
    Department, count(*) count
FROM emp_staging
GROUP BY Department
ORDER BY count DESC;

# Q. What is the average salary in each department?
# This query calculates the average annual salary for each department and orders the results by the average salary in descending order.
SELECT 
    Department, avg(Annual_Salary) avg_annual_salary
FROM emp_staging
GROUP BY Department
ORDER BY avg_annual_salary DESC;

# Q. Who are the top 5 highest-paid employees in the company?
# Using a CTE (Common Table Expression) and the DENSE_RANK() window function, this query ranks employees by salary and retrieves the top 5 earners.
WITH top_5_highest_paid_employee AS 
(
    SELECT
        DENSE_RANK()
        OVER (ORDER BY Annual_Salary DESC) ranking,
        First_Name, Last_Name, Department, Annual_Salary
    FROM emp_staging
)
SELECT * 
FROM top_5_highest_paid_employee
WHERE ranking <= 5;

# Q. What is the salary range (min, max, average) by job title?
# This query computes the minimum, maximum, and average annual salary for each department (can be replaced with job title if applicable) and sorts by average salary.
SELECT 
    Department, 
    min(Annual_Salary) min_annual_salary, 
    avg(Annual_Salary) avg_annual_salary, 
    max(Annual_Salary) max_annual_salary
FROM emp_staging
GROUP BY Department
ORDER BY avg_annual_salary DESC;

# Q. How many employees were hired in each year?
# This query extracts the year from the hire date and counts the number of employees hired in each year, sorted chronologically.
SELECT 
    year(Start_Date) `year`, count(*)
FROM emp_staging
GROUP BY `year`
ORDER BY `year`;

# Q. What is the hiring trend across departments?
# This query identifies how many employees were hired in each department, helping to analyze hiring trends.
SELECT 
    Department, count(*) count
FROM emp_staging
GROUP BY Department
ORDER BY count DESC;

# Q. What is the gender ratio in the company?
# This query counts the number of male and female employees to provide insight into the company's gender distribution.
SELECT 
    Gender, count(*) count
FROM emp_staging
GROUP BY Gender;

# Q. How does average salary differ between genders in each department?
# Using a CASE statement and grouping by department, this query calculates the average salary for males and females in each department.
SELECT 
    Department,
    AVG(
        CASE 
        WHEN Gender = 'Male' THEN Annual_Salary 
        END
    ) AS avg_sal_male,
    AVG(
        CASE 
        WHEN Gender = 'Female' THEN Annual_Salary 
        END
    ) AS avg_sal_female
FROM emp_staging
GROUP BY Department
ORDER BY Department;

# Q. Which department has the highest total salary expense?
# This query calculates the total salary expense for each department and identifies which department has the highest expense.
SELECT 
    Department, 
    sum(Annual_Salary) total_salary_expense,
    count(*)
FROM emp_staging
GROUP BY Department
ORDER BY total_salary_expense DESC;

# Q. What is the average tenure of employees in each department?
# This query calculates the average tenure (in years) of employees in each department.
SELECT 
    Department, avg(`Years`) avg_tenure_in_years
FROM emp_staging
GROUP BY Department
ORDER BY avg_tenure_in_years DESC;

# Q. What is the average performance score by department?
# This query calculates the average performance score (out of 5) for each department to assess overall performance trends.
SELECT 
    Department, avg(Job_Rate) `out of 5`
FROM emp_staging
GROUP BY Department
ORDER BY `out of 5` DESC;

# Q. Which employees have the highest performance scores, and what are their roles?
# This query identifies employees with the highest performance score (5) along with their roles.
SELECT 
    First_Name, Last_Name, Department, Job_Rate
FROM emp_staging
WHERE Job_Rate = 5;

# Q. How many employees are working in each location?
# This query counts the number of employees working in each country or location, sorted by employee count.
SELECT 
    Country, count(*) employees
FROM emp_staging
GROUP BY Country
ORDER BY employees DESC;

# Q. What is the average salary by location?
# This query calculates the average salary of employees in each country.
SELECT 
    Country, avg(Annual_Salary) avg_salary
FROM emp_staging
GROUP BY Country
ORDER BY avg_salary DESC;

# Q. Which employees are in the top 10% salary bracket?
# Using PERCENT_RANK(), this query calculates the top 10% of employees based on their salaries.
WITH top_10_percent_salary AS
(
    SELECT 
        First_Name, Last_Name, Annual_Salary,
        PERCENT_RANK()
        OVER (ORDER BY Annual_Salary DESC) salary_percentile
    FROM emp_staging
)
SELECT First_Name, Last_Name, Annual_Salary
FROM top_10_percent_salary
WHERE salary_percentile <= 0.10;

# Q. Retrieve all employees in the "IT" department using this view.
# This query creates a view to store all employees in the IT department for easy access and retrieves the data.
CREATE VIEW IT_employees AS
    SELECT *
    FROM emp_staging
    WHERE Department = 'IT';

SELECT * 
FROM IT_employees;

# Q. Which employees have a tenure of more than 8 years?
# This query identifies employees with a tenure greater than 8 years.
SELECT 
	First_Name, Last_Name, Department, Years 
FROM 
	emp_staging 
WHERE 
	Years > 8;


# Q. Retrieve all employees working in "UAE" using this view.
# This query creates a view for employees working in the UAE and retrieves the data.
CREATE VIEW UAE_employee AS
    SELECT * 
    FROM emp_staging
    WHERE Country = 'United Arab Emirates';

SELECT * 
FROM UAE_employee;

# Final check of data in the staging table.
SELECT * 
FROM emp_staging;
