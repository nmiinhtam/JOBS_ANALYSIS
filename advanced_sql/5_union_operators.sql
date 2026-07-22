/* 
UNION Operators
Combine result sets of twp or more SELECT statements into a 
single result set.
- UNION: Remove duplicate rows
- UNION ALL: Includes all duplicate rows

NOTE: Each SELECT statement within the UNION must have the 
same numberof columns in the result sets with similar data types.

1) UNION -combines results from two or more SELECT statements
They need to have the same amount of columns, and the data type must match

    SELECT column_name
    FROM table_one

    UNION --combine the two tables

    SELECT column_name
    FROM table_two;

Gets rid of duplicate rows (unlike UNION ALL)
    All rows are unique

2) UNION ALL -combine the result of two or more SELECT statements
They need to have the same amount of columns, and the data type must match

    SELECT column_name
    FROM table_one

    UNION ALL --combine the two tables

    SELECT column_name
    FROM table_two;
*/

-- Get jobs and companies from January
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

-- Get jobs and companies from February
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

-- Get jobs and companies from March
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

/* 
PRACTICE PROBLEM 1
- Get the corresponding skill and skill type for each job posting in q1
- Includes those without any skills, too
- Why? Look at the skills and the type for each job in the first quarter that has a salary > $70,000
*/

WITH q1_jobs AS (
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL

    SELECT *
    FROM march_jobs
)

SELECT
    q1_jobs.job_id,
    q1_jobs.job_title_short,
    q1_jobs.salary_year_avg,
    skills_dim.skills,
    skills_dim.type AS skill_type
FROM q1_jobs
LEFT JOIN skills_job_dim ON q1_jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
/*
NOTE: Using LEFT JOIN instead of INNER JOIN because 
- With INNER JOIN, any job that has no matching record in skills_job_dim would disappear from the results.
- With LEFT JOIN, those jobs remain, and the skills and skill_type columns will be NULL.
*/
WHERE q1_jobs.salary_year_avg > 70000
ORDER BY
    q1_jobs.job_id,
    skills_dim.skills;