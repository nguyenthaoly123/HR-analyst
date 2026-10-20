
# HR Analytics & Employee Attrition Analysis

An end-to-end HR analytics project using **SQL Server and Power BI** to analyze employee attrition, identify workforce patterns, explore factors associated with employee turnover, and support data-driven HR retention strategies.

## 1. Business Problem

Employee attrition presents a significant challenge for organizations, increasing recruitment costs, disrupting workforce productivity, and affecting long-term organizational performance.

In this dataset, **711 out of 4,410 employees have left the company**, representing an overall attrition rate of **16.12%**.

This project investigates the following business questions:

- What is the overall employee attrition rate, and how does it vary across departments and job roles?
- Which demographic groups, particularly by age and gender, experience higher attrition rates?
- How does employee tenure influence the likelihood of leaving the organization?
- Are employees who frequently work overtime associated with higher attrition rates?
- How do job satisfaction, environment satisfaction, and work-life balance relate to employee turnover?
- Are compensation, job level, and career progression associated with employee retention?
- What data-driven actions can HR teams prioritize to improve workforce stability?

## 2. Key Findings

- **Overall employee attrition:** The company records **711 employees leaving out of 4,410**, corresponding to an overall attrition rate of **16.12%**.

- **High attrition among new employees:** Employees with less than 2 years of tenure experience an attrition rate of approximately **34.88%** (225 out of 645 employees), more than twice the overall company attrition rate.

- **Higher attrition among younger employees:** Employees aged **25–34** account for **336 departures** and have an attrition rate of approximately **20.22%**, exceeding the company average of 16.12%.

- **Workforce segmentation:** Attrition patterns are examined across departments, job roles, employee demographics, tenure, and compensation to identify groups requiring further HR investigation.

- **Overtime and employee satisfaction:** Weekly attendance and employee survey data provide additional dimensions for evaluating potential relationships between workload, working conditions, satisfaction, and employee turnover.

## 3. Dashboard Preview

The Power BI dashboard provides an interactive overview of HR performance, employee attrition patterns, and workforce characteristics.

### Page1: Overview

## 3. Dashboard Preview

The Power BI dashboard is organized into **four main pages**, providing an interactive view of workforce composition, employee attrition patterns, and factors potentially associated with employee turnover.

### Page 1 — Overview

<img width="794" height="538" alt="OVERVIEW" src="https://github.com/user-attachments/assets/cbb2ce2b-412a-493e-9dfe-7846f1a05e14" />


The page also includes:
- Employee distribution over time
- Total employees by department
- Total employees by tenure group
- Total employees by age group

This overview helps HR stakeholders quickly understand the workforce size, structure, and overall attrition status.

### Page 2 — Demographics

<img width="827" height="646" alt="DEMOGRAPHICS" src="https://github.com/user-attachments/assets/6d05b4c8-c2e6-4a42-864c-ad28190e95c1" />


Main highlights include:
- **Average Age:** 36.92
- **Female Ratio:** 66.67%
- Employee distribution by age group
- Employee distribution by job level
- Employee distribution by job role
- Gender distribution by department
- Employee distribution by education field

This page helps identify the core workforce structure and the employee groups that make up the company.

### Page 3 — Attrition

<img width="827" height="667" alt="ATTRITION" src="https://github.com/user-attachments/assets/8a8ff4d3-3ed2-465a-a41b-32eb96df2c89" />



Main highlights include:
- **Total Attrition:** 711
- **Attrition Rate:** 16.12%
- Attrition rate and attrition amount by department
- Attrition amount by gender
- Attrition rate by job level
- Attrition amount by age group
- Attrition amount by tenure group
- Attrition analysis by job role

This page is designed to help HR teams identify which departments, roles, and employee segments experience higher turnover and may require targeted retention strategies.

This section summarizes key workforce indicators, including total employees, active employees, attrition count, attrition rate, and employee distribution across departments and demographic groups.

### Page 4— Key Drivers of Attrition

<img width="828" height="722" alt="KEY DRIVES OF ATTRITION" src="https://github.com/user-attachments/assets/150d6867-dd7f-4e15-a94e-bb1bd4ac792e" />


Main analyses include:
- Attrition rate by **environment satisfaction**
- Attrition rate by **work-life balance**
- Attrition amount by **income group and job level**
- Attrition amount by **job level and training times**
- Total employee and attrition amount by **years at company**
- Total employees by **working hours**

This page supports deeper analysis of the working conditions and employee characteristics that may be linked to higher turnover.


## 4. Tech Stack

| Technology | Purpose |
|---|---|
| SQL Server | Data cleaning, transformation, validation, and business analysis |
| SQL | Joins, CTEs, window functions, aggregations, and analytical queries |
| Power BI | Interactive dashboards, KPI monitoring, and HR data visualization |
| DAX | Business metric calculations and dynamic measures |
| Git & GitHub | Version control and project documentation |

## 5. Project Structure

```text
HR-analyst/
│
├── data/
│   ├── raw/
│   │   ├── general_data.csv
│   │   ├── employee_survey_data.csv
│   │   └── attendance_weekly.csv
│   └── readme.md
|   └── data_dictionanry.md
│
├── powerbi/
|   ├── screenshots
│   │   └── OVERVIEW.png
│   │   └── DEMOGRAPHICS.png
│   │   └── ATTRITION.png
|   │   └── KEY DRIVES OF ATTRITION.png
│   └── kpi_definitions.md
│
├── sql/
|   ├── sql_clean
│   |   └── SQL_clean_attendance_weekly.sql
│   │   └── SQL_clean_employee_survey.sql
│   │   └── SQL_clean_general_data.sql
│   │   └── readme.md
│   └── sql_question
│   │   └── Business_question.sql
│   │   └── readme.md
│
├── reports/
│   └── business_action.md
│   └── business_insight.md
│
└── README.md
```


### Directory and File Descriptions

| Directory / File | Description |
|---|---|
| `data/` | Contains the original HR datasets and supporting data documentation. |
| `data/raw/` | Stores three raw datasets covering employee information, satisfaction surveys, and weekly attendance records. |
| `data/readme.md` | Explains the dataset overview, data sources, structure, and usage instructions. |
| `data/data_dictionanry.md` | Documents dataset attributes, column definitions, data types, and business meanings. |
| `powerbi/` | Contains Power BI dashboard resources and KPI documentation. |
| `powerbi/screenshots/` | Stores screenshots of the four interactive Power BI dashboard pages. |
| `powerbi/screenshots/OVERVIEW.png` | Presents workforce KPIs, employee distribution by department, age, and tenure. |
| `powerbi/screenshots/DEMOGRAPHICS.png` | Analyzes workforce demographics, including age, gender, job roles, education fields, and job levels. |
| `powerbi/screenshots/ATTRITION.png` | Visualizes attrition rates and employee departures across departments, job roles, gender, age, and tenure groups. |
| `powerbi/screenshots/KEY DRIVES OF ATTRITION.png` | Explores factors associated with attrition, including satisfaction, work-life balance, income, training, and working hours. |
| `powerbi/kpi_definitions.md` | Defines HR KPIs, DAX measures, calculation logic, and business interpretations. |
| `sql/` | Contains SQL scripts for data cleaning, transformation, and business analysis. |
| `sql/sql_clean/` | Stores T-SQL scripts for cleaning and validating the three HR datasets. |
| `sql/sql_clean/SQL_clean_general_data.sql` | Cleans employee demographics, job characteristics, compensation, and career history data. |
| `sql/sql_clean/SQL_clean_employee_survey.sql` | Standardizes survey responses, handles missing values, and validates employee satisfaction scores. |
| `sql/sql_clean/SQL_clean_attendance_weekly.sql` | Cleans weekly attendance records and validates working hours, overtime, and reporting dates. |
| `sql/sql_clean/readme.md` | Documents SQL data cleaning procedures, validation rules, and cleaned output tables. |
| `sql/sql_question/` | Contains SQL queries designed to answer HR business questions and investigate employee attrition patterns. |
| `sql/sql_question/Business_question.sql` | Analyzes attrition across employee demographics, tenure, job roles, satisfaction, compensation, and overtime. |
| `sql/sql_question/readme.md` | Explains the business questions, SQL analytical approach, and query execution instructions. |
| `reports/` | Contains analytical findings and data-driven HR recommendations. |
| `reports/business_insight.md` | Summarizes key analytical findings, supporting evidence, and business implications related to employee attrition. |
| `reports/business_action.md` | Proposes actionable HR strategies for improving employee retention, onboarding, engagement, and workforce planning. |
| `README.md` | Provides the project overview, business problem, key findings, Power BI dashboard previews, technology stack, and documentation links. |



## 6. Data Source

The project uses three employee-level and attendance datasets:

1. **General Employee Data:** Demographic information, compensation, job characteristics, career history, and employee attrition.
2. **Employee Survey Data:** Satisfaction and work-life balance survey responses.
3. **Weekly Attendance Data:** Weekly attendance, working hours, and overtime information.

All three original datasets are available in the repository:

[View Raw HR Datasets](data/raw/)

## 7. Author

**Nguyen Thao Ly**

Information Technology Student | Data Analyst 

GitHub: [github.com/nguyenthaoly123](https://github.com/nguyenthaoly123)
