-- 4) What is the total score of students taking the Java unit in Semester 2, 2009?
SELECT
    SUM(enrolment2.score)
FROM
    student2
    INNER JOIN enrolment2 USING ( sid )
    LEFT JOIN offering2 USING ( oid )
    LEFT JOIN subject2 USING ( ucode )
WHERE
    subject2.utitle = 'Java'
    AND offering2.osem = 2
    AND offering2.oyear = 2009;