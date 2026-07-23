-- Highest Paying Companies by Job Title?
-- This reveals which companies pay the best for each role.

SELECT
    job_title_short,
    company_dim.name AS company_name,
    ROUND(AVG(salary_year_avg),0) AS avg_salary,
    COUNT(*) AS postings
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_country = 'Vietnam'
    AND salary_year_avg IS NOT NULL
GROUP BY
    job_title_short,
    company_dim.name
HAVING COUNT(*) >= 1
ORDER BY
    job_title_short,
    avg_salary DESC;