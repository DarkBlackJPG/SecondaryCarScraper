-- Jebena kancercina od upita :D
WITH _MAX AS
         (SELECT 'MAX'    AS opis,
                 count(*) AS cnt
          FROM automobili),
     a AS
         (SELECT menjac.opis        AS opis,
                 count(menjac.opis) AS cnt
          FROM automobili
                   JOIN menjac ON automobili.menjac = menjac.id
          GROUP BY menjac.opis
          HAVING LOWER(menjac.opis) like '%utomatski%'),
     b AS
         (SELECT menjac.opis        AS opis,
                 count(menjac.opis) AS cnt
          FROM automobili
                   JOIN menjac ON automobili.menjac = menjac.id
          GROUP BY menjac.opis
          HAVING LOWER(menjac.opis) like '%manuelni%'),
     accumulated_data AS
         (SELECT 'Automatski' AS opis,
                 sum(a.cnt)   AS cnt
          FROM a
          UNION
          SELECT 'Manuelni' AS opis,
                 sum(b.cnt) AS cnt
          FROM b)
SELECT accumulated_data.opis,
       ((accumulated_data.cnt)::real / (_MAX.cnt)::real * 100)::real AS percent,
       (accumulated_data.cnt)::integer                                          as ukupno
FROM _MAX,
     accumulated_data
