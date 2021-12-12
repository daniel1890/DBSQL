USE muziekdatabase

-- Gegeven is de volgende informatiebehoefte: Geef stuknr en titel van alle jazzstukken waarbij een saxofoon wordt gebruikt.
-- Los deze query op twee manieren op: een keer als join en een keer als query met subquery.

SELECT S.stuknr, S.titel
FROM Stuk S
INNER JOIN Bezettingsregel B
ON S.stuknr = B.stuknr
WHERE S.genrenaam = 'jazz'
AND B.instrumentnaam = 'saxofoon';

SELECT S.stuknr, S.titel
FROM Stuk S
WHERE S.stuknr IN
	(
	SELECT B.stuknr
	FROM Bezettingsregel B
	WHERE B.instrumentnaam = 'saxofoon'
	)
AND S.genrenaam = 'jazz'

SELECT *
FROM Stuk

-- Dezelfde vraag voor de volgende informatiebehoefte: Geef de namen van alle componisten waarvoor meer dan twee stukken zijn vastgelegd.

SELECT C.naam, COUNT(*) AS Aantal
FROM Componist C
INNER JOIN Stuk S
ON C.componistId = S.componistId
GROUP BY C.naam
HAVING COUNT(*) >= 2

SELECT C.naam, COUNT(*) AS Aantal
FROM Componist C
WHERE C.componistId IN
	(
	SELECT S.stuknr
	FROM Stuk S
	)
GROUP BY C.naam
HAVING COUNT(*) >= 1


-- Gegeven is de volgende informatiebehoefte: Geef alle klassieke stukken waarvoor geen bezetting is vastgelegd.
-- Kun je deze query ook op twee manieren oplossen? Geef jouw oplossing(en).

SELECT S.titel, S.stuknr
FROM Stuk S
WHERE S.stuknr NOT IN
	(
	SELECT B.stuknr
	FROM Bezettingsregel B
	WHERE B.stuknr = S.stuknr
	)
AND S.genrenaam = 'klassiek'

SELECT S.titel, S.stuknr
FROM Stuk S
LEFT OUTER JOIN Bezettingsregel B
ON S.stuknr = B.stuknr
WHERE B.stuknr IS NULL
AND S.genrenaam = 'klassiek'


-- Kun je de informatiebehoefte van onderdeel C oplossen met een outer join? Zo ja, geef de oplossing. Zo nee, leg uit waarom.
