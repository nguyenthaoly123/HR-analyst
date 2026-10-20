# Business Insights – HR Employee Attrition

## Business Question

**Which employees are most likely to leave, and what can HR do to reduce attrition?**

The dataset covers **4,410 employees**, of whom **711 left (16.12% attrition rate)**. Average age is 36.92 years and average tenure is 7.01 years.

The insights below combine three sources of evidence:

- **Power BI dashboard** (Overview, Demographics, Attrition, Key Drivers of Attrition) for the headline KPIs and segment views.
- **SQL business questions** (`sql/sql_question/Business_question.sql`) for overall attrition, department, job satisfaction, salary, and overtime.
- **Additional segment analysis** on the cleaned tables (`clean_general_data`, `clean_employee_survey`, `clean_attendance_weekly`) to test which factors remain important when compared side by side.

---

## Insight 1: Overtime Is the Strongest Attrition Signal

### Finding
Employees who work overtime on a regular basis leave at nearly **three times** the rate of employees who rarely do.

### Evidence

Overtime group = average overtime days per week.

| Overtime Group | Employees | Left | Attrition Rate |
|---|---:|---:|---:|
| Low (< 1 day/week) | 2,738 | 282 | 10.30% |
| Medium (1 to < 2) | 286 | 41 | 14.34% |
| High (≥ 2 days/week) | 1,386 | 388 | 27.99% |

- The High group is **31.4% of the workforce** but accounts for **about 55% of all departures** (388 of 711).
- Employees who left averaged **2.44 overtime days/week** versus **1.24** for those who stayed, and worked overtime in **62%** of weeks versus **37%**.
- Average daily hours: **8.32 h** (left) vs **7.58 h** (stayed).
- The pattern holds inside every department:

| Department | Low Overtime | High Overtime |
|---|---:|---:|
| Human Resources | 19.4% | 44.3% |
| Research & Development | 9.0% | 28.5% |
| Sales | 11.8% | 23.6% |

- There is a threshold around the standard **8-hour day**:

| Avg Daily Hours | Attrition Rate |
|---|---:|
| Below 7 h | 10.41% |
| 7–8 h | 10.84% |
| 8–9 h | 28.80% |
| 9 h and above | 29.15% |

- When age, tenure, income, satisfaction scores, travel, and marital status are considered together in a logistic regression, overtime remains the strongest single factor (odds ratio ≈ 2.7 per one standard deviation), ahead of tenure and age.

### So what?
Sustained overtime is the clearest and most actionable risk signal in this dataset. The jump appears once the average day goes beyond 8 hours, which suggests a workload threshold HR and managers can monitor directly rather than relying on surveys.

---

## Insight 2: Overtime Is Not Captured by the Work-Life Balance Survey

### Finding
Self-reported work-life balance and measured overtime tell two different stories, so the survey alone will miss many at-risk employees.

### Evidence

| Work-Life Balance Score | Employees | Attrition Rate | Share With High Overtime |
|---|---:|---:|---:|
| 1 – Bad | 239 | 31.38% | 28.5% |
| 2 – Good | 1,019 | 16.78% | 31.9% |
| 3 – Better | 2,698 | 14.23% | 32.2% |
| 4 – Best | 454 | 17.84% | 27.3% |

- The share of employees with high overtime is almost the same (27–32%) at every work-life balance score.
- Score 1 has the highest attrition (31.38%) but contains only **239 employees (5.4%)**.
- The relationship is **not monotonic**: score 4 (17.84%) is higher than score 3 (14.23%).

### So what?
Employees can report a good balance and still work long overtime hours. Combining survey results with attendance data gives HR a more reliable view than either source alone.

---

## Insight 3: Attrition Is Concentrated Among Young and New Employees

### Finding
The youngest and newest employees leave at the highest rates. Risk falls quickly after the first years and stabilizes at around 10%.

### Evidence

| Age Group | Employees | Attrition Rate |
|---|---:|---:|
| 18–24 | 291 | 39.18% |
| 25–34 | 1,662 | 20.22% |
| 35–44 | 1,515 | 10.10% |
| 45–54 | 735 | 10.20% |
| 55+ | 207 | 15.94% |

| Tenure | Employees | Attrition Rate |
|---|---:|---:|
| 0–1 year | 645 | 34.88% |
| 2–4 years | 1,095 | 18.08% |
| 5–9 years | 1,572 | 11.07% |
| 10–19 years | 819 | 10.62% |
| 20+ years | 279 | 9.68% |

- Employees with **0–1 year** of tenure are **14.6% of the workforce** but **31.6% of all departures** (225 of 711).
- Employees under 35 are 44% of the workforce but 63% of departures.
- Employees with **0 years under their current manager** have a 32.3% attrition rate, versus 11.0% for those with 6+ years.
- Overtime strengthens the effect: new employees (0–1 year) with high overtime leave at **54.3%**, versus **24.1%** for new employees with low overtime. Employees aged 18–24 with high overtime leave at **65.7%**.

### So what?
The Attrition dashboard highlights the **25–34** group because it has the most departures (336). That is a volume effect: the **18–24** group has about twice the rate (39.2% vs 20.2%) but is much smaller (291 employees). Retention effort should start in the first year: onboarding, a realistic first-year workload, and a stable manager relationship.

---

## Insight 4: Low Satisfaction Scores Mark a Clear Risk Group

### Finding
Employees who give the lowest score on environment or job satisfaction leave far more often than everyone else. The difference between scores 2, 3, and 4 is small.

### Evidence

| Score | Environment Satisfaction | Job Satisfaction (SQL Q3) |
|---|---:|---:|
| 1 – Low | 25.21% | 22.91% |
| 2 – Medium | 14.95% | 16.43% |
| 3 – High | 13.89% | 16.55% |
| 4 – Very High | 13.42% | 11.32% |

- About **19% of employees** gave the lowest score for each measure (845 for environment, 860 for job satisfaction).
- Environment score 1 vs score 4: a gap of **11.8 percentage points**.
- Job satisfaction does not decline smoothly: scores 2 and 3 are nearly identical (16.43% vs 16.55%).
- Overtime and low environment satisfaction together are especially risky: **45.9%** attrition (218 employees).

### So what?
The most useful signal is the lowest score, not the gradient between scores. A simple rule such as "follow up with anyone scoring 1" captures most of the survey's value.

---

## Insight 5: Frequent Business Travel and Single Status Are Associated With Higher Attrition

### Finding
Employees who travel frequently leave at about three times the rate of those who do not travel.

### Evidence

| Business Travel | Employees | Attrition Rate |
|---|---:|---:|
| Non-Travel | 450 | 8.00% |
| Travel Rarely | 3,129 | 14.96% |
| Travel Frequently | 831 | 24.91% |

| Marital Status | Employees | Attrition Rate |
|---|---:|---:|
| Divorced | 981 | 10.09% |
| Married | 2,019 | 12.48% |
| Single | 1,410 | 25.53% |

- Frequent travelers are **18.8% of employees**; high overtime and frequent travel together give **39.3%** attrition (280 employees).
- Single employees who travel frequently reach **38.5%** attrition.

### So what?
Travel demand is a controllable job design factor, so a review of travel requirements for frequent travelers (especially early-career staff) is worth considering. Marital status is a descriptive pattern only and should **not** be used for individual HR decisions.

---

## Insight 6: Department and Role Differences Need Careful Reading

### Finding
Human Resources has the highest department attrition **rate**, R&D has the highest **volume**, and the HR result should be treated cautiously.

### Evidence

| Department | Employees | Left | Attrition Rate |
|---|---:|---:|---:|
| Human Resources | 189 | 57 | 30.16% |
| Research & Development | 2,883 | 453 | 15.71% |
| Sales | 1,338 | 201 | 15.02% |

- HR also has the highest share of high-overtime employees (**41.8%** vs 31.7% in R&D and 29.4% in Sales), but even its low-overtime employees leave at 19.4%, which is higher than in other departments.
- Among roles, **Research Director** has the highest rate (23.75%, 57 of 240) and **Sales Executive** has the most departures (165).
- Only **3 of the 189** employees in the HR department have the job role "Human Resources". The rest hold roles such as Sales Executive (54) and Laboratory Technician (39), so department and role labels do not align well in this dataset.
- Gender: attrition is 16.67% for men and 15.31% for women. Men account for 62.03% of departures mainly because they are **60%** of the workforce.

### So what?
HR should be investigated as a small, high-rate department, and R&D as a high-volume one. The department/role mismatch should be confirmed with the data owner before any department-specific policy is drawn from these numbers.

---

## Insight 7: Compensation, Job Level, Training, and Promotion Show Weaker or Mixed Signals

### Finding
In this dataset, pay and career-ladder variables do not separate leavers from stayers as clearly as workload and tenure do.

### Evidence

| Department | Avg Income – Left | Avg Income – Stayed | Difference |
|---|---:|---:|---:|
| Human Resources | 53,257 | 59,911 | 6,654 |
| Research & Development | 63,756 | 67,828 | 4,072 |
| Sales | 59,400 | 61,735 | 2,335 |
| **Overall** | **61,683** | **65,673** | **3,990 (−6.1%)** |

- Leavers earn about 6% less on average, but the **medians are almost identical** (49,080 vs 49,300).
- Attrition by income quartile does not move in one direction: 18.2%, 14.2%, 18.8%, 13.4% from the lowest to the highest quartile.
- Job levels range between about **13% and 18%** with no consistent trend. Salary hike percentage, stock option level, and distance from home also show no clear pattern.
- Training: employees with 6 sessions last year have a 6.15% rate (195 employees) versus 18.52% for 0 sessions (162 employees), but the middle groups (2–3 sessions) are around 17%.
- Years since last promotion shows no steady "stagnation" pattern (for example 18.9% at 0 years versus 4.4% at 5 years).
- In the logistic regression, monthly income is **not statistically significant** after other factors are considered.

### So what?
Across-the-board salary increases are unlikely to be the most efficient first step based on this data. Workload, onboarding, and travel appear to matter more. Training and promotion results are inconclusive and need better data (for example promotion dates and training quality).

---

## Insight 8: Combining a Few Risk Signals Identifies a Small, Very High-Risk Group

### Finding
Employees who show several risk signals at once are far more likely to leave than the average employee.

### Evidence

Five simple flags: high overtime (≥ 2 days/week), tenure ≤ 1 year, frequent travel, environment satisfaction = 1, work-life balance = 1.

| Number of Flags | Employees | Left | Attrition Rate |
|---|---:|---:|---:|
| 0 | 1,580 | 91 | 5.8% |
| 1 | 1,911 | 253 | 13.2% |
| 2 | 729 | 249 | 34.2% |
| 3 or more | 190 | 118 | 62.1% |

- Employees with **2 or more flags** are **20.8%** of the workforce (919) but account for **51.6%** of departures.
- Employees with **0 flags** have only 5.8% attrition.

### So what?
A simple flag-based watchlist could help HR focus conversations on a small group instead of the whole workforce. This is an exploratory screening rule, not a validated prediction model.

---

## Prioritized Summary

| Priority | Finding | Evidence | Suggested Direction |
|---|---|---|---|
| High | Regular overtime (≥ 2 days/week) | 28.2% vs 10.3% attrition | Monitor workload; review staffing for high-overtime teams |
| High | First year of employment | 34.9% attrition; 31.6% of departures | Strengthen onboarding, manager check-ins at 30/90/180 days |
| High | Employees under 25 | 39.2% attrition | Mentoring and clear early-career expectations |
| Medium | Lowest satisfaction scores | 25.2% (environment), 22.9% (job) | Follow-up conversation after low survey scores |
| Medium | Frequent business travel | 24.9% vs 8.0% for non-travel | Review travel load for frequent travelers |
| Medium | HR department | 30.2% attrition (n = 189) | Validate data, then diagnose root causes |
| Low | Salary, job level, promotion, training | Weak or inconsistent patterns | Collect better data before changing policy |

---

## Overall Conclusion

1. **Workload is the main lever:** sustained overtime is associated with roughly 3× higher attrition and is not visible in the work-life balance survey.
2. **Attrition is an early-tenure problem:** the first year and the youngest age group carry the highest risk.
3. **Low satisfaction scores matter at the bottom end:** score 1 stands out; scores 2–4 are similar.
4. **Travel adds risk** and is a controllable job-design factor.
5. **Pay and career-ladder variables are weaker signals** in this dataset.
6. **A small group with multiple flags** accounts for a large share of departures.

---
