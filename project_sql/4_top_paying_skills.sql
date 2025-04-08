/*
Identify the top paying skills for Data Analyst jobs.
*/
SELECT skills_dim.skills, AVG(salary_year_avg) AS avg_salary, COUNT(*) AS number_of_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND salary_year_avg > 0
GROUP BY
    skills_dim.skills
HAVING
    COUNT(*) > 10
ORDER BY AVG(salary_year_avg) DESC
LIMIT 25