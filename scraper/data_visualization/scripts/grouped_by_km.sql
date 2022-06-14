SELECT count(*), 'Manje od 50.000' as group, 1 as rank
from automobili
where kilometraza < 50000
union
SELECT count(*), '50.000 - 99.999' as group, 2 as rank
from automobili
where kilometraza between 50000 and 99999
union
SELECT count(*), '100.000 - 149.999' as group, 3 as rank
from automobili
where kilometraza between 100000 and 149999
union
SELECT count(*), '150.000 - 199.999' as group, 4 as rank
from automobili
where kilometraza between 150000 and 199999
union
SELECT count(*), '200.000 - 249.999' as group, 5 as rank
from automobili
where kilometraza between 200000 and 249999
union
SELECT count(*), '250.000 - 299.999' as group, 6 as rank
from automobili
where kilometraza between 250000 and 299999
union
SELECT count(*), 'Vise od 300.000' as group, 7 as rank
from automobili
where kilometraza < 300000
order by rank
