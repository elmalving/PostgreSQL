INSERT INTO dochazka (id_student, mesic, procento_dochazky)
SELECT
  s.id_student,
  'February',
  (random() * 100)::int + 1 as procento_dochazky
FROM student s
LIMIT 20;