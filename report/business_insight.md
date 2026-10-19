# HR Analytics — Business Insights

## 1. Executive Summary

This document summarizes the findings from the four Power BI report pages: Overview, Demographics, Attrition, and Key Drivers of Attrition. The analysis focuses on workforce composition, employee turnover, and potential retention-related factors.

### Headline KPIs

| KPI | Dashboard Value |
|---|---:|
| Total employees | 4,410 |
| Employees who left | 711 |
| Overall attrition rate | 16.12% |
| Average age | 36.92 years |
| Average tenure | 7.01 years |

**Interpretation note:** The report shows descriptive associations, not causal effects. Attrition counts and within-group attrition rates answer different business questions. Findings should be validated against the report's filter context before making policy decisions.

## 2. Workforce Overview

### 2.1 Department Distribution

| Department | Employees | Share of Workforce |
|---|---:|---:|
| Research & Development | 2,883 | 65.37% |
| Sales | 1,338 | 30.34% |
| Human Resources | 189 | 4.29% |
| **Total** | **4,410** | **100.00%** |

**Insight:** Research & Development (R&D) accounts for almost two-thirds of employees. Workforce planning and retention initiatives in this department can affect a large part of the organization.

### 2.2 Age and Job-Level Structure

| Age Group | Employees |
|---|---:|
| 18–25 | 291 |
| 25–34 | 1,662 |
| 35–44 | 1,515 |
| 45–54 | 735 |
| 55+ | 207 |

Key findings:

- Employees aged 25–44 total 3,177, or approximately 72.04% of the workforce.
- Job Levels 1 and 2 include 3,231 employees (73.27% of the workforce).
- The largest job roles are Sales Executive (978) and Research Scientist (876).
- Life Sciences and Medical are the two largest education-field categories in the report.

**Insight:** The organization is concentrated in its core working-age population and lower job levels. Clear growth opportunities for these employees may be important for workforce development and retention planning.

### 2.3 Tenure Distribution

The 5–9 years tenure segment is the largest shown in the Overview dashboard, with 1,572 employees. Average tenure is 7.01 years.

**Insight:** Tenure is not uniform across the organization. Employee development and retention strategies should distinguish recent hires from established employees.

## 3. Attrition Patterns

### 3.1 Overall Employee Attrition

- 711 of 4,410 employees are classified as having left.
- The overall attrition rate is 16.12%.

### 3.2 Attrition by Department

| Department | Employees | Employees Who Left | Attrition Rate |
|---|---:|---:|---:|
| Human Resources | 189 | 57 | 30.16% |
| Research & Development | 2,883 | 453 | 15.71% |
| Sales | 1,338 | 201 | 15.02% |
| **Total** | **4,410** | **711** | **16.12%** |

**Insight 1 — Highest rate versus highest volume:**

- Human Resources has the highest within-department rate (30.16%), even though it is the smallest department.
- R&D has the highest number of departures (453), reflecting its large workforce.

**Business implication:** HR requires investigation of proportionally elevated turnover, while R&D needs attention because of the absolute scale of departures. These are distinct prioritization criteria.

### 3.3 Attrition by Job Role

| Job Role | Employees Who Left | Attrition Rate |
|---|---:|---:|
| Research Director | 57 | 23.75% |
| Research Scientist | 159 | 18.15% |
| Sales Executive | 165 | 16.87% |
| Laboratory Technician | 126 | 16.22% |
| Healthcare Representative | 57 | 14.50% |
| Sales Representative | 36 | 14.46% |
| Manager | 42 | 13.73% |
| Human Resources | 21 | 13.46% |
| Manufacturing Director | 48 | 11.03% |

**Insight:** Research Director has the highest displayed attrition rate, while Sales Executive has the largest number of departures. Retention programs should account for both percentage risk and staffing impact.

### 3.4 Attrition by Age, Tenure, and Gender

- The 25–34 age segment has the highest number of departures in the Attrition dashboard.
- The less-than-2-years tenure group is an important early-career retention segment in the report.
- Among employees who left, 441 were male (62.03%) and 270 were female (37.97%).

**Gender interpretation:** 62.03% and 37.97% represent shares of all departures. They are not the male and female attrition rates. Comparing attrition risk by gender requires separate denominators for each gender.

**Business implication:** Investigate early-tenure onboarding, role expectations, team integration, and career progression for employees in the 25–34 age group. Counts alone do not establish that this age group has the highest age-specific attrition rate.

## 4. Potential Drivers of Attrition

### 4.1 Work Environment Satisfaction

| Environment Satisfaction Score | Attrition Rate |
|---|---:|
| 1 — Lowest | 25.27% |
| 2 | 15.04% |
| 3 | 13.81% |
| 4 — Highest | 13.45% |

**Insight:** Employees with the lowest environment satisfaction score have a substantially higher observed attrition rate than those with the highest score (25.27% vs. 13.45%, an 11.82 percentage-point gap).

**Business implication:** Workplace environment, management practices, employee recognition, and team culture are appropriate areas for deeper investigation.

### 4.2 Work-Life Balance

| Work-Life Balance Score | Attrition Rate |
|---|---:|
| 1 — Lowest | 31.22% |
| 2 | 16.55% |
| 3 | 14.41% |
| 4 — Highest | 17.96% |

**Insight:** The lowest work-life balance group has the highest attrition rate (31.22%), compared with 14.41% for score 3. The relationship is not strictly monotonic: score 4 has a higher rate than score 3.

**Business implication:** Poor work-life balance is a strong signal to investigate, but the dashboard does not show that improving this score alone will cause a reduction in departures.

### 4.3 Job Level and Compensation

The Key Drivers dashboard segments attrition counts by income group and job level. Lower job levels contain most employees and contribute substantial attrition volume.

**Insight:** A high departure count in a low-income or low-level group does not necessarily mean that group has the highest attrition rate. Compare departures against the number of employees in each segment, and ideally control for department, tenure, and role.

**Business implication:** Review compensation competitiveness and perceived career opportunities, especially among lower-level employees, before deciding on targeted salary adjustments.

### 4.4 Training and Career Development

The dashboard compares attrition counts across training frequency and job level, and explores employee departures by years since last promotion.

**Insight:** The visualizations suggest that training participation and promotion history merit further review, but they do not isolate the effectiveness of training or promotion programs. Training frequency may also reflect employee population size and role composition.

**Business implication:** Evaluate training quality and outcomes, not just the number of training sessions; assess promotion transparency and career progression together with compensation.

## 5. Prioritized Insight Summary

| Priority | Finding | Evidence | Decision Area |
|---|---|---|---|
| High | Poor work-life balance is associated with elevated attrition | 31.22% attrition for WLB score 1 | Workload and well-being |
| High | Low environment satisfaction is associated with elevated attrition | 25.27% attrition for environment score 1 | Team culture and management |
| High | HR shows the highest department attrition rate | 30.16% in HR | Department-specific diagnosis |
| High | R&D accounts for the most departures | 453 employees | High-impact workforce retention |
| Medium | Early-tenure employees warrant attention | Less-than-2-year group highlighted in dashboard | Onboarding and mentoring |
| Medium | Career and reward pathways require investigation | Job-level, income, training and promotion visuals | Talent development and compensation |

## 6. Limitations and Next Analyses

1. **Observational evidence:** Dashboard relationships do not prove causality.
2. **Denominator awareness:** Compare attrition rates, not just the number of departures, when groups have very different sizes.
3. **Potential confounding:** Department, role, seniority, tenure, income, satisfaction, and training can overlap; segment and model jointly before drawing stronger conclusions.
4. **Time interpretation:** A date slicer or line chart alone does not prove that the underlying dataset contains historical employment snapshots or a true monthly turnover rate.
5. **Suggested next analyses:** Investigate attrition by tenure × age, job level × income, and department × satisfaction. Assess whether trends persist after adjusting for workforce composition.

## 7. Source

- **Power BI report pages:** OVERVIEW, DEMOGRAPHICS, ATTRITION, and KEY DRIVES OF ATTRITION.
- **Related documentation:** [`kpi_definitions.md`](kpi_definitions.md) and [`actions.md`](actions.md).

All figures are taken from the dashboard screenshots provided for this project; reported values reflect their displayed filter context.
