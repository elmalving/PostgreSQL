INSERT INTO vylet (datum, mesto)
SELECT
  '2024-02-14'::DATE + (random() * interval '365 days') as datum,
  'City ' || generate_series as mesto
FROM generate_series(1, 10);

INSERT INTO vylet_student (id_student, id_vylet)
SELECT
  (random() * (SELECT COUNT(*) FROM student))::int % (SELECT COUNT(*) FROM student) + 1 as id_student,
  (random() * (SELECT COUNT(*) FROM vylet))::int % (SELECT COUNT(*) FROM vylet) + 1 as id_vylet
FROM generate_series(1, 10);