SELECT marka.naziv as Marka,
       model.naziv as Model,
       coalesce(automobili.cena_popust, automobili.cena_regularna) AS Cena,
       grad.naziv as Grad,
       automobili.broj_oglasa as "Broj oglasa",
       automobili.snaga_ks as "Konjskih snaga"
FROM model
JOIN marka ON marka.id = model.marka
JOIN automobili ON model.id = automobili.model
JOIN grad ON automobili.grad = grad.id
ORDER BY snaga_ks DESC
LIMIT 1; -- horsepower
