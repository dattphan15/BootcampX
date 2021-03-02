-- Get the total number of assignments for each day of bootcamp. Select the day and the total assignments.
-- Order the results by day. This query only requires the assignments table.

-- SELECT day, count(assignments.*) as total_assignments
-- FROM assignments
-- GROUP BY assignments.day
-- ORDER BY day;


-- The same query as before, but only return rows where total assignments is greater than or equal to 10.

-- SELECT day, count(assignments.*) as total_assignments
-- FROM assignments
-- GROUP BY assignments.day
-- HAVING count(assignments.*) >= 10
-- ORDER BY day;


-- Get all cohorts with 18 or more students.
-- Select the cohort name and the total students.
-- Order by total students from smallest to greatest.

-- SELECT cohorts.name as cohort_name, COUNT(students.*) as student_count
-- FROM students JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohort_name
-- HAVING COUNT(students.*) >= 18
-- ORDER BY student_count;


-- Get the total number of assignment submissions for each cohort.
-- Select the cohort name and total submissions.
-- Order the results from greatest to least submissions.

SELECT cohorts.name as cohort, COUNT(assignment_submissions.*) as total_submissions
FROM students 
JOIN cohorts ON cohort_id = cohorts.id
JOIN assignment_submissions ON student_id = students.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;
