-- Kiem tra gia tri thieu
SELECT
    SUM(CASE WHEN DaysWorked IS NULL
             THEN 1 ELSE 0 END) AS MissingDaysWorked,
    SUM(CASE WHEN AvgWorkHours IS NULL
             THEN 1 ELSE 0 END) AS MissingAvgWorkHours,
    SUM(CASE WHEN OvertimeDays IS NULL
             THEN 1 ELSE 0 END) AS MissingOvertimeDays
FROM dbo.attendance_weekly;



--CHUAN HOA VA CHUYEN DOI DU LIEU

;WITH Normalized AS
(
    SELECT
        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), EmployeeID)), '')) AS EmployeeID,

        TRY_CONVERT(DATE, NULLIF(TRIM(
            CONVERT(VARCHAR(50), WeekStart)), ''), 23) AS WeekStart,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), DaysWorked)), ''))
            AS DaysWorked,

        TRY_CONVERT(DECIMAL(5,2), NULLIF(TRIM(
            CONVERT(VARCHAR(50), AvgWorkHours)), ''))
            AS AvgWorkHours,

        TRY_CONVERT(INT, NULLIF(TRIM(
            CONVERT(VARCHAR(50), OvertimeDays)), ''))
            AS OvertimeDays

    FROM dbo.attendance_weekly
)

SELECT
    EmployeeID,
    WeekStart,
    DaysWorked,
    AvgWorkHours,
    OvertimeDays

INTO dbo.clean_attendance_weekly
FROM Normalized;


 -- KIEM TRA KHOA TRUOC KHI TAO PRIMARY KEY

SELECT *
FROM dbo.clean_attendance_weekly
WHERE EmployeeID IS NULL OR WeekStart IS NULL;

SELECT EmployeeID, WeekStart, COUNT(*) AS DuplicateCount
FROM dbo.clean_attendance_weekly
GROUP BY EmployeeID, WeekStart
HAVING COUNT(*) > 1;


ALTER TABLE dbo.clean_attendance_weekly
ALTER COLUMN EmployeeID INT NOT NULL;

ALTER TABLE dbo.clean_attendance_weekly
ALTER COLUMN WeekStart DATE NOT NULL;

ALTER TABLE dbo.clean_attendance_weekly
ADD CONSTRAINT PK_clean_attendance_weekly
PRIMARY KEY (EmployeeID, WeekStart);


 --KIEM TRA GIA TRI KHONG HOP LE


-- Cac gia tri ngoai pham vi hop ly cua bo du lieu nay
SELECT *
FROM dbo.clean_attendance_weekly
WHERE DaysWorked NOT BETWEEN 1 AND 5
   OR AvgWorkHours <= 0
   OR AvgWorkHours > 24
   OR OvertimeDays NOT BETWEEN 0 AND 5
   OR OvertimeDays > DaysWorked;

SELECT *
FROM dbo.clean_attendance_weekly
WHERE DATEDIFF(DAY, '19000101', WeekStart) % 7 <> 0;




 -- KIEM TRA TUAN BI THIEU (KHONG DIEN)

-- Nhan vien co it hon so tuan toi da
SELECT EmployeeID, COUNT(*) AS WeeksRecorded
FROM dbo.clean_attendance_weekly
GROUP BY EmployeeID
HAVING COUNT(*) < (SELECT COUNT(DISTINCT WeekStart)
                   FROM dbo.clean_attendance_weekly);



-- Khoang trong giua 2 tuan lien tiep (> 7 ngay)
;WITH Gaps AS
(
    SELECT
        EmployeeID,
        WeekStart,
        DATEDIFF(DAY,
                 LAG(WeekStart) OVER (PARTITION BY EmployeeID
                                      ORDER BY WeekStart),
                 WeekStart) AS GapDays
    FROM dbo.clean_attendance_weekly
)
SELECT *
FROM Gaps
WHERE GapDays > 7;




-- Tuan dau tien (29/12/2014) co DaysWorked = 1 o hau het nhan vien
SELECT WeekStart, DaysWorked, COUNT(*) AS N
FROM dbo.clean_attendance_weekly
WHERE DaysWorked <= 2
GROUP BY WeekStart, DaysWorked
ORDER BY N DESC;





-- Kiem tra NULL
-- (bang attendance khong co NULL nen KHONG can buoc dien median nhu general)
SELECT
    SUM(CASE WHEN EmployeeID IS NULL THEN 1 ELSE 0 END)
        AS MissingEmployeeID,

    SUM(CASE WHEN WeekStart IS NULL THEN 1 ELSE 0 END)
        AS MissingWeekStart,

    SUM(CASE WHEN DaysWorked IS NULL THEN 1 ELSE 0 END)
        AS MissingDaysWorked,

    SUM(CASE WHEN AvgWorkHours IS NULL THEN 1 ELSE 0 END)
        AS MissingAvgWorkHours,

    SUM(CASE WHEN OvertimeDays IS NULL THEN 1 ELSE 0 END)
        AS MissingOvertimeDays

FROM dbo.clean_attendance_weekly;


-- Xem du lieu sau khi clean
SELECT TOP 100 *
FROM dbo.clean_attendance_weekly
ORDER BY EmployeeID, WeekStart;