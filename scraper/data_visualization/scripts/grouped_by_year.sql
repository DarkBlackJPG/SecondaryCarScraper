SELECT  'Pre 1960' as group, count(*), 1 as rank
from automobili
where godiste < 1960
union
SELECT  '1961-1970' as group, count(*), 2 as rank
from automobili
where godiste between 1961 and 1970
union
SELECT  '1971-1980' as group, count(*), 3 as rank
from automobili
where godiste between 1971 and 1980
union
SELECT  '1981-1990' as group, count(*), 4 as rank
from automobili
where godiste between 1981 and 1990
union
SELECT  '1991-2000' as group, count(*), 5 as rank
from automobili
where godiste between 1991 and 2000
union
SELECT  '2001-2010' as group, count(*), 6 as rank
from automobili
where godiste between 2001 and 2010
union
SELECT  '2011-2015' as group, count(*), 7 as rank
from automobili
where godiste between 2011 and 2015
union
SELECT  '2016-2020' as group, count(*), 8 as rank
from automobili
where godiste between 2016 and 2020
union
SELECT  '2021-2022' as group, count(*), 9 as rank
from automobili
where godiste between 2021 and 2022
order by rank