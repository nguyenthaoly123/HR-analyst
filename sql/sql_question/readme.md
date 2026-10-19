
# SQL Business Analysis – Employee Attrition

## 1. Overview

This SQL analysis explores key factors associated with employee attrition, including department, job satisfaction, monthly income, and overtime workload.

The main objectives are to:
- Measure the overall employee attrition rate.
- Identify departments with higher employee turnover.
- Examine the relationship between job satisfaction and attrition.
- Compare compensation between employees who left and those who stayed.
- Evaluate whether frequent overtime is associated with higher attrition.

## 2. SQL File

| File | Description |
|---|---|
| `Business_question.sql` | Contains five business questions analyzing employee attrition using SQL queries. |

### Data Sources

| Table | Description |
|---|---|
| `clean_general_data` | Employee demographics, job information, salary, and attrition status |
| `employee_survey_data` | Employee survey responses, including job satisfaction |
| `clean_attendance_weekly` | Weekly working days, hours, and overtime records |

The tables are connected through `EmployeeID`.

## 3. Business Questions & SQL Techniques

### Q1. What is the overall employee attrition rate?

**Business Objective:**

Calculate the percentage of employees who have left the company to understand the overall workforce turnover.

**SQL Techniques:**
- `COUNT()` – Count total employees.
- `SUM(CASE WHEN ...)` – Count employees who left.
- `ROUND()` – Calculate the attrition percentage.

**Key Metric:**

`Attrition Rate = Employees Left / Total Employees × 100`

**Business Value:**

Establish a baseline metric for monitoring employee retention and comparing attrition across different workforce segments.

---

### Q2. Which department has the highest attrition rate?

**Business Objective:**

Compare employee attrition rates across departments to identify areas with potentially higher retention risks.

**SQL Techniques:**
- `GROUP BY` – Aggregate employee records by department.
- `SUM(CASE WHEN ...)` – Calculate departed employees.
- `ORDER BY DESC` – Rank departments by attrition rate.

**Key Metrics:**
- Total employees by department.
- Number of employees who left.
- Department-level attrition rate.

**Business Value:**

Help HR identify departments requiring further investigation and prioritize retention initiatives.

---

### Q3. Are employees with lower job satisfaction more likely to leave?

**Business Objective:**

Investigate the relationship between employee job satisfaction and attrition.

**SQL Techniques:**
- `INNER JOIN` – Combine employee and survey datasets using `EmployeeID`.
- `WHERE IS NOT NULL` – Exclude missing job satisfaction responses.
- `GROUP BY` – Segment employees by job satisfaction score.
- Conditional aggregation – Calculate attrition rates within each satisfaction group.

**Key Metrics:**
- Employee count by satisfaction level.
- Employees who left by satisfaction level.
- Attrition rate by satisfaction level.

**Business Value:**

Assess whether employee satisfaction may be an important indicator of retention risk and support employee engagement strategies.

---

### Q4. Do employees who leave earn less than employees who stay?

**Business Objective:**

Compare average monthly income between employees who left and those who remained, within each department.

**SQL Techniques:**
- `WITH ... AS` (CTE) – Organize intermediate salary calculations.
- `AVG(CASE WHEN ...)` – Calculate conditional averages for different attrition groups.
- `CAST()` – Convert income values for numerical calculations.
- `GROUP BY` – Calculate salary metrics by department.
- Derived calculations – Measure the average salary difference.

**Key Metrics:**
- Average monthly income of employees who left.
- Average monthly income of employees who stayed.
- Salary difference between the two groups.

**Business Value:**

Identify compensation differences associated with employee turnover and provide supporting information for salary and retention reviews.

---

### Q5. Does frequent overtime increase employee attrition?

**Business Objective:**

Analyze whether employees with higher average overtime frequency experience higher attrition rates.

**SQL Techniques:**
- Multiple CTEs – Build a multi-step analytical query.
- `SUM()`, `COUNT()`, `AVG()` – Aggregate weekly attendance records.
- `GROUP BY EmployeeID` – Transform weekly records into employee-level metrics.
- `INNER JOIN` – Combine aggregated overtime data with employee attrition information.
- `CASE WHEN` – Create overtime frequency categories.
- Conditional aggregation – Compare attrition rates between groups.

**Analysis Workflow:**

1. Aggregate weekly attendance records for each employee.
2. Calculate average overtime days per week.
3. Join employee-level overtime metrics with attrition data.
4. Classify employees into overtime groups.
5. Compare attrition rates across these groups.

**Overtime Segmentation:**

| Overtime Group | Average Overtime Days per Week |
|---|---|
| Low | Less than 1 |
| Medium | From 1 to less than 2 |
| High | 2 or more |

**Business Value:**

Investigate potential relationships between overtime workload and employee turnover to support workforce planning and workload management.

## 4. SQL Skills Demonstrated

This analysis demonstrates the application of SQL to solve real-world HR business problems.

| SQL Skill | Application |
|---|---|
| `SELECT`, `WHERE` | Retrieve and filter relevant employee records |
| `INNER JOIN` | Combine information across HR datasets |
| `GROUP BY` | Aggregate data by department, satisfaction, and overtime category |
| `COUNT()`, `SUM()`, `AVG()` | Calculate workforce and compensation metrics |
| `CASE WHEN` | Apply conditional logic and employee segmentation |
| Conditional Aggregation | Calculate attrition metrics for specific employee groups |
| Common Table Expressions (CTEs) | Break complex analytical queries into structured steps |
| `CAST()` | Convert numerical values for calculations |
| `ROUND()` | Format calculated business metrics |
| `ORDER BY` | Rank and compare employee groups |
| Data Granularity Management | Aggregate weekly attendance data to employee-level records |


## 5. How to Run

**Requirements:**
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

**Steps:**

1. Import and prepare the HR datasets in SQL Server.
2. Execute the SQL data cleaning scripts to generate the required cleaned tables.
3. Open `Business_question.sql` in SSMS.
4. Select the database containing the required HR tables.
5. Execute each business question query.
6. Review the query results and compare the attrition metrics across employee groups.

## 6. Analytical Outcomes

The SQL queries produce five analytical outputs:

| Analysis | Output |
|---|---|
| Overall Attrition | Company-wide employee attrition rate |
| Department Attrition | Attrition rate comparison across departments |
| Job Satisfaction | Attrition rate by job satisfaction score |
| Salary Comparison | Average salary differences between departed and retained employees |
| Overtime Analysis | Attrition rates across overtime frequency groups |

These outputs provide a foundation for HR reporting, retention analysis, and Power BI dashboard development.

## 7. Conclusion

This SQL project demonstrates how employee data can be transformed into meaningful business metrics through aggregation, joins, conditional logic, and Common Table Expressions.

The analysis focuses on identifying patterns associated with employee attrition and supporting data-driven HR decision-making.

The results describe associations rather than proving causal relationships between employee characteristics and turnover.

