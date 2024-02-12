WITH RECURSIVE MistnostCTE AS (
  SELECT
    (random() * (SELECT COUNT(*) FROM univerzita))::int % (SELECT COUNT(*) FROM univerzita) + 1 as id_univerzita,
    (random() * 100)::int + 1 as cislo_mistnosti,
    (random() * 20)::int + 1 as kapacita
  FROM generate_series(1, 20)
  UNION ALL
  SELECT
    mc.id_univerzita,
    CASE
      WHEN mc.cislo_mistnosti = m.cislo_mistnosti THEN m.cislo_mistnosti + 1
      ELSE m.cislo_mistnosti
    END as cislo_mistnosti,
    mc.kapacita
  FROM MistnostCTE mc
  JOIN mistnost m ON mc.cislo_mistnosti = m.cislo_mistnosti AND mc.id_univerzita = m.id_univerzita
)

INSERT INTO mistnost (id_univerzita, cislo_mistnosti, kapacita)
SELECT id_univerzita, cislo_mistnosti, kapacita FROM MistnostCTE;