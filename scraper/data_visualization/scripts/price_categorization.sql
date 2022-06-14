WITH _MAX AS
         (SELECT 'MAX'    AS opis,
                 count(*) AS cnt,
                 0        as rank
          FROM automobili),
     b AS
         (SELECT 'Manje od 2.000' AS opis,
                 count(*)         AS cnt,
                 2                as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) < 2000),
     c AS
         (SELECT '2000-4999' AS opis,
                 count(*)    AS cnt,
                 3           as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) BETWEEN 2000 AND 4999),
     d AS
         (SELECT '5000-9999' AS opis,
                 count(*)    AS cnt,
                 4           as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) BETWEEN 5000 AND 9999),
     e AS
         (SELECT '10000-14999' AS opis,
                 count(*)      AS cnt,
                 5             as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) BETWEEN 10000 AND 14999),
     f AS
         (SELECT '15000-19999' AS opis,
                 count(*)      AS cnt,
                 6             as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) BETWEEN 15000 AND 19999),
     g AS
         (SELECT '20000-24999' AS opis,
                 count(*)      AS cnt,
                 7             as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) BETWEEN 20000 AND 24999),
     h AS
         (SELECT '25000-29999' AS opis,
                 count(*)      AS cnt,
                 8             as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) BETWEEN 25000 AND 29999),
     i AS
         (SELECT 'Vise od 30000' AS opis,
                 count(*)        AS cnt,
                 9               as rank
          FROM automobili a
          WHERE (SELECT coalesce(a.cena_popust, a.cena_regularna)) >= 30000)
select *
from (SELECT b.opis, b.cnt as ukupno, ((b.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, b.rank as rank
      from b,
           _MAX
      UNION
      SELECT c.opis, c.cnt as ukupno, ((c.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, c.rank as rank
      from c,
           _MAX
      UNION
      SELECT d.opis, d.cnt as ukupno, ((d.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, d.rank as rank
      from d,
           _MAX
      UNION
      SELECT e.opis, e.cnt as ukupno, ((e.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, e.rank as rank
      from e,
           _MAX
      UNION
      SELECT f.opis, f.cnt as ukupno, ((f.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, f.rank as rank
      from f,
           _MAX
      UNION
      SELECT g.opis, g.cnt as ukupno, ((g.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, g.rank as rank
      from g,
           _MAX
      UNION
      SELECT h.opis, h.cnt as ukupno, ((h.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, h.rank as rank
      from h,
           _MAX
      UNION
      SELECT i.opis, i.cnt as ukupno, ((i.cnt)::real / (_MAX.cnt)::real * 100)::real as procenat, i.rank as rank
      from i,
           _MAX) as x
order by rank
