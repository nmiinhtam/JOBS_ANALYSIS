-- Highest Paying Job Posting in Vietnam and Required Skills?

WITH top_job AS (
    SELECT
        job_id,
        company_id,
        job_title_short,
        salary_year_avg
    FROM job_postings_fact
    WHERE job_country = 'Vietnam'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 5
)

SELECT
    company_dim.name,
    top_job.job_title_short,
    top_job.salary_year_avg,
    skills_dim.skills
FROM top_job
LEFT JOIN company_dim ON top_job.company_id = company_dim.company_id
LEFT JOIN skills_job_dim ON top_job.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_job.salary_year_avg DESC,
    company_dim.name;