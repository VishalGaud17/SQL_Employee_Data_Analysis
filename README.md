# Employee Data Analysis using SQL

## 📌 Overview
This project performs **Employee Data Analysis** using SQL to extract key insights about workforce trends, salary distributions, hiring patterns, and performance evaluations. A **staging table** is used to preserve the original data while enabling transformations and analysis.

## 🔍 Key Analyses
- **Employee Distribution:** Count of employees per department & location
- **Salary Insights:** Average salary, salary range, and highest earners
- **Hiring Trends:** Yearly hiring trends and department-wise hiring patterns
- **Performance Evaluation:** Department-wise average performance scores & top performers
- **Gender & Location-based Salary Analysis**
- **Employee Tenure Analysis**
- **Views for Quick Access:** IT department employees, UAE-based employees

## 🏗 Project Structure
### 📂 SQL Queries
- `employee_data_analysis.sql` → Contains all the queries for staging, exploration, and insights

### 📂 Data 
- `employee_dataset.csv` → Sample dataset 

## 🚀 Queries Included
### 1️⃣ Data Staging & Exploration
- Creating a **staging table (`emp_staging`)**
- Verifying data integrity

### 2️⃣ Workforce Insights
✔ Number of employees per department  
✔ Gender distribution  
✔ Employees hired per year  
✔ Hiring trends by department  

### 3️⃣ Salary Analysis
✔ Average salary per department  
✔ Top 5 highest-paid employees  
✔ Salary range (min, max, average) by job title  
✔ Top 10% salary bracket employees  
✔ Department with the highest total salary expense  

### 4️⃣ Performance Evaluation
✔ Average performance score per department  
✔ Employees with top performance scores (5/5)  

### 5️⃣ Tenure Analysis
✔ Average tenure per department  
✔ Employees with tenure greater than 8 years  

### 6️⃣ Views for Quick Access
✔ View for IT department employees  
✔ View for UAE-based employees  

## 🔧 Technologies Used
- **SQL (MySQL / PostgreSQL / SQL Server)**
- **CTEs & Window Functions** (`DENSE_RANK`, `PERCENT_RANK`)
- **Aggregations** (`SUM`, `AVG`, `COUNT`)
- **CASE statements** for conditional calculations
