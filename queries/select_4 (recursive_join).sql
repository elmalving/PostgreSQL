WITH RECURSIVE StudentHierarchy AS (
    SELECT
        s.id_student,
        s.jmeno,
        s.prijmeni,
        s.id_kurator,
        s.id_skupina
    FROM
        student s
    WHERE
        s.id_skupina IS NOT NULL

    UNION

    SELECT
        s.id_student,
        s.jmeno,
        s.prijmeni,
        s.id_kurator,
        s.id_skupina
    FROM
        student s
    JOIN
        StudentHierarchy sh ON s.id_kurator = sh.id_kurator
    OR
        s.id_skupina = sh.id_skupina
)
SELECT
    sh.id_student,
    sh.jmeno,
    sh.prijmeni,
    k.jmeno AS kurator_jmeno,
    sk.zacatek,
    sk.konec
FROM
    StudentHierarchy sh
LEFT JOIN
    kurator k ON sh.id_kurator = k.id_kurator
LEFT JOIN
    skupina sk ON sh.id_skupina = sk.id_skupina;