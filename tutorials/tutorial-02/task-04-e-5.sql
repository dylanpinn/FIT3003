-- 5) How many students received HD in the SAP unit offered in Semester 1, 2009?
SELECT
    COUNT(*)
FROM
    student2
    INNER JOIN enrolment2 USING ( sid )
    LEFT JOIN offering2 USING ( oid )
    LEFT JOIN subject2 USING ( ucode )
WHERE
    subject2.utitle = 'SAP'
    AND enrolment2.grade = 'HD'
    AND offering2.osem = 1
    AND offering2.oyear = 2009;