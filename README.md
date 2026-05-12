# 🏥 Healthcare Economics and Outcomes Research (HEOR)

## 📋 Project Overview
This is a complete data analytics internship project that analyses hospital patient treatment data to study treatment costs, hospital stay durations, and patient recovery outcomes.

**Project Title:** Healthcare Economics and Outcomes Research  
**Year:** 2026  
**Type:** Internship Data Analytics Project  

---

## 🎯 Objectives
- Analyse treatment costs and recovery outcomes across 6 hospital departments
- Rank doctors by patient recovery performance
- Identify at-risk patients (long stay + poor recovery)
- Build an interactive Power BI dashboard for hospital management
- Provide data-driven recommendations to improve patient care

---

## 📊 Dataset
| Attribute | Details |
|-----------|---------|
| Total Records | 200 patients |
| Columns | 9 attributes per patient |
| Departments | Cardiology, Neurology, Oncology, Orthopedics, Pediatrics, Gastroenterology |
| Treatment Types | Surgery, Medication, Therapy, Observation |
| Doctors | 5 doctors |
| Age Range | 1 to 90 years |

---

## 🛠️ Tools Used
| Phase | Tool | Purpose |
|-------|------|---------|
| Phase 1 | Python 3 (Google Colab) | Data cleaning, EDA, visualisation |
| Phase 2 | MySQL Workbench 8.0 | Database design and SQL queries |
| Phase 3 | Microsoft Power BI | Interactive dashboard creation |
| Phase 4 | Microsoft Word | Final report documentation |

---

## 📁 Project Files
| File | Description |
|------|-------------|
| `HEOR.ipynb` | Python notebook — data cleaning and EDA |
| `FINAL_SQL_SCRIPT_HEOR.sql` | All 14 SQL queries for MySQL |
| `Final_Dashboard.pbix` | Power BI interactive dashboard |
| `Hospital_Report_Final.docx` | Final project report |
| `hospital_cleaned.csv` | Cleaned dataset |
| `hospital_patient_treatment_dataset.csv` | Original raw dataset |

---

## 🔍 Key Findings
- **Best Department:** Pediatrics — avg recovery score 73.13/100
- **Best Treatment:** Surgery — avg recovery score 73.29/100
- **Top Doctor:** Dr. M. Patel — best recovery (73.24) with lowest avg cost (₹70,756)
- **At-Risk Patients:** 18 patients with hospital stay >20 days AND recovery <60
- **Total Revenue:** ₹1.59 Crore across 200 patients
- **Concern:** Medication is most used (55 patients) but has lowest recovery score (67.58)

---

## 📈 Dashboard Features (Power BI)
- 4 KPI Cards: Total Patients, Avg Cost, Avg Recovery, Avg Stay
- 6 Charts: Bar, Donut, Column, Scatter, Funnel, Bar
- 4 Interactive Slicers: Department, Gender, Treatment Type, Age Group

---

## 🚀 How to Run
**Python Notebook:**
1. Open Google Colab (colab.research.google.com)
2. Upload HEOR.ipynb
3. Upload hospital_patient_treatment_dataset.csv
4. Run all cells

**SQL Script:**
1. Open MySQL Workbench
2. Run FINAL_SQL_SCRIPT_HEOR.sql
3. Import hospital_cleaned.csv into the patients table

**Power BI Dashboard:**
1. Open Final_Dashboard.pbix in Power BI Desktop
2. Dashboard loads automatically

---

## 📌 Recommendations
1. Review medication protocols — most used but worst recovery
2. Support Neurology department — lowest recovery score
3. Urgently review 18 at-risk patients
4. Learn from Dr. M. Patel's approach — best outcomes, lowest cost
5. Use Power BI dashboard monthly for performance monitoring

---
*Internship Project — 2026*
