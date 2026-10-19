# Data Dictionary – HR Dataset

Tài liệu mô tả 3 bảng dữ liệu thô: `employee_survey_data.csv`, `general_data.csv`, `attendance_weekly.csv`.


## 1. Quan hệ giữa các bảng

| Bảng | Số dòng | Khóa |
|---|---|---|
| `general_data` | 4,410 | `EmployeeID` (PK) |
| `employee_survey_data` | 4,410 | `EmployeeID` (PK, FK → general_data) |
| `attendance_weekly` | 233,511 | (`EmployeeID`, `WeekStart`) (PK, FK → general_data) |

- Cả 3 bảng có cùng tập 4,410 `EmployeeID` (join 1–1 giữa `general_data` và `employee_survey_data`, 1–N với `attendance_weekly`).
- Mỗi nhân viên có 51–53 tuần chấm công (trung bình ~53).

---

## 2. `employee_survey_data.csv` (4,410 dòng, 4 cột)

| Cột | Kiểu | Mô tả | Giá trị / Ý nghĩa |
|---|---|---|---|
| `EmployeeID` | Integer | Mã nhân viên | 1 – 4410, duy nhất |
| `EnvironmentSatisfaction` | Integer  | Mức hài lòng với môi trường làm việc | 1 = Low, 2 = Medium, 3 = High, 4 = Very High |
| `JobSatisfaction` | Integer  | Mức hài lòng với công việc | 1 = Low, 2 = Medium, 3 = High, 4 = Very High |
| `WorkLifeBalance` | Integer  | Mức cân bằng công việc – cuộc sống | 1 = Bad, 2 = Good, 3 = Better, 4 = Best | 

> Cả 3 cột được import là String vì chứa chuỗi `NA`; cần chuyển `NA` → `NULL` rồi ép sang INT.

---

## 3. `general_data.csv` (4,410 dòng, 24 cột)

### 3.1 Thông tin cá nhân

| Cột | Kiểu | Mô tả | Giá trị / Khoảng | 
|---|---|---|---|
| `EmployeeID` | Integer | Mã nhân viên (PK) | 1 – 4410 |
| `Age` | Integer | Tuổi | 18 – 60 | 
| `Gender` | String | Giới tính | Male, Female | 
| `MaritalStatus` | String | Tình trạng hôn nhân | Married, Single, Divorced |
| `Education` | Integer (ordinal) | Trình độ học vấn | 1 = Below College, 2 = College, 3 = Bachelor, 4 = Master, 5 = Doctor | 
| `EducationField` | String | Chuyên ngành học | Life Sciences, Medical, Marketing, Technical Degree, Other, Human Resources |
| `DistanceFromHome` | Integer | Khoảng cách từ nhà đến công ty (km) | 1 – 29 |
| `Over18` | String | Trên 18 tuổi? | Chỉ có `Y` (hằng số) | 

### 3.2 Thông tin công việc

| Cột | Kiểu | Mô tả | Giá trị / Khoảng | 
|---|---|---|---|
| `Department` | String | Phòng ban | Research & Development, Sales, Human Resources | 
| `JobRole` | String | Vị trí công việc | 9 giá trị: Sales Executive, Research Scientist, Laboratory Technician, Manufacturing Director, Healthcare Representative, Manager, Sales Representative, Research Director, Human Resources | 
| `JobLevel` | Integer | Cấp bậc công việc | 1 – 5 | 
| `BusinessTravel` | String | Tần suất đi công tác năm trước | Non-Travel, Travel_Rarely, Travel_Frequently | 
| `Attrition` | String | Nhân viên đã nghỉ việc năm trước? (biến mục tiêu) | Yes (711), No (3,699) | 

### 3.3 Lương, thưởng, đào tạo

| Cột | Kiểu | Mô tả | Giá trị / Khoảng |
|---|---|---|---|
| `MonthlyIncome` | Integer | Thu nhập hàng tháng (đơn vị: rupee) | 10,090 – 199,990 | 
| `PercentSalaryHike` | Integer | % tăng lương năm trước | 11 – 25 | 
| `StockOptionLevel` | Integer | Mức quyền chọn cổ phiếu | 0 – 3 | 
| `TrainingTimesLastYear` | Integer | Số lần được đào tạo năm trước | 0 – 6 | 

### 3.4 Kinh nghiệm & thâm niên

| Cột | Kiểu | Mô tả | Giá trị / Khoảng |
|---|---|---|---|
| `NumCompaniesWorked` | Integer | Số công ty đã từng làm | 0 – 9 |
| `TotalWorkingYears` | Integer | Tổng số năm đi làm | 0 – 40 |
| `YearsAtCompany` | Integer | Số năm làm tại công ty hiện tại | 0 – 40 | 
| `YearsSinceLastPromotion` | Integer | Số năm kể từ lần thăng chức gần nhất | 0 – 15 | 
| `YearsWithCurrManager` | Integer | Số năm làm với quản lý hiện tại | 0 – 17 | 

### 3.5 Cột hằng số (không mang thông tin phân tích)

| Cột | Giá trị duy nhất | Ghi chú |
|---|---|---|
| `EmployeeCount` | 1 | Luôn = 1 |
| `StandardHours` | 8 | Giờ làm chuẩn/ngày, luôn = 8 |
| `Over18` | Y | Luôn = Y |

> `NumCompaniesWorked` và `TotalWorkingYears` được import là String vì chứa `NA`.

---

## 4. `attendance_weekly.csv` (233,511 dòng, 5 cột)

| Cột | Kiểu | Mô tả | Giá trị / Khoảng | 
|---|---|---|---|
| `EmployeeID` | Integer | Mã nhân viên (FK → general_data) | 1 – 4410 | 
| `WeekStart` | Date | Ngày bắt đầu tuần (luôn là thứ Hai) | 2014-12-29 → 2015-12-28 (53 tuần) | 
| `DaysWorked` | Integer | Số ngày đi làm trong tuần | 1 – 5 | 
| `AvgWorkHours` | Float | Số giờ làm trung bình mỗi ngày trong tuần | 4.73 – 11.54 (TB ≈ 7.70) | 
| `OvertimeDays` | Integer | Số ngày làm thêm giờ trong tuần | 0 – 5 | 

---


