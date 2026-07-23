-- Skills Required by the Highest Paying Companies?
-- This identifies the skills requested by companies that pay the highest salaries.

WITH highest_paying_companies AS (
    SELECT
        company_id,
        AVG(salary_year_avg) AS avg_salary
    FROM job_postings_fact
    WHERE job_country = 'Vietnam'
        AND salary_year_avg IS NOT NULL
    GROUP BY company_id
    ORDER BY avg_salary DESC
    LIMIT 10
)

SELECT
    company_dim.name AS company_name,
    skills_dim.skills,
    COUNT(*) AS skill_frequency
FROM highest_paying_companies
LEFT JOIN company_dim ON highest_paying_companies.company_id = company_dim.company_id
LEFT JOIN job_postings_fact ON highest_paying_companies.company_id = job_postings_fact.company_id
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_country = 'Vietnam'
GROUP BY
    company_name,
    skills_dim.skills
ORDER BY
    company_name,
    skill_frequency DESC;