SELECT
    RANK() OVER (PARTITION BY skupina ORDER BY datum_narozeni) AS total_rows
FROM student
WHERE id_adresa = 2;
