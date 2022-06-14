SELECT grad.naziv, count(*) as broj
from grad
         join automobili a on grad.id = a.grad
group by grad.naziv
order by broj desc
limit 10