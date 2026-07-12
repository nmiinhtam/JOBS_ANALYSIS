/*
Practice Problem 1
Write a query to find the average salary both yearly and hourly 
    for job postings that were posted after June 1, 2023. 
Group the results by job schedule type.
*/

SELECT 
    job_title_short,
    salary_year_avg,
    salary_hour_avg,
    job_schedule_type
FROM job_postings_fact
WHERE 

/*
Practice Problem 2
Write a query to count the number of job postings for each month in 2023,
    adjusting the job_posted_date to be in 'America/New_York' time zone
    before extracting (hint) the month. 
Assume the job_posted_date is stored in UTC. Group by and order by the month.
*/



/*
Practice Problem 3
Write a query to find companies (include company name) that have posted jobs offering 
    health insurance, where these postings were made in the second quarter of 2023.
Use date extraction to filter by quarter.
*/



/* SubQuery & CTE
Practice Problem 1
Identify the top5 skills that are most frequently mentioned in job postings.
Use aa subquery to find the skill IDs with the highest counts in the skills_job_dim
    table and then join this result with the skills_dim table to get the skill names.
*/



/* SubQuery & CTE
Practice Problem 2
Determine the size category ('Small', 'Medium', or 'Large') for each company 
    by first identifying the number of job postings they have.
Use aa subquery to calculate the total job postings per company.
A company is considered 'Small' if it has less than 10 job postings, 
    'Medium' if the number of job postings is between 10 and 50,
    and 'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on size.
*/

