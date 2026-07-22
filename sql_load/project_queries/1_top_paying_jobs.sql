/*
QUSTION: what are the top paying data-analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely,
-Focuses on job postings with specified salaries (remove nulls),
-Why? Highlight the top paying opportunities for Data Analysts,offering insights into most optimal roles as Data Analyst
*/

SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact AS job_postings
LEFT JOIN company_dim
ON job_postings.company_id=company_dim.company_id
WHERE
    job_location = 'Anywhere' AND
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
