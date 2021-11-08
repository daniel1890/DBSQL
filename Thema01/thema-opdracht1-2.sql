/* titel, niveacode van stuk voor gevorderden */

select titel, niveaucode from stuk
where genrenaam = 'klassiek'
and niveaucode = 'B'
order by titel asc
