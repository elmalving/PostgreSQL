CREATE VIEW student_skupina_kurator_info AS
SELECT
    s.id_student,
    s.jmeno AS student_jmeno,
    s.prijmeni AS student_prijmeni,
    k.jmeno AS kurator_jmeno,
    k.prijmeni AS kurator_prijmeni,
    sk.zacatek AS skupina_zacatek,
    sk.konec AS skupina_konec
FROM
    student s
INNER JOIN
    skupina sk ON s.id_skupina = sk.id_skupina
INNER JOIN
    kurator k ON s.id_kurator = k.id_kurator;