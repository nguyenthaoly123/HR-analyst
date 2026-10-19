# SQL Data Cleaning

## 1. Overview

This folder contains SQL scripts used to clean, transform, and validate the HR datasets for the **Employee Attrition Analytics** project.

The data cleaning process is performed using **Microsoft SQL Server (T-SQL)** to ensure data quality, consistency, and reliability before conducting business analysis and building Power BI dashboards.

The cleaning process focuses on:
- Handling missing and invalid values.
- Standardizing data types and formats.
- Checking duplicate records and primary keys.
- Applying appropriate missing-value imputation methods.
- Validating business rules and data consistency.
- Preparing clean datasets for further analysis.

## 2. SQL File Structure

| File | Description |
|---|---|
| `SQL_clean_general_data.sql` | Cleans employee demographic, job, compensation, and employment history data. |
| `SQL_clean_employee_survey.sql` | Cleans employee satisfaction and work-life balance survey data. |
| `SQL_clean_attendance_weekly.sql` | Cleans weekly attendance, working hours, and overtime data. |

## 3. Data Cleaning Process

### 3.1. General Employee Data

**File:** `SQL_clean_general_data.sql`

**Source:** `dbo.general_data`  
**Output:** `dbo.clean_general_data`

Key cleaning steps:

1. Identify missing values and duplicate employee IDs.
2. Standardize text fields using `TRIM()` and `NULLIF()`.
3. Convert numerical columns using `TRY_CONVERT()`.
4. Create the cleaned table using `SELECT INTO`.
5. Define `EmployeeID` as the primary key.
6. Validate employee attributes, including age, income, education, job level, and attrition status.
7. Handle missing values in `NumCompaniesWorked` and `TotalWorkingYears` using **median imputation** with `PERCENTILE_CONT(0.5)`.
8. Perform final data quality checks.

### 3.2. Employee Survey Data

**File:** `SQL_clean_employee_survey.sql`

**Source:** `dbo.employee_survey_data`  
**Output:** `dbo.clean_employee_survey`

Key cleaning steps:

1. Identify missing survey responses.
2. Remove unnecessary whitespace and line breaks.
3. Convert blank strings and `NA` values into SQL `NULL`.
4. Convert survey responses into numerical values using `TRY_CONVERT()`.
5. Validate satisfaction scores within the accepted range of **1–4**.
6. Check duplicate employee IDs and define `EmployeeID` as the primary key.
7. Handle missing values using **mode imputation** for:
   - `EnvironmentSatisfaction`
   - `JobSatisfaction`
   - `WorkLifeBalance`
8. Validate the cleaned survey data.

### 3.3. Weekly Attendance Data

**File:** `SQL_clean_attendance_weekly.sql`

**Source:** `dbo.attendance_weekly`  
**Output:** `dbo.clean_attendance_weekly`

Key cleaning steps:

1. Identify missing values in attendance-related columns.
2. Standardize numerical data types and convert `WeekStart` into SQL `DATE` format.
3. Create the cleaned attendance table.
4. Check duplicate records based on `EmployeeID` and `WeekStart`.
5. Define the composite primary key `(EmployeeID, WeekStart)`.
6. Validate attendance business rules:
   - `DaysWorked`: 1–5 days.
   - `AvgWorkHours`: greater than 0 and no more than 24 hours.
   - `OvertimeDays`: 0–5 days.
   - `OvertimeDays` must not exceed `DaysWorked`.
7. Check weekly date consistency.
8. Identify missing weekly records and gaps between consecutive weeks using `LAG()`.
9. Investigate unusual attendance patterns in the first recorded week.
10. Perform final data quality checks.

**Note:** Missing weekly records are identified for investigation but are not automatically generated or imputed.

## 4. Data Relationships

The three cleaned datasets are connected through `EmployeeID`.

| Table | Primary Key | Granularity |
|---|---|---|
| `clean_general_data` | `EmployeeID` | One record per employee |
| `clean_employee_survey` | `EmployeeID` | One record per employee |
| `clean_attendance_weekly` | `EmployeeID`, `WeekStart` | One record per employee per week |

**Logical relationships:**
- General Data → Employee Survey: One-to-One (1:1).
- General Data → Weekly Attendance: One-to-Many (1:N).

These relationships support employee-level analysis by combining demographic, satisfaction, and attendance information.

**Note:** The SQL scripts define primary keys but do not explicitly enforce foreign key constraints.

## 5. How to Run

**Requirements:**
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

**Steps:**

1. Download or clone the project repository.
2. Import the three original CSV files from `data/raw/` into SQL Server:
   - `general_data.csv`
   - `employee_survey_data.csv`
   - `attendance_weekly.csv`
3. Open the SQL scripts in SSMS.
4. Execute the scripts to generate the cleaned tables.
5. Review the validation query results to check missing values, duplicates, and invalid records.
6. Use the cleaned tables for subsequent HR analytics.

**Note:** The scripts create new tables using `SELECT INTO`. Ensure that the target cleaned tables do not already exist before rerunning the scripts.

## 6. Output Tables

After executing the scripts, three cleaned tables are created:

| Output Table | Purpose |
|---|---|
| `dbo.clean_general_data` | Employee demographics, job characteristics, and attrition analysis |
| `dbo.clean_employee_survey` | Employee satisfaction and work-life balance analysis |
| `dbo.clean_attendance_weekly` | Attendance patterns, working hours, and overtime analysis |

These cleaned datasets serve as the foundation for **SQL Business Analysis** and **Power BI Dashboard Development**.

## 7. Data Quality Notes

- Missing numerical values in selected employee attributes are handled using median imputation.
- Missing satisfaction scores are handled using mode imputation.
- Attendance records are validated for business-rule violations and missing weeks.
- Missing attendance weeks are not automatically filled.
- Validation queries may flag potential issues without automatically modifying the affected records.
- Attendance data should be aggregated to the employee level when calculating employee attrition metrics to avoid duplicate employee counting.

For more information, refer to the main project README.

