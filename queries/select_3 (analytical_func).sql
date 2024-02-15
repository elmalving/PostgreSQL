SELECT
    jmeno, RANK() OVER (PARTITION BY id_skupina ORDER BY datum_narozeni DESC) AS total_rows
FROM student
WHERE id_adresa = 2;
