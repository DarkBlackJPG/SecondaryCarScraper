SELECT count(*), 'Pre 1960' as group, 1 as rank
from automobili
where godiste < 1960
union
SELECT count(*), '1961-1970' as group, 2 as rank
from automobili
where godiste between 1961 and 1970
union
SELECT count(*), '1971-1980' as group, 3 as rank
from automobili
where godiste between 1971 and 1980
union
SELECT count(*), '1981-1990' as group, 4 as rank
from automobili
where godiste between 1981 and 1990
union
SELECT count(*), '1991-2000' as group, 5 as rank
from automobili
where godiste between 1991 and 2000
union
SELECT count(*), '2001-2010' as group, 6 as rank
from automobili
where godiste between 2001 and 2010
union
SELECT count(*), '2011-2015' as group, 7 as rank
from automobili
where godiste between 2011 and 2015
union
SELECT count(*), '2016-2020' as group, 8 as rank
from automobili
where godiste between 2016 and 2020
union
SELECT count(*), '2021-2022' as group, 9 as rank
from automobili
where godiste between 2021 and 2022
order by rank