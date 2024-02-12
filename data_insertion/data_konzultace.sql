INSERT INTO konzultace (id_student, datum, doba)
SELECT
  s.id_student,
  '2024-02-14'::DATE,
  ('10:00'::TIME + (random() * interval '6 hours'))::TIME(0)
FROM student s
LIMIT 5;