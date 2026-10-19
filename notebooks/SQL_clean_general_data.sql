-- Kiem tra EmployeeID NULL hoac trung
SELECT EmployeeID, COUNT(*) AS DuplicateCount
FROM dbo.general_data
GROUP BY EmployeeID
HAVING EmployeeID IS NULL OR COUNT(*) > 1;

-- Kiem tra gia tri thieu
SELECT
    SUM(CASE WHEN NumCompaniesWorked IS NULL
             THEN 1 ELSE 0 END) AS MissingNumCompaniesWorked,
    SUM(CASE WHEN TotalWorkingYears IS NULL
             THEN 1 ELSE 0 END) AS MissingTotalWorkingYears
FROM dbo.general_data;



--CHUAN HOA VA CHUYEN DOI DU LIEU

;WITH Normalized AS
(
    SELECT
        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), EmployeeID)), '')) AS EmployeeID,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), Age)), '')) AS Age,

        NULLIF(TRIM(CONVERT(VARCHAR(50), Attrition)), '')
            AS Attrition,

        NULLIF(TRIM(CONVERT(VARCHAR(100), BusinessTravel)), '')
            AS BusinessTravel,

        NULLIF(TRIM(CONVERT(VARCHAR(100), Department)), '')
            AS Department,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), DistanceFromHome)), ''))
            AS DistanceFromHome,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), Education)), '')) AS Education,

        NULLIF(TRIM(CONVERT(VARCHAR(100), EducationField)), '')
            AS EducationField,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), EmployeeCount)), ''))
            AS EmployeeCount,

        NULLIF(TRIM(CONVERT(VARCHAR(30), Gender)), '')
            AS Gender,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), JobLevel)), '')) AS JobLevel,

        NULLIF(TRIM(CONVERT(VARCHAR(100), JobRole)), '')
            AS JobRole,

        NULLIF(TRIM(CONVERT(VARCHAR(30), MaritalStatus)), '')
            AS MaritalStatus,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), MonthlyIncome)), ''))
            AS MonthlyIncome,

        TRY_CONVERT(DECIMAL(10,2), NULLIF(TRIM(
            CONVERT(VARCHAR(50), NumCompaniesWorked)), ''))
            AS NumCompaniesWorked,

        NULLIF(TRIM(CONVERT(VARCHAR(10), Over18)), '')
            AS Over18,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), PercentSalaryHike)), ''))
            AS PercentSalaryHike,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), StandardHours)), ''))
            AS StandardHours,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), StockOptionLevel)), ''))
            AS StockOptionLevel,

        TRY_CONVERT(DECIMAL(10,2), NULLIF(TRIM(
            CONVERT(VARCHAR(50), TotalWorkingYears)), ''))
            AS TotalWorkingYears,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), TrainingTimesLastYear)), ''))
            AS TrainingTimesLastYear,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), YearsAtCompany)), ''))
            AS YearsAtCompany,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), YearsSinceLastPromotion)), ''))
            AS YearsSinceLastPromotion,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), YearsWithCurrManager)), ''))
            AS YearsWithCurrManager

    FROM dbo.general_data
)

SELECT
    EmployeeID,
    Age,
    Attrition,
    BusinessTravel,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EmployeeCount,
    Gender,
    JobLevel,
    JobRole,
    MaritalStatus,
    MonthlyIncome,
    NumCompaniesWorked,
    Over18,
    PercentSalaryHike,
    StandardHours,
    StockOptionLevel,
    TotalWorkingYears,
    TrainingTimesLastYear,
    YearsAtCompany,
    YearsSinceLastPromotion,
    YearsWithCurrManager

INTO dbo.clean_general_data
FROM Normalized;


 -- KIEM TRA ID TRUOC KHI TAO PRIMARY KEY

SELECT *
FROM dbo.clean_general_data
WHERE EmployeeID IS NULL;

SELECT EmployeeID, COUNT(*) AS DuplicateCount
FROM dbo.clean_general_data
GROUP BY EmployeeID
HAVING COUNT(*) > 1;


ALTER TABLE dbo.clean_general_data
ALTER COLUMN EmployeeID INT NOT NULL;

ALTER TABLE dbo.clean_general_data
ADD CONSTRAINT PK_clean_general_data
PRIMARY KEY (EmployeeID);


 --KIEM TRA GIA TRI KHONG HOP LE


-- Cac gia tri ngoai pham vi hop ly cua bo du lieu nay
SELECT *
FROM dbo.clean_general_data
WHERE Age NOT BETWEEN 18 AND 60
   OR DistanceFromHome < 1
   OR Education NOT BETWEEN 1 AND 5
   OR JobLevel NOT BETWEEN 1 AND 5
   OR MonthlyIncome <= 0
   OR PercentSalaryHike NOT BETWEEN 11 AND 25
   OR StockOptionLevel NOT BETWEEN 0 AND 3
   OR TrainingTimesLastYear NOT BETWEEN 0 AND 6
   OR YearsAtCompany < 0
   OR YearsSinceLastPromotion < 0
   OR YearsWithCurrManager < 0
   OR TotalWorkingYears < 0
   OR NumCompaniesWorked < 0
   OR Attrition NOT IN ('Yes', 'No')
   OR BusinessTravel NOT IN
      ('Non-Travel', 'Travel_Rarely', 'Travel_Frequently')
   OR Gender NOT IN ('Female', 'Male')
   OR MaritalStatus NOT IN ('Single', 'Married', 'Divorced');




  -- DIEN NULL BANG MEDIAN

;WITH MedianValues AS
(
    SELECT DISTINCT
        PERCENTILE_CONT(0.5) WITHIN GROUP
            (ORDER BY NumCompaniesWorked) OVER ()
            AS MedianNumCompaniesWorked,

        PERCENTILE_CONT(0.5) WITHIN GROUP
            (ORDER BY TotalWorkingYears) OVER ()
            AS MedianTotalWorkingYears

    FROM dbo.clean_general_data
)
UPDATE T
SET
    NumCompaniesWorked =
        COALESCE(T.NumCompaniesWorked,
                 M.MedianNumCompaniesWorked),

    TotalWorkingYears =
        COALESCE(T.TotalWorkingYears,
                 M.MedianTotalWorkingYears)

FROM dbo.clean_general_data AS T
CROSS JOIN MedianValues AS M;



-- Kiem tra NULL
SELECT
    SUM(CASE WHEN EmployeeID IS NULL THEN 1 ELSE 0 END)
        AS MissingEmployeeID,

    SUM(CASE WHEN NumCompaniesWorked IS NULL THEN 1 ELSE 0 END)
        AS MissingNumCompaniesWorked,

    SUM(CASE WHEN TotalWorkingYears IS NULL THEN 1 ELSE 0 END)
        AS MissingTotalWorkingYears

FROM dbo.clean_general_data;

-- Kiem tra ID trung
SELECT EmployeeID, COUNT(*) AS DuplicateCount
FROM dbo.clean_general_data
GROUP BY EmployeeID
HAVING COUNT(*) > 1;

-- Xem du lieu sau khi clean
SELECT *
FROM dbo.clean_general_data
ORDER BY EmployeeID;
