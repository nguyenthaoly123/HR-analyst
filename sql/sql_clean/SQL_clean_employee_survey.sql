-- ĐẾM GIÁ TRỊ THIÊU CỦA BẢNG EMPLOYEE_SURVEY_DATA
SELECT
    SUM(
        CASE
            WHEN EnvironmentSatisfaction IS NULL THEN 1
            ELSE 0
        END
    ) AS miss_env,

    SUM(
        CASE
            WHEN JobSatisfaction IS NULL THEN 1
            ELSE 0
        END
    ) AS miss_job,

    SUM(
        CASE
            WHEN WorkLifeBalance IS NULL THEN 1
            ELSE 0
        END
    ) AS miss_wlb

FROM [dbo].[Employee_survey_data];

--CHUAN HOA VA CHUYEN DOI DU LIEU

;WITH Normalized AS
(
    SELECT
        TRY_CONVERT(
            INT,
            NULLIF(TRIM(CONVERT(VARCHAR(50), EmployeeID)), '')
        ) AS EmployeeID,

        TRY_CONVERT(
            DECIMAL(10,2),
            NULLIF(
                NULLIF(
                    UPPER(TRIM(REPLACE(REPLACE(
                        CONVERT(VARCHAR(50), EnvironmentSatisfaction),
                        CHAR(13), ''
                    ), CHAR(10), ''))),
                    ''
                ),
                'NA'
            )
        ) AS EnvironmentScore,

        TRY_CONVERT(
            DECIMAL(10,2),
            NULLIF(
                NULLIF(
                    UPPER(TRIM(REPLACE(REPLACE(
                        CONVERT(VARCHAR(50), JobSatisfaction),
                        CHAR(13), ''
                    ), CHAR(10), ''))),
                    ''
                ),
                'NA'
            )
        ) AS JobScore,

        TRY_CONVERT(
            DECIMAL(10,2),
            NULLIF(
                NULLIF(
                    UPPER(TRIM(REPLACE(REPLACE(
                        CONVERT(VARCHAR(50), WorkLifeBalance),
                        CHAR(13), ''
                    ), CHAR(10), ''))),
                    ''
                ),
                'NA'
            )
        ) AS WorkLifeScore

    FROM dbo.employee_survey_data
)

SELECT
    EmployeeID,

    CASE
        WHEN EnvironmentScore IN (1, 2, 3, 4)
        THEN CONVERT(TINYINT, EnvironmentScore)
        ELSE NULL
    END AS EnvironmentSatisfaction,

    CASE
        WHEN JobScore IN (1, 2, 3, 4)
        THEN CONVERT(TINYINT, JobScore)
        ELSE NULL
    END AS JobSatisfaction,

    CASE
        WHEN WorkLifeScore IN (1, 2, 3, 4)
        THEN CONVERT(TINYINT, WorkLifeScore)
        ELSE NULL
    END AS WorkLifeBalance

INTO dbo.clean_employee_survey
FROM Normalized;


-- KIEM TRA ID TRUOC KHI TAO PRIMARY KEY

-- Kiem tra ID NULL
SELECT *
FROM dbo.clean_employee_survey
WHERE EmployeeID IS NULL;

-- Kiem tra ID trung
SELECT EmployeeID, COUNT(*) AS DuplicateCount
FROM dbo.clean_employee_survey
GROUP BY EmployeeID
HAVING COUNT(*) > 1;


-- TAO PRIMARY KEY
  

ALTER TABLE dbo.clean_employee_survey
ALTER COLUMN EmployeeID INT NOT NULL;

ALTER TABLE dbo.clean_employee_survey
ADD CONSTRAINT PK_clean_survey
PRIMARY KEY (EmployeeID);


 -- XU LY GIA TRI THIEU BANG MODE
  

-- EnvironmentSatisfaction
UPDATE dbo.clean_employee_survey
SET EnvironmentSatisfaction =
(
    SELECT TOP 1 EnvironmentSatisfaction
    FROM dbo.clean_employee_survey
    WHERE EnvironmentSatisfaction IS NOT NULL
    GROUP BY EnvironmentSatisfaction
    ORDER BY COUNT(*) DESC, EnvironmentSatisfaction ASC
)
WHERE EnvironmentSatisfaction IS NULL;


-- JobSatisfaction
UPDATE dbo.clean_employee_survey
SET JobSatisfaction =
(
    SELECT TOP 1 JobSatisfaction
    FROM dbo.clean_employee_survey
    WHERE JobSatisfaction IS NOT NULL
    GROUP BY JobSatisfaction
    ORDER BY COUNT(*) DESC, JobSatisfaction ASC
)
WHERE JobSatisfaction IS NULL;


-- WorkLifeBalance
UPDATE dbo.clean_employee_survey
SET WorkLifeBalance =
(
    SELECT TOP 1 WorkLifeBalance
    FROM dbo.clean_employee_survey
    WHERE WorkLifeBalance IS NOT NULL
    GROUP BY WorkLifeBalance
    ORDER BY COUNT(*) DESC, WorkLifeBalance ASC
)
WHERE WorkLifeBalance IS NULL;



 --KIEM TRA SAU KHI CLEAN
-- Kiem tra so dong va so nhan vien duy nhat
SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT EmployeeID) AS UniqueEmployees
FROM dbo.clean_employee_survey;


-- Kiem tra NULL con lai
SELECT
    SUM(CASE WHEN EmployeeID IS NULL
             THEN 1 ELSE 0 END) AS MissingEmployeeID,

    SUM(CASE WHEN EnvironmentSatisfaction IS NULL
             THEN 1 ELSE 0 END) AS MissingEnvironment,

    SUM(CASE WHEN JobSatisfaction IS NULL
             THEN 1 ELSE 0 END) AS MissingJob,

    SUM(CASE WHEN WorkLifeBalance IS NULL
             THEN 1 ELSE 0 END) AS MissingWorkLife

FROM dbo.clean_employee_survey;


-- Kiem tra gia tri ngoai thang diem 1-4
SELECT *
FROM dbo.clean_employee_survey
WHERE EnvironmentSatisfaction NOT BETWEEN 1 AND 4
   OR JobSatisfaction NOT BETWEEN 1 AND 4
   OR WorkLifeBalance NOT BETWEEN 1 AND 4;

    
-- Xem bang da clean
SELECT *
FROM dbo.clean_employee_survey
ORDER BY EmployeeID;
