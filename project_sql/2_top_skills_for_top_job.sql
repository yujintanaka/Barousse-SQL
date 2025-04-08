

WITH top_jobs AS (
    SELECT name AS company_name, job_id, job_title, salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE 
        job_work_from_home = true AND
        job_title LIKE '%Analyst%' AND
        job_title LIKE '%Data%' AND
        salary_year_avg <> 0
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_jobs.*,
    skills_dim.skills
FROM top_jobs
INNER JOIN skills_job_dim ON top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC