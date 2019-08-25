-- 28. Calculate the cost of running all the database labs per week. (Hint: lab duration * tutors’ SALARYPERHOUR)
SELECT
    SUM(lab.duration * tutor.salaryperhour)
FROM
    lab,
    tutor
WHERE
    lab.tutorno = tutor.tutorno
    AND lab.subjectcode LIKE '%DB%';