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

-- SELECT cohorts.name as cohort, COUNT(assignment_submissions.*) as total_submissions
-- FROM students 
-- JOIN cohorts ON cohort_id = cohorts.id
-- JOIN assignment_submissions ON student_id = students.id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;


-- Get currently enrolled students' average assignment completion time.
-- Select the students name and average time from assignment submissions.
-- Order the results from greatest duration to least greatest duration.
-- A student will have a null end_date if they are currently enrolled

-- SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- WHERE students.end_date IS NULL
-- GROUP BY student
-- ORDER BY average_assignment_duration DESC;


-- Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.
-- Select the name of the student, their average completion time, and the average suggested completion time.
-- Order by average completion time from smallest to largest.
-- Only get currently enrolled students.
-- This will require data from students, assignment_submissions, and assignments.

SELECT assignment_submissions.student_id AS student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
WHERE (students.end_date IS NULL)
GROUP BY assignment_submissions.student_id
HAVING (AVG(assignment_submissions.duration) < AVG(assignments.duration))
ORDER BY average_assignment_duration;