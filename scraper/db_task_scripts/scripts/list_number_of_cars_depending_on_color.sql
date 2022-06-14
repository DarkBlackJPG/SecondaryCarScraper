SELECT boja.naziv as Boja,
       count(*) as "Broj automobila"
FROM boja
JOIN automobili a ON boja.id = a.boja_eksterijer
GROUP BY boja.naziv