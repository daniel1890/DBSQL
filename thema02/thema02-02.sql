/* selecteer alle stukken van componisten van de reijnders'  muziekschool */

select s.stuknr, s.titel
from Componist c, Stuk s, Muziekschool m
where c.componistId = s.componistId
and c.schoolId = m.schoolId
and m.naam = 'Reijnders'' Muziekschool'