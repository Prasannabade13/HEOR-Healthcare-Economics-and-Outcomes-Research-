CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

# MAIN TABLE THAT HOLDS ALL PATIENTS RECORD
USE hospital_db;
CREATE TABLE IF NOT EXISTS patients (
    patient_id          VARCHAR(10)    PRIMARY KEY,
    department          VARCHAR(50)    NOT NULL,
    treatment_type      VARCHAR(50)    NOT NULL,
    doctor_name         VARCHAR(50)    NOT NULL,
    gender              VARCHAR(10)    NOT NULL,
    age                 INT            NOT NULL,
    treatment_cost      DECIMAL(10,2)  NOT NULL,
    hospital_stay_days  INT            NOT NULL,
    recovery_score      INT            NOT NULL,
    age_group           VARCHAR(30),
    cost_category       VARCHAR(20),
    recovery_category   VARCHAR(20)
);

DESCRIBE patients;

#VERIFYING OUR CSV DATA AFTER IMPORTING
USE hospital_db;
SELECT COUNT(*) AS total_records FROM patients;
SELECT * FROM patients LIMIT 10;

# PATIENT COUNT BY DEPARTMENT
USE hospital_db;
SELECT
    department,
    COUNT(*) AS total_patients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 2) AS percentage
FROM patients
GROUP BY department
ORDER BY total_patients DESC;

#PATIENT COUNT BY TREATMENT TYPE
USE hospital_db;
SELECT
    treatment_type,
    COUNT(*) AS total_patients,
    ROUND(AVG(treatment_cost), 2) AS avg_cost,
    ROUND(AVG(recovery_score), 2) AS avg_recovery
FROM patients
GROUP BY treatment_type
ORDER BY total_patients DESC;

# GENDER DISTRIBUTION
USE hospital_db;
SELECT
    gender,
    COUNT(*) AS total_patients,
    ROUND(AVG(age), 1) AS avg_age,
    ROUND(AVG(treatment_cost), 2) AS avg_cost,
    ROUND(AVG(recovery_score), 2) AS avg_recovery
FROM patients
GROUP BY gender
ORDER BY total_patients DESC;

# FULL DEPARTMENT KPIs
USE hospital_db;
SELECT
    department,
    COUNT(*)                          AS total_patients,
    ROUND(AVG(age), 1)                AS avg_age,
    ROUND(AVG(treatment_cost), 2)     AS avg_cost,
    ROUND(MIN(treatment_cost), 2)     AS min_cost,
    ROUND(MAX(treatment_cost), 2)     AS max_cost,
    ROUND(AVG(hospital_stay_days), 1) AS avg_stay_days,
    ROUND(AVG(recovery_score), 2)     AS avg_recovery_score
FROM patients
GROUP BY department
ORDER BY avg_recovery_score DESC;

# DOCTOR KPIs
USE hospital_db;
SELECT
    doctor_name,
    COUNT(*)                          AS total_patients,
    ROUND(AVG(treatment_cost), 2)     AS avg_cost,
    ROUND(AVG(hospital_stay_days), 1) AS avg_stay_days,
    ROUND(AVG(recovery_score), 2)     AS avg_recovery,
    MAX(recovery_score)               AS max_recovery,
    MIN(recovery_score)               AS min_recovery
FROM patients
GROUP BY doctor_name
ORDER BY avg_recovery DESC;

# HIGH COST PATIENTS (TOP 10)
USE hospital_db;
SELECT
    patient_id, department, treatment_type,
    doctor_name, age, gender,
    treatment_cost, recovery_score
FROM patients
ORDER BY treatment_cost DESC
LIMIT 10;

# BEST RECOVERY PATIENTS (TOP 10)
USE hospital_db;
SELECT
    patient_id, department, treatment_type,
    doctor_name, age, gender,
    treatment_cost, hospital_stay_days, recovery_score
FROM patients
ORDER BY recovery_score DESC
LIMIT 10;

# POOR RECOVERY PATIENTS
USE hospital_db;
SELECT
    patient_id, department, doctor_name,
    age, gender, treatment_type,
    hospital_stay_days, recovery_score, treatment_cost
FROM patients
WHERE hospital_stay_days > 20
  AND recovery_score < 60
ORDER BY hospital_stay_days DESC;

# KPIs BY AGE GROUP
USE hospital_db;
SELECT
    age_group,
    COUNT(*)                          AS total_patients,
    ROUND(AVG(treatment_cost), 2)     AS avg_cost,
    ROUND(AVG(hospital_stay_days), 1) AS avg_stay,
    ROUND(AVG(recovery_score), 2)     AS avg_recovery
FROM patients
GROUP BY age_group
ORDER BY avg_cost DESC;

# DEPT VS TREATMENT TYPE MATRIX
USE hospital_db;
SELECT
    department,
    SUM(CASE WHEN treatment_type='Surgery'
        THEN 1 ELSE 0 END)     AS surgery,
    SUM(CASE WHEN treatment_type='Medication'
        THEN 1 ELSE 0 END)     AS medication,
    SUM(CASE WHEN treatment_type='Therapy'
        THEN 1 ELSE 0 END)     AS therapy,
    SUM(CASE WHEN treatment_type='Observation'
        THEN 1 ELSE 0 END)     AS observation,
    COUNT(*)                   AS total
FROM patients
GROUP BY department
ORDER BY total DESC;

# OVERALL HOSPITAL SUMMARY KPIs
USE hospital_db;
SELECT
    COUNT(*)                          AS total_patients,
    ROUND(AVG(age), 1)                AS avg_age,
    ROUND(AVG(treatment_cost), 2)     AS avg_treatment_cost,
    ROUND(SUM(treatment_cost), 2)     AS total_revenue,
    ROUND(AVG(hospital_stay_days), 1) AS avg_stay_days,
    ROUND(AVG(recovery_score), 2)     AS avg_recovery_score,
    COUNT(DISTINCT department)        AS total_departments,
    COUNT(DISTINCT doctor_name)       AS total_doctors
FROM patients;


