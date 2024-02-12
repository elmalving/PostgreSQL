SELECT
    COUNT(*) OVER () AS total_rows
FROM student
WHERE id_adresa = 2
LIMIT 1;