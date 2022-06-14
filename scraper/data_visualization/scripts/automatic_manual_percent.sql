-- Jebena kancercina od upita :D
WITH divisor AS
  (SELECT 'MAX' AS opis,
          count(*) AS cnt
   FROM automobili),
     a AS
  (SELECT menjac.opis AS opis,
          count(menjac.opis) AS cnt
   FROM automobili
   JOIN menjac ON automobili.menjac = menjac.id
   GROUP BY menjac.opis
   HAVING LOWER(menjac.opis) like '%utomatski%'),
     b AS
  (SELECT menjac.opis AS opis,
          count(menjac.opis) AS cnt
   FROM automobili
   JOIN menjac ON automobili.menjac = menjac.id
   GROUP BY menjac.opis
   HAVING LOWER(menjac.opis) like '%manuelni%'),
     divider AS
  (SELECT 'Automatski' AS opis,
          sum(a.cnt) AS cnt
   FROM a
   UNION SELECT 'Manuelni' AS opis,
                sum(b.cnt) AS cnt
   FROM b)
SELECT divider.opis,
       ((divider.cnt)::real/(divisor.cnt)::real * 100)::real AS percent
FROM divider,
     divisor
UNION
SELECT 'Automatski_ukupno' AS opis,
       sum(a.cnt) AS percent
FROM a
UNION
SELECT 'Manuelni_ukupno' AS opis,
       sum(b.cnt) AS percent
FROM b