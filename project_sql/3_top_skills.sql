/*
Identify the top 5 skills for Data Analyst jobs.
*/


SELECT skills, COUNT(*) AS skill_count
FROM job_postings_fact
LEFT JOIN skills_job_dim ON skills_job_dim.job_id= job_postings_fact.job_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills
ORDER BY skill_count DESC
LIMIT 5