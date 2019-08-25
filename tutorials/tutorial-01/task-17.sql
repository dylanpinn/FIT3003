-- Write SQL statement to list all lectueres and their lecture schedules.

SELECT
    "STAFF"."STAFFNO"       "STAFFNO",
    "STAFF"."FNAME"         "FNAME",
    "STAFF"."LNAME"         "LNAME",
    "CLASS"."LECTURECODE"   "LECTURECODE",
    "CLASS"."LECTDAY"       "LECTDAY",
    "CLASS"."LECTTIME"      "LECTTIME"
FROM
    "LECTURER"   "STAFF",
    "LECTURE"    "CLASS"
WHERE
    "STAFF"."STAFFNO" = "CLASS"."STAFFNO";
