# Data Documentation

## 1. Data Source

This project uses a Human Resources (HR) dataset containing employee demographics, job characteristics, compensation, satisfaction, and weekly attendance records.

- **Dataset:** HR Employee Attrition Dataset
- **Source:** HR dataset provided for this project
- **Data type:** Employee-level HR records, employee survey responses, and weekly attendance data
- **Purpose:** Employee attrition analysis, workforce demographics analysis, compensation and career development analysis, employee satisfaction analysis, and attendance and overtime analysis.

## 2. Dataset Structure

The original dataset contains the following tables:

| Table | Description |
|---|---|
| `general_data` | Employee demographics, job characteristics, compensation, career history, and attrition status |
| `employee_survey_data` | Employee satisfaction with the working environment, job satisfaction, and work-life balance |
| `attendance_weekly` | Weekly employee attendance records, including days worked, average working hours, and overtime days |

The `general_data` and `employee_survey_data` tables contain employee-level records, while `attendance_weekly` contains multiple weekly records for each employee.

All three tables can be linked using `EmployeeID`.

## 3. Data Processing

The raw datasets are processed using SQL clean,SQL analysis and Power BI visualization.

Main data preparation steps include:

- Inspecting data types, missing values, and duplicate records.
- Standardizing categorical values and converting data types.
- Processing weekly attendance dates and validating attendance records.
- Handling missing employee information and survey responses where appropriate.
- Validating employee identifiers and relationships between datasets.
- Aggregating weekly attendance records into employee-level metrics.
- Preparing cleaned datasets for downstream analysis and visualization.

Refer to the notebooks in the `notebooks/` directory for implementation details.

## 4. How to Obtain the Data

The original datasets are available in the `data/raw/` directory of this GitHub repository.

1. Clone or download this repository to your local machine.
2. Navigate to the `data/raw/` directory to access the three original CSV files:
   - `general_data.csv`
   - `employee_survey_data.csv`
   - `attendance_weekly.csv`
3. Run the data cleaning and preprocessing notebooks in the `notebooks/` directory.
4. Follow the SQL setup instructions to import the cleaned datasets into SQL Server.
5. Configure the data source paths in Power BI to load the processed data.

No additional dataset download is required.

## 5. Reproducibility Notes

The analysis results depend on the dataset version, data cleaning decisions, attendance aggregation methods, and metric definitions.

For consistent results, use the same source dataset and follow the documented preprocessing steps.

Employee attrition analysis should be performed at the employee level to avoid duplicate counting caused by weekly attendance records.
