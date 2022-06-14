SELECT grad.naziv as Grad,
       count(*) as "Broj automobila"
FROM grad
JOIN automobili a ON grad.id = a.grad
GROUP BY grad.naziv