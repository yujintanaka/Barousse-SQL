/*
Want to find top paying Data Analyst jobs.
- Identify the top 10 roles that are available remotely.
- Focus on job postings that have specified salary ranges (ignore nulls).
*/
SELECT name AS company_name, *
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE 
    job_work_from_home = true AND
    job_title LIKE '%Analyst%' AND
    job_title LIKE '%Data%' AND
    salary_year_avg <> 0
ORDER BY
    salary_year_avg DESC
LIMIT 10;