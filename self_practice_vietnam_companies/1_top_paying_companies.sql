-- Highest Paying Companies Based on Job Postings in Vietnam?
-- This query ranks companies by their average advertised salary for jobs located in Vietnam.

SELECT
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS total_job_postings,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary_usd,
    MAX(job_postings_fact.salary_year_avg) AS highest_salary,
    MIN(job_postings_fact.salary_year_avg) AS lowest_salary
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_country = 'Vietnam'
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY company_dim.name
HAVING COUNT(job_postings_fact.job_id) >= 2
ORDER BY avg_salary_usd DESC;

/*
The query shows:
- Companies offering the highest average salaries
- Number of Vietnam job postings
- Salary range for each company
*/