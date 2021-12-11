-- Van welke componisten zijn er 2 of meer stukken aanwezig? Geef de namen van deze componisten en het aantal aanwezige stukken. Orden op aantal (van groot naar klein).

SELECT C.naam, COUNT(*) AS AantalStukken
FROM Stuk S
INNER JOIN Componist C
ON S.componistId = C.componistId
GROUP BY C.naam
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) desc

-- Geef stuknr, titel en componistnaam van alle jazzstukken met een bezetting van  precies vijf instrumenten.

SELECT S.stuknr, S.titel, C.naam, COUNT(*) AS AantalUniekeInstrumenten
FROM Stuk S
INNER JOIN Componist C
ON S.componistId = C.componistId
INNER JOIN Bezettingsregel B
ON S.stuknr = B.stuknr
GROUP BY S.titel, C.naam, S.stuknr
HAVING COUNT(*) = 4

SELECT S.stuknr, S.titel, C.naam, sum(B.aantal) AS AantalInstrumenten
FROM Stuk S
INNER JOIN Componist C
ON S.componistId = C.componistId
INNER JOIN Bezettingsregel B
ON S.stuknr = B.stuknr
GROUP BY S.titel, C.naam, S.stuknr
HAVING sum(B.aantal) = 5
