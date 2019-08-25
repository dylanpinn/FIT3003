-- 20. List all the students by first-name, last-name, date-of-birth, and fee-paid details, who are born after 1990 and before 1995.
SELECT
    fname,
    lname,
    dob,
    feepaid
FROM
    student
WHERE
    dob BETWEEN TO_DATE('31-DEC-1990', 'DD-MON-YYYY') AND TO_DATE('01-JAN-1995', 'DD-MON-YYYY');