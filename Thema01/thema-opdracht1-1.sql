select titel, genrenaam, jaartal
from stuk
where genrenaam in ('jazz', 'pop')
and niveaucode = 'A'
/* where genrenaam = 'jazz' or genrenaam = 'pop' */
order by jaartal desc, titel asc
