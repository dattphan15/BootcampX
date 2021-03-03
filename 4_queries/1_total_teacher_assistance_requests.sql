-- Get the total number of assistance_requests for a teacher.

-- Select the teacher's name and the total assistance requests.
-- Since this query needs to work with any specific teacher name, use 'Waylon Boehm' for the teacher's name here.

SELECT COUNT(assistance_requests.id) AS total_assistances, teachers.name AS name 
  FROM assistance_requests 
  JOIN teachers ON teacher_id = teachers.id 
WHERE name = 'Waylon Boehm'
GROUP BY name;