-- 21. List all the students enrolled in the database subject. (Note: database = CSE21DB, CSE31DB, CSE41FDB)
SELECT DISTINCT
    student.*
FROM
    student_enrolment,
    student
WHERE
    student_enrolment.subjectcode = 'CSE21DB'
    OR student_enrolment.subjectcode = 'CSE31DB'
    OR student_enrolment.subjectcode = 'CSE41FDB';