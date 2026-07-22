/*
Practice Problem 1
Write a query to find the average salary both yearly and hourly 
    for job postings that were posted after June 1, 2023. 
Group the results by job schedule type.
*/

SELECT 
    job_schedule_type,
    COUNT(job_title_short) AS job_count,
    ROUND(AVG(salary_year_avg),0) AS yearly_salary,
    ROUND(AVG(salary_hour_avg),0) AS hourly_salary    
FROM job_postings_fact
WHERE 
    job_posted_date > DATE '2023-06-01' 
GROUP BY job_schedule_type;

/*
Practice Problem 2
Write a query to count the number of job postings for each month in 2023,
    adjusting the job_posted_date to be in 'America/New_York' time zone
    before extracting (hint) the month. 
Assume the job_posted_date is stored in UTC. Group by and order by the month.
*/

SELECT
    EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id)
FROM job_postings_fact
GROUP BY month
ORDER BY month

/*
Practice Problem 3
Write a query to find companies (include company name) that have posted jobs offering 
    health insurance, where these postings were made in the second quarter of 2023.
Use date extraction to filter by quarter.
*/

SELECT DISTINCT
    company_dim.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    EXTRACT(MONTH FROM job_posted_date) BETWEEN 4 AND 6
    AND job_postings_fact.job_health_insurance = 'TRUE'



/* SubQuery & CTE
Practice Problem 1
Identify the top5 skills that are most frequently mentioned in job postings.
Use a subquery to find the skill IDs with the highest counts in the skills_job_dim
    table and then join this result with the skills_dim table to get the skill names.
*/

SELECT
    skills_dim.skills,
    total_skill.skill_count
FROM (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY skill_count DESC
    LIMIT 5
) AS total_skill
LEFT JOIN skills_dim ON total_skill.skill_id = skills_dim.skill_id
ORDER BY total_skill.skill_count DESC;

/* SubQuery & CTE
Practice Problem 2
Determine the size category ('Small', 'Medium', or 'Large') for each company 
    by first identifying the number of job postings they have.
Use a subquery to calculate the total job postings per company.
A company is considered 'Small' if it has less than 10 job postings, 
    'Medium' if the number of job postings is between 10 and 50,
    and 'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on size.
*/

WITH company_job_counts AS (
    SELECT
        company_id,
        COUNT(job_id) AS total_job_postings
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT
    company_dim.company_id,
    company_dim.name AS company_name,
    company_job_counts.total_job_postings,
    CASE
        WHEN company_job_counts.total_job_postings < 10 THEN 'Small'
        WHEN company_job_counts.total_job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM company_job_counts
LEFT JOIN company_dim ON company_job_counts.company_id = company_dim.company_id
ORDER BY company_job_counts.total_job_postings DESC;