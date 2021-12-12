-- Maak queries voor de volgende informatiebehoefte; toon daarbij de kolommen die tussen de blokhaken staan:
-- A. Alle films gesorteerd naar genre [movie title, publication year, genre]

USE DBFLETNIX

SELECT M.title, M.publication_year, MG.genre_name
FROM Movie M
INNER JOIN Movie_Genre MG
ON M.movie_id = MG.movie_id
ORDER BY MG.genre_name ASC

-- B. Alle movies die tussen 1990 en 2010 geproduceerd zijn.

SELECT *
FROM Movie
WHERE publication_year BETWEEN 1990 AND 2010
ORDER BY publication_year ASC

-- C. Alle klanten die op dit moment actief zijn (i.e. subscription_end moet leeg zijn, of subscription_end ligt in de toekomst) [customer lastname, firstname, subscription_start]

SELECT C.name, C.subscription_start
FROM Customer C
WHERE C.subscription_end IS NULL

-- D. De cast uit alle Terminator movies uit het jaar 1991 [id, title, firstname, lastname, role]

SELECT M.movie_id, M.title, P.firstname, P.lastname, C.role
FROM Person P
INNER JOIN Movie_Cast C
ON P.person_id = C.person_id
INNER JOIN Movie M
ON C.movie_id = M.movie_id
WHERE M.title LIKE '%Terminator%'
AND M.publication_year = 1991

-- E. Alle movies waarin de acteur “Arnold Schwarzenegger” een rol speelt [movie title, publication year]

SELECT P.firstname, P.lastname, M.title, M.publication_year
FROM Person P
INNER JOIN Movie_Cast C
ON P.person_id = C.person_id
INNER JOIN Movie M
ON C.movie_id = M.movie_id
WHERE P.firstname = 'arnold'
AND P.lastname = 'Schwarzenegger'
ORDER BY M.publication_year ASC

-- F. Alle gebruikers met openstaande kosten [Customer lastname, firstname, total price]Maak een View voor deze informatiebehoefte.

SELECT C.name, sum(price) AS totaalOpenstaandBedrag
	FROM WatchHistory W
	INNER JOIN Customer C
	ON W.customer_mail_address = C.customer_mail_address
	GROUP BY C.name

SELECT *
FROM OpenstaandeKostenPerGebruiker

-- G. Toon 100 movies die tot nu toe het minst bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Dit houdt ook 0 keer in [movie title, number of times watched]. Maak een View voor deze informatiebehoefte.
-- Gebruik left outer join om ook kolommen te weergeven met 0 waardes, als je inner join zou gebruiken zouden de resultaten met 0 keer bekeken niet getoond worden.

SELECT TOP(100) title, COUNT(W.movie_id) AS AantalKeerBekeken
FROM Movie M
LEFT OUTER JOIN WatchHistory W
ON M.movie_id = W.movie_id
GROUP BY title
ORDER BY COUNT(W.movie_id)

SELECT * 
FROM Top100MinstBekekenFilms

-- H. Alle movies die in de afgelopen twee maanden het meest bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Toon alleen movies die minimaal één keer bekeken zijn [movie title, publication_year, number of times watched].Maak een View voor deze informatiebehoefte.De sortering kun je niet binnen de view doen, laat die buiten de view.

SELECT M.title, M.publication_year, COUNT(W.movie_id) AS AantalKeerBekeken
FROM WatchHistory W
INNER JOIN Movie M
ON W.movie_id = M.movie_id
WHERE watch_date >= DATEADD(MONTH, -2, '2017-01-11')
GROUP BY M.title, M.publication_year
ORDER BY COUNT(W.movie_id)

-- het lukt niet om de order by te gebruiken, vraag aan docent.
SELECT *
FROM MeestBekekenFilmsLaatste2Maanden
ORDER BY COUNT(*)

-- I. Alle movies die meer dan 3 genres hebben [title, publication_year]

SELECT title, M.movie_id, publication_year, COUNT(*) AS AantalGenres
FROM Movie M
INNER JOIN Movie_Genre MG
ON M.movie_id = MG.movie_id
GROUP BY title, M.movie_id, publication_year
HAVING COUNT(*) >= 4

-- J. Alle vrouwen die in Horror movies en Family movies gespeeld hebben [firstname,lastname].

SELECT P.firstname, P.lastname, MG.genre_name
FROM Movie_Cast MC
INNER JOIN Person P
ON MC.person_id = P.person_id
INNER JOIN Movie M
ON MC.movie_id = M.movie_id
INNER JOIN Movie_Genre MG
ON MC.movie_id = MG.movie_id
WHERE P.gender = 'F'
AND MG.genre_name IN ('Action', 'Adventure')


-- K. De director die tot nu toe de meeste films geproduceerd heeft [firstname, lastname].

SELECT P.firstname, P.lastname, COUNT(*) AS FilmsGeproduceerd
FROM Movie_Directors MD
INNER JOIN Person P
ON MD.person_id = P.person_id
GROUP BY P.firstname, P.lastname

-- L. Alle Genres en het percentage dat de films uit het bepaalde genre uitmaken t.o.v. het totale aantalfilms [genre, percentage], gesorteerd op meest populaire genre.Maak een View voor deze informatiebehoefte. Je mag ook eerst één of meerdere (hulp-)views maken om de informatiebehoefte op te lossen.

SELECT MG.genre_name, AVG(*)
FROM Movie_Genre MG
INNER JOIN Movie M
ON MG.movie_id = M.movie_id
GROUP BY MG.genre_name

-- M. Gebruikers [mail_adress] en het gemiddelde aantal films die elke gebruiker per dag kijkt. Toon alleen gebruikers die gemiddeld 2 of meer films per dag kijken, met het grootste gemiddelde bovenaan.Maak een View voor deze informatiebehoefte. Je mag ook eerst één of meerdere (hulp-)views maken om de informatiebehoefte op te lossen.

