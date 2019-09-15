-- 1) How many students enrolled in the Database unit offered in Main campus?
SELECT
    COUNT(DISTINCT(student2.sid))
FROM
    student2
    INNER JOIN enrolment2 ON student2.sid = enrolment2.sid
    INNER JOIN offering2 ON enrolment2.oid = offering2.oid
WHERE
    offering2.ocampus = 'Main';
