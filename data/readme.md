# HR Analytics – Làm sạch dữ liệu nhân sự bằng SQL

## 1. Giới thiệu

Dự án làm sạch và chuẩn bị dữ liệu nhân sự của một công ty (4,410 nhân viên) bằng SQL, phục vụ phân tích nguyên nhân nghỉ việc (attrition), mức độ hài lòng và thời gian làm việc.

## 2. Dữ liệu

| File | Nội dung | Số dòng | Số cột |
|---|---|---|---|
| `general_data.csv` | Thông tin chung: nhân khẩu học, công việc, lương, thâm niên, nghỉ việc | 4,410 | 24 |
| `employee_survey_data.csv` | Khảo sát mức hài lòng của nhân viên | 4,410 | 4 |
| `attendance_weekly.csv` | Chấm công theo tuần (12/2014 – 12/2015) | 233,511 | 

### Quan hệ giữa các bảng

```
general_data (1) ──── (1) employee_survey_data     [EmployeeID]
general_data (1) ──── (N) attendance_weekly        [EmployeeID]
```

## 3. Vấn đề chất lượng dữ liệu đã phát hiện

| Bảng | Vấn đề | Hướng xử lý |
|---|---|---|
| `employee_survey_data` | `NA` ở `EnvironmentSatisfaction` (25), `JobSatisfaction` (20), `WorkLifeBalance` (38); cột bị import thành String | Chuyển `NA` → `NULL`, ép kiểu INT; quyết định giữ NULL hoặc điền (mode/median) |
| `general_data` | `NA` ở `NumCompaniesWorked` (19), `TotalWorkingYears` (9); cột bị import thành String | Chuyển `NA` → `NULL`, ép kiểu INT |
| `general_data` | Cột hằng số: `EmployeeCount`, `StandardHours`, `Over18` | Loại khỏi bảng phân tích |
| `general_data` | `MonthlyIncome` tính bằng rupee | Ghi rõ đơn vị khi trình bày |
| `attendance_weekly` | `WeekStart` là Date; bảng lớn (233k dòng) | Tạo index theo (`EmployeeID`, `WeekStart`), gom theo nhân viên khi join |
| Tất cả | Mã nhân viên là `EmployeeID` (CSV) nhưng `EmployeeNumber` (xlsx) | Thống nhất dùng `EmployeeID` |

Đã kiểm tra: không có dòng trùng, không trùng khóa (`EmployeeID`, `WeekStart`), tập `EmployeeID` của 3 bảng khớp nhau, `OvertimeDays` ≤ `DaysWorked`, `TotalWorkingYears` ≥ `YearsAtCompany`.

## 4. Quy trình thực hiện

1. **Import** 3 file CSV vào database (giữ các cột chứa `NA` ở dạng text).
2. **Profiling**: đếm dòng, NULL, giá trị duy nhất, min/max từng cột.
3. **Cleaning**: xử lý `NA`, ép kiểu, bỏ cột hằng số, kiểm tra tính nhất quán logic.
4. **Tổng hợp attendance**: tính theo nhân viên (tổng ngày làm, giờ làm TB, tổng ngày OT).
5. **Tạo bảng/view sạch** `clean_general_data`, `clean_employee_survey`, `clean_attendance_weekly`
6. **Câu hỏi phân tích**
7. **Phân tích / trực quan hóa** PowerBi.



.
