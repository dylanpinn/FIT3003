-- 22. List the students who are tutors.
SELECT
    student.*
FROM
    student,
    tutor
WHERE
    tutor.studentno = student.studentno;