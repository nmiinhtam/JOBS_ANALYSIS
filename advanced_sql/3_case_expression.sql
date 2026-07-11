/*
CASE Expression
- A CASE expression in SQL is a way to apply conditional logic within your SQL queries.

CASE -begins the expression
WHEN -specifies the condition(s) to look at
THEN -what to do if the condition is TRUE
ELSE (optional) -provides output if none of the WHEN conditions are met
END -conludes the CASE expression
*/

SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category

/*

Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- Otherwise 'Onsite'

*/

SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

-- Đếm và lọc ra các giá trị job là Data Analyst theo vị trí công việc