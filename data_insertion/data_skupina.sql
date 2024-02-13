INSERT INTO skupina (id_mistnost, id_lektor, konec, zacatek)
SELECT
  (random() * (SELECT COUNT(*) FROM mistnost))::int % (SELECT COUNT(*) FROM mistnost) + 1 as id_mistnost,
  (random() * (SELECT COUNT(*) FROM lektor))::int % (SELECT COUNT(*) FROM lektor) + 1 as id_lektor,
  ('16:00'::TIME + (random() * interval '2 hours'))::TIME(0) as konec,
  ('12:00'::TIME + (random() * interval '2 hours'))::TIME(0) as zacatek
FROM generate_series(1, 15);