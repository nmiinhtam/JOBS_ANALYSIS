-- Top Skills Among the Highest Paying Companies?
-- Instead of listing skills by company, aggregate them.

WITH highest_paying_companies AS (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_country = 'Vietnam'
        AND salary_year_avg IS NOT NULL
    GROUP BY company_id
    ORDER BY AVG(salary_year_avg) DESC
    LIMIT 10
)

SELECT
    skills_dim.skills,
    COUNT(*) AS demand_count
FROM highest_paying_companies
LEFT JOIN job_postings_fact ON highest_paying_companies.company_id = job_postings_fact.company_id
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_country = 'Vietnam'
GROUP BY skills_dim.skills
ORDER BY demand_count DESC
LIMIT 20;