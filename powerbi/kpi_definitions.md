
# HR Analytics – KPI Definitions

## 1. Overview

This document defines the key performance indicators (KPIs) and analytical metrics used in the **HR Analytics Power BI Dashboard**.

The dashboard analyzes workforce demographics, employee attrition, compensation, satisfaction, and other potential drivers of employee turnover.

The report contains four analytical pages:

1. Overview
2. Demographics
3. Attrition
4. Key Drivers of Attrition

**Primary Objectives:**
- Monitor workforce size and employee retention.
- Understand employee demographics and organizational structure.
- Identify departments and employee groups with high attrition.
- Explore relationships between attrition, satisfaction, compensation, and career development.
- Support data-driven HR management and retention strategies.

---

## 2. Core HR KPIs

These KPIs are used across multiple dashboard pages to provide a consistent view of workforce performance.

| KPI | Definition | Business Purpose |
|---|---|---|
| Total Employees | Total number of unique employees | Measure workforce size |
| Total Attrition | Number of employees who left the company | Measure employee turnover volume |
| Attrition Rate | Percentage of employees who left | Evaluate workforce retention |
| Average Age | Average employee age | Understand workforce age profile |
| Average Monthly Income | Average employee monthly income | Analyze compensation levels |
| Average Tenure | Average years spent at the company | Evaluate workforce experience and stability |
| Female/Male Ratio | Ratio of female to male employees |  Assess gender composition |

### Dashboard KPI Results

| KPI | Value |
|---|---:|
| Total Employees | 4,410 |
| Total Attrition | 711 |
| Attrition Rate | 16.12% |
| Average Age | 36.92 years |
| Average Tenure | 7.01 years |
| Female/Male Ratio | 66.67% |

**Note:** The gender ratio represents the number of female employees relative to male employees, not the percentage of female employees in the entire workforce.

The average monthly income KPI is also displayed in the dashboard, but its full value is truncated in the screenshot.

---

## 3. Dashboard 1 – Overview
<img width="794" height="538" alt="OVERVIEW" src="https://github.com/user-attachments/assets/8e33afab-247e-4949-a25b-fb1a387bfedd" />


### Objective

Provide a high-level overview of workforce composition, employee distribution, tenure, and attrition.

This page helps HR managers monitor workforce characteristics and identify areas requiring further investigation.

### KPIs and Metrics

| Metric | Definition | 
|---|---|
| Total Employees | Unique employees in the dataset | 
| Average Monthly Income | Average monthly employee compensation | 
| Attrition Rate | Percentage of employees who left | 
| Average Tenure | Average employee tenure | 
| Employee Count by Date | Number of employees represented for each displayed date | 
| Employees by Age Group | Number of employees in each age group | 
| Employees by Department | Workforce distribution across departments |
| Employees by Tenure | Distribution of employees by tenure category |
### Dashboard Visualizations

| Visualization | Purpose |
|---|---|
| Employee Count by Date | Examine workforce count variations over the reporting period |
| Employees by Age Group | Identify the largest age segments |
| Employees by Department | Compare workforce size across departments |
| Employees by Tenure | Analyze employee experience and service duration |

### Key Findings

- The dataset contains **4,410 employees**, with an overall attrition rate of **16.12%**.
- Research & Development is the largest department, containing **2,883 employees**, followed by Sales with **1,338** and Human Resources with **189**.
- Employees aged **25–34** represent the largest age group, with **1,662 employees**.
- The **5–9 years** tenure group contains the largest number of employees, with **1,572 employees**.
- Average employee tenure is approximately **7.01 years**.

---

## 4. Dashboard 2 – Demographics
<img width="827" height="646" alt="DEMOGRAPHICS" src="https://github.com/user-attachments/assets/36900427-06c6-4d18-8ad8-1fa583488e31" />


### Objective

Analyze employee characteristics, including age, gender, job level, job role, education field, and department.

This page provides insights into workforce diversity, organizational structure, and employee distribution.

### KPIs and Metrics

| Metric | Definition | 
|---|---|
| Total Employees | Unique employees | 
| Average Age | Average age of employees | 
| Female/Male Ratio | Ratio of female to male employees | 
| Average Tenure | Average years of employee service | 
| Employees by Age Group | Number of employees by age segment | 
| Employees by Job Level | Employee distribution across job levels | 
| Employees by Job Role | Number of employees within each role | 
| Gender by Department | Gender distribution across departments | 
| Employees by Education Field | Distribution by education specialization | 

### Employee Age Distribution

| Age Group | Employees |
|---|---:|
| 18–25 | 291 |
| 25–34 | 1,662 |
| 35–44 | 1,515 |
| 45–54 | 735 |
| 55+ | 207 |
| **Total** | **4,410** |

### Job Level Distribution

| Job Level | Employees |
|---|---:|
| Level 1 | 1,629 |
| Level 2 | 1,602 |
| Level 3 | 654 |
| Level 4 | 318 |
| Level 5 | 207 |
| **Total** | **4,410** |

### Key Findings

- The average employee age is approximately **36.92 years**.
- Employees aged **25–44** form the majority of the workforce.
- Job Levels **1 and 2** account for most employees, indicating a workforce concentrated in lower and mid-level positions.
- Sales Executive and Research Scientist are the largest job roles, with **978** and **876** employees respectively.
- Life Sciences and Medical are the most common education fields.
- Male employees outnumber female employees across the organization.

---

## 5. Dashboard 3 – Attrition
<img width="827" height="667" alt="ATTRITION" src="https://github.com/user-attachments/assets/0800a31b-8d16-4923-906d-745484ea93f7" />


### Objective

Evaluate employee turnover across departments, job levels, job roles, gender, age groups, and tenure categories.

This dashboard helps identify employee groups with higher attrition risk and prioritize retention initiatives.

### KPIs and Metrics

| Metric | Definition | 
|---|---|
| Total Employees | Total unique employees | 
| Total Attrition | Employees who left the company | 
| Attrition Rate | Employee turnover percentage | 
| Average Tenure | Average years at the company |
| Department Attrition Rate | Attrition rate within each department | 
| Job Level Attrition Rate | Attrition rate within each job level | 
| Attrition by Gender | Departed employees grouped by gender |
| Attrition by Age Group | Departed employees grouped by age segment | 
| Attrition by Tenure | Departed employees grouped by tenure | 
| Job Role Attrition Rate | Attrition percentage within a job role |

### Attrition by Department

| Department | Attrition Count | Attrition Rate |
|---|---:|---:|
| Human Resources | 57 | 30.16% |
| Research & Development | 453 | 15.71% |
| Sales | 201 | 15.02% |
| **Total** | **711** | **16.12%** |

### Attrition by Gender

| Gender | Attrition Count | Share of Total Attrition |
|---|---:|---:|
| Male | 441 | 62.03% |
| Female | 270 | 37.97% |
| **Total** | **711** | **100%** |

**Note:** The percentages above represent each gender's share of all departed employees, not the attrition rate within each gender.

### Attrition by Job Role

| Job Role | Total Employees | Attrition Count | Attrition Rate |
|---|---:|---:|---:|
| Human Resources | 156 | 21 | 13.46% |
| Sales Representative | 249 | 36 | 14.46% |
| Manager | 306 | 42 | 13.73% |
| Manufacturing Director | 435 | 48 | 11.03% |
| Healthcare Representative | 393 | 57 | 14.50% |
| Research Director | 240 | 57 | 23.75% |
| Laboratory Technician | 777 | 126 | 16.22% |
| Research Scientist | 876 | 159 | 18.15% |
| Sales Executive | 978 | 165 | 16.87% |
| **Total** | **4,410** | **711** | **16.12%** |

### Key Findings

- Overall employee attrition is **16.12%**, representing **711 employees**.
- Human Resources has the highest departmental attrition rate at **30.16%**.
- Research & Development has the highest absolute attrition count, with **453 employees** leaving.
- Research Director has the highest attrition rate among the displayed job roles, at **23.75%**.
- Sales Executive has the highest attrition count among job roles, with **165 departures**.
- Employees aged **25–34** contribute the largest number of departures.
- Employees with less than **2 years of tenure** represent an important early-retention segment.

---

## 6. Dashboard 4 – Key Drivers of Attrition
<img width="828" height="722" alt="KEY DRIVES OF ATTRITION" src="https://github.com/user-attachments/assets/10e5d08e-3cc8-4cac-bcc6-83c6601713ec" />


### Objective

Explore potential factors associated with employee attrition, including satisfaction, work-life balance, income, job level, training, promotion, and working hours.

The analysis supports the identification of employee segments that may benefit from targeted retention strategies.

### KPIs and Metrics

| Metric | Definition | 
|---|---|
| Total Employees | Total number of employees | 
| Attrition Rate | Percentage of employees who left | 
| Average Monthly Income | Average employee monthly income | 
| Average Tenure | Average employee service years |
| Attrition by Environment Satisfaction | Attrition percentage for each satisfaction score | 
| Attrition by Work-Life Balance | Attrition percentage for each balance score | 
| Attrition by Income Group | Employee departures across income segments | 
| Attrition by Training | Departures by job level and training frequency | 
| Attrition by Promotion | Employee counts and departures across promotion categories | 
| Working Hours Distribution | Employee working-hour distribution | 

### Environment Satisfaction Analysis

| Satisfaction Score | Attrition Rate |
|---|---:|
| 1 | 25.27% |
| 2 | 15.04% |
| 3 | 13.81% |
| 4 | 13.45% |

**Finding:**

Employees with the lowest environment satisfaction score (1) have the highest observed attrition rate, at **25.27%**.

**Business Interpretation:**

Lower workplace satisfaction is associated with increased employee turnover in this dataset.

### Work-Life Balance Analysis

| Work-Life Balance Score | Attrition Rate |
|---|---:|
| 1 | 31.22% |
| 2 | 16.55% |
| 3 | 14.41% |
| 4 | 17.96% |

### Key Findings
- Employees with the lowest work-life balance score (1) have the highest attrition rate, reaching **31.22%**.
- Employees reporting low environment satisfaction experience higher attrition rates.
- Employees with poor work-life balance show particularly high attrition.
- Attrition counts are concentrated in lower job levels, which also contain most employees.
- Training frequency and promotion history provide additional dimensions for investigating retention patterns.
- Income group and job level analysis helps identify employee segments requiring further compensation review.

---

## 7. Data Model and KPI Calculation Rules

The HR dashboard uses employee information, satisfaction survey results, and attendance data.

### Data Sources

| Dataset | Description |
|---|---|
| Clean_general_data | Employee demographics, compensation, employment history, and attrition |
| Clean_employee_survey| Environment satisfaction, job satisfaction, and work-life balance |
| Clean_attendance_weekly| Working days, working hours, and overtime records |

### Data Relationships

The datasets are connected using `EmployeeID`.

- Clean_general_data → Clean_employee_survey: One-to-One (1:1).
- Clean_general_data →Clean_attendance_weekly: One-to-Many (1:N).


### Reporting Filters

The four dashboard pages include filters for:

- Department
- Date Range
- Month
- Quarter

These filters allow users to explore workforce metrics across different organizational segments and reporting periods.

**Important:** The exact DAX expressions, date relationship configuration, and historical employee-count logic should be verified against the original Power BI model before treating this document as a complete technical specification.

---

## 8. Business Applications

The HR Analytics dashboard supports the following business activities:

| Business Area | Application |
|---|---|
| Workforce Planning | Monitor employee distribution across departments, ages, and job levels |
| Employee Retention | Identify groups with higher attrition rates |
| Talent Management | Support training, promotion, and career development decisions |
| Compensation Analysis | Explore income patterns across employee segments |
| Employee Engagement | Examine workplace satisfaction and work-life balance |
| HR Reporting | Provide consistent workforce and attrition KPIs |

## 9. Conclusion

The HR Analytics Power BI Dashboard provides an integrated view of workforce demographics, employee attrition, and potential retention drivers.

By combining employee-level information with satisfaction and employment-related metrics, the dashboard supports exploratory analysis and data-driven HR decision-making.

The findings highlight the importance of workplace satisfaction, work-life balance, tenure, and career development in employee retention analysis.


