-- 27. List the total number of students in each lab, for each subject, with the tutor’s name.
SELECT
    subject.name,
    lab.labno,
    student.lname AS tutor,
    COUNT(lab_signup.studentno)
FROM
    subject,
    lab,
    tutor,
    student,
    lab_signup
WHERE
    lab.subjectcode = subject.subjectcode
    AND lab.tutorno = tutor.tutorno
    AND tutor.studentno = student.studentno
    AND lab.labno = lab_signup.labno
GROUP BY
    subject.name,
    lab.labno,
    student.lname;