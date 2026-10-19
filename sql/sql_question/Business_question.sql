-- Câu 1: Tỷ lệ nghỉ việc của toàn công ty

SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM [dbo].[clean_general_data];

--Câu 2. Phòng ban có tỷ lệ nghỉ việc cao nhất
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
        AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition =  1 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM [dbo].[clean_general_data]
GROUP BY Department
ORDER BY attrition_rate DESC;

--Câu 3. Nhân viên có mức độ hài lòng công việc thấp có nghỉ việc nhiều hơn ko

SELECT
    s.JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN g.Attrition = 1 THEN 1 ELSE 0 END)
        AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN g.Attrition = 1 THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM [dbo].[clean_general_data] g
JOIN employee_survey_data s
    ON g.EmployeeID = s.EmployeeID
WHERE s.JobSatisfaction IS NOT NULL
GROUP BY s.JobSatisfaction
ORDER BY s.JobSatisfaction;

--Câu 4. Nhân viên nghỉ việc có mức lương trung bình thấp hơn người ở lại không?

WITH salary_summary AS (
    SELECT
        Department,
        ROUND(AVG(CASE
            WHEN Attrition = 1
            THEN CAST(MonthlyIncome AS FLOAT)
        END), 2) AS avg_salary_left,

        ROUND(AVG(CASE
            WHEN Attrition = 0
            THEN CAST(MonthlyIncome AS FLOAT)
        END), 2) AS avg_salary_stayed

    FROM [dbo].[clean_general_data]
    GROUP BY Department
)
SELECT
    Department,
    avg_salary_left,
    avg_salary_stayed,
    ROUND(
        avg_salary_stayed - avg_salary_left, 2
    ) AS salary_difference
FROM salary_summary
ORDER BY salary_difference DESC;



--câu 5: Nhân viên thường xuyên tăng ca có tỷ lệ nghỉ việc cao hơn không?

-- Câu 5: Nhân viên thường xuyên tăng ca có tỷ lệ nghỉ việc cao hơn không?

WITH overtime_summary AS (
    SELECT
        EmployeeID,
        SUM(OvertimeDays) AS total_overtime_days,
        COUNT(*) AS total_weeks,
        ROUND(
            AVG(CAST(OvertimeDays AS FLOAT)), 2
        ) AS avg_overtime_per_week
    FROM [dbo].[clean_attendance_weekly]
    GROUP BY EmployeeID
),
employee_overtime AS (
    SELECT
        g.EmployeeID,
        g.Attrition,
        o.avg_overtime_per_week,
        CASE
            WHEN o.avg_overtime_per_week < 1
                THEN 'Low'
            WHEN o.avg_overtime_per_week < 2
                THEN 'Medium'
            ELSE 'High'
        END AS overtime_group
    FROM [dbo].[clean_general_data] g
    JOIN overtime_summary o
        ON g.EmployeeID = o.EmployeeID
)
SELECT
    overtime_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 1
        THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 1
            THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS attrition_rate
FROM employee_overtime
GROUP BY overtime_group
ORDER BY attrition_rate DESC;






