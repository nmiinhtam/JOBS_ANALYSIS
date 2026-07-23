-- Average Salary by Skill Among Vietnam Jobs?
-- This combines salary analysis with skill demand.

SELECT
    skills_dim.skills,
    COUNT(*) AS demand,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_country = 'Vietnam'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND skills_dim.skills IS NOT NULL
GROUP BY skills_dim.skills
HAVING COUNT(*) >= 3
ORDER BY avg_salary DESC;