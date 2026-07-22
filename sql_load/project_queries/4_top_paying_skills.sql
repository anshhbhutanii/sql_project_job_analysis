/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
  skills_dim.skills,
  ROUND(AVG(salary_year_avg),0) AS salary_avg
FROM 
  job_postings_fact AS job_postings
INNER JOIN skills_job_dim
ON job_postings.job_id=skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE
  job_title_short='Data Analyst' AND 
  salary_year_avg IS NOT NULL
GROUP BY 
  skills
ORDER BY 
  salary_avg DESC
LIMIT 100;


/*
Here's a breakdown of the results for the highest-paying Data Analyst skills:

- Specialized & Emerging Technologies Lead Salaries:
  Skills such as SVN, Solidity, Couchbase, and DataRobot offer the highest average salaries, indicating that niche technical expertise commands a significant salary premium.

- Machine Learning & AI Skills Remain Valuable:
  Frameworks like PyTorch, Keras, and MXNet appear among the top-paying skills, highlighting the growing demand for AI and machine learning capabilities in data-focused roles.

- Data Engineering & Cloud Technologies Are Highly Rewarded:
  Technologies including Kafka, Terraform, and Couchbase demonstrate that employers highly value professionals who can build scalable data infrastructure and cloud-based solutions.

- Development & DevOps Knowledge Adds Career Value:
  Skills such as GitLab, Puppet, VMware, and Twilio suggest that combining data analytics with software engineering and deployment practices can lead to higher-paying opportunities.

- Key Takeaway:
  While traditional analytics skills are essential, professionals who expand into cloud computing, machine learning, and data engineering technologies are positioned for stronger salary growth and more specialized career opportunities.
*/