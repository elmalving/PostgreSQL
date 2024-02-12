SELECT *
FROM (
    SELECT id_student, jmeno
    FROM student
    WHERE id_adresa = 1
);