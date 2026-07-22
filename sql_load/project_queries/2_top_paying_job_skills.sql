/*
What skills are required for the top-paying Data Analyst jobs?
-Use the top 10 highest-paying Data Analyst jobs from th first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers to understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS(
SELECT
    job_id,
    job_title,
    company_dim.name AS company_name,
    salary_year_avg
FROM
    job_postings_fact AS job_postings
LEFT JOIN company_dim
ON job_postings.company_id=company_dim.company_id
WHERE
    job_location = 'Anywhere' AND
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
)

SELECT
    top_paying_jobs. *,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_dim.skill_id=skills_job_dim.skill_id
ORDER BY 
    salary_year_avg DESC
LIMIT 50;

/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.
*/