INSERT INTO student (id_adresa, id_kurator, id_skupina, datum_narozeni, jazyk, jmeno, prijmeni, telefonni_cislo)
SELECT
  (random() * (SELECT COUNT(*) FROM adresa))::int % (SELECT COUNT(*) FROM adresa) + 1 as id_adresa,
  (random() * (SELECT COUNT(*) FROM kurator))::int % (SELECT COUNT(*) FROM kurator) + 1 as id_kurator,
  (random() * (SELECT COUNT(*) FROM skupina))::int % (SELECT COUNT(*) FROM skupina) + 1 as id_skupina,
  '2000-01-01'::DATE + (random() * (interval '1460 days'))::INTERVAL as datum_narozeni,
  'Language ' || (random() * 10 + 1)::int as jazyk,
  'Name ' || generate_series::text as jmeno,
  'Surname ' || generate_series::text as prijmeni,
  '+123456789' || (random() * 10000)::int as telefonni_cislo
FROM generate_series(1, 100);