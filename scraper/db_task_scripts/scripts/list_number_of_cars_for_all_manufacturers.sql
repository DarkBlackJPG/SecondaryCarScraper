SELECT marka.naziv as Marka,
       COUNT(*) as "Broj automobila"
FROM marka
JOIN automobili a ON marka.id = a.marka
GROUP BY marka.naziv