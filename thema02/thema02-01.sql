/* 
Geef voor elk jazzstuk van nivea A het stuknummer, de titel en de naam van de componist

select stuknr, titel, naam from componist, stuk
where niveaucode = 'A'
and genrenaam = 'jazz' 
FOUT
*/

select stuknr, titel, naam
from componist, stuk
where componist.componistId = stuk.componistId
and genrenaam = 'jazz'
and niveaucode = 'A'