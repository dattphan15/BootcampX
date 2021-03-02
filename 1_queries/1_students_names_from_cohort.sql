-- Show full table
SELECT * FROM students

-- Get the names of all of the students from a single cohort.
SELECT id, name
  FROM students
  WHERE cohort_id = '1'
  ORDER BY name;


-- Select the total number of students who were in the first 3 cohorts.
SELECT COUNT(id)
  FROM students
  WHERE cohort_id IN (1,2,3);


-- Get all of the students that don't have an email or phone number.
  SELECT name, id, cohort_id
    FROM students
    WHERE email IS NULL OR phone IS NULL;


-- Get all of the students without a gmail.com or phone number.
  SELECT name, email, id, cohort_id
    FROM students
    WHERE email NOT LIKE '%gmail.com' AND phone IS NULL;


-- Get all of the students currently enrolled. A student's end date will be NULL when they are currently enrolled in Bootcamp.
  SELECT name, id, cohort_id
    FROM students
    WHERE end_date IS NULL
    ORDER BY cohort_id;


-- Once a student graduates, the career services department needs to keep track of their activity on Github. If a graduate has not linked their Github account, we need to contact them to do so. Get all graduates without a linked Github account.
  SELECT name, email, phone
    FROM students
    WHERE (github IS NULL) AND (end_date IS NOT NULL);
