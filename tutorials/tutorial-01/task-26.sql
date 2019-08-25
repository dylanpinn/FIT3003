-- 26. List the number of tutors by each subject and semester.
SELECT
    subject.name,
    subject.semester,
    COUNT(tutor.tutorno)
FROM
    tutor,
    subject,
    lab
WHERE
    subject.subjectcode = lab.subjectcode
    AND tutor.tutorno = lab.tutorno
GROUP BY
    subject.name,
    subject.semester;