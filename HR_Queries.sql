CREATE DATABASE hr_analytics;
CREATE TABLE cleaned_hr (
    age INT,
    attrition VARCHAR(10),
    business_travel VARCHAR(50),
    daily_rate INT,
    department VARCHAR(100),
    distance_from_home INT,
    education INT,
    education_field VARCHAR(100),
    employee_count INT,
    employee_number INT,
    environment_satisfaction INT,
    gender VARCHAR(20),
    hourly_rate INT,
    job_involvement INT,
    job_level INT,
    job_role VARCHAR(100),
    job_satisfaction INT,
    marital_status VARCHAR(50),
    monthly_income VARCHAR(50),
    monthly_rate INT,
    num_companies_worked INT,
    over18 VARCHAR(5),
    overtime VARCHAR(10),
    percent_salary_hike INT,
    performance_rating INT,
    relationship_satisfaction INT,
    standard_hours INT,
    stock_option_level INT,
    total_working_years INT,
    training_times_last_year INT,
    work_life_balance INT,
    years_at_company INT,
    years_in_current_role INT,
    years_since_last_promotion INT,
    years_with_curr_manager INT,
    age_group VARCHAR(20),
    salary_slab VARCHAR(20),
    attrition_flag INT
);

COPY cleaned_hr
FROM 'D:\HR-Attrition-Project\Dataset\Cleaned_HR.csv'
DELIMITER ','
CSV HEADER;

ALTER TABLE cleaned_hr
ALTER COLUMN monthly_income TYPE NUMERIC
USING REGEXP_REPLACE(monthly_income, '[^0-9.]', '', 'g')::NUMERIC;

SELECT * FROM cleaned_hr LIMIT 10;

SELECT COUNT(*) AS total_employees
FROM cleaned_hr;

SELECT COUNT(*) AS attrition_count
FROM cleaned_hr
WHERE Attrition = 'Yes';

SELECT Department,
COUNT(*) AS attrition_count
FROM cleaned_hr
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY attrition_count DESC;

SELECT Gender,
COUNT(*) AS attrition_count
FROM cleaned_hr
WHERE Attrition = 'Yes'
GROUP BY Gender;

SELECT Department,
AVG(Monthly_income) AS avg_salary
FROM cleaned_hr
GROUP BY Department;


SELECT OverTime,
COUNT(*) AS attrition_count
FROM cleaned_hr
WHERE Attrition = 'Yes'
GROUP BY OverTime;