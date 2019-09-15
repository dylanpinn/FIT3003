-- 3) How many students enrolled in the Java unit offered in Semester 2, 2009?
SELECT
    COUNT(*)
FROM
    student2
    INNER JOIN enrolment2 USING ( sid )
    LEFT JOIN offering2 USING ( oid )
    LEFT JOIN subject2 USING ( ucode )
WHERE
    subject2.utitle = 'Java'
    AND offering2.osem = 2
    AND offering2.oyear = 2009;