-- Get the average duration of assistance requests for each cohort.

-- Select the cohort's name and the average assistance request time.
-- Order the results from shortest average to longest.


SELECT cohorts.name AS name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_time 
  FROM students 
  JOIN assistance_requests ON student_id = students.id 
  JOIN cohorts ON cohorts.id = cohort_id 
  GROUP BY cohorts.name
ORDER BY average_assistance_time;