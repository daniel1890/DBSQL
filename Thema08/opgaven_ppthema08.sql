-- geef het stuknr, titel en componistnaam van alle stukken
-- gecomponeerd door een muziekschooldocent

select S.stuknr, S.titel, C.naam
FROM Stuk S
INNER JOIN Componist C
ON S.componistId = C.componistId
WHERE C.schoolId IS NOT NULL;

-- zelfde als 1 maar geef de muziekschool naam ook weer in tabel.

SELECT S.stuknr, S.titel, C.naam, M.naam
FROM Stuk S
INNER JOIN Componist C
ON S.componistId = C.componistId
INNER JOIN Muziekschool M
ON C.schoolId = M.schoolId
WHERE C.schoolId IS NOT NULL;

-- geef voor alle jazzstukken het stuknr, titel de speelduur
-- en als het een speelstuk betreft ook de niveauomschrijving

SELECT S.stuknr, S.titel, S.speelduur, N.omschrijving
FROM Stuk S
LEFT OUTER JOIN Niveau N
ON S.niveaucode = N.niveaucode
WHERE genrenaam = 'jazz';

SELECT S.stuknr, S.titel, S.speelduur, N.omschrijving
FROM Stuk S
INNER JOIN Niveau N
ON S.niveaucode = N.niveaucode
WHERE genrenaam = 'jazz';