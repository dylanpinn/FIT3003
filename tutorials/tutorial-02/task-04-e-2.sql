-- 2) What is the total score of students taking the Database unit in Main campus?
SELECT
    SUM(enrolment2.score)
FROM
    enrolment2
    INNER JOIN offering2 USING ( oid )
    INNER JOIN subject2 USING ( ucode )
WHERE
    offering2.ocampus = 'Main'
    AND subject2.utitle = 'Database';