CREATE VIEW MeestBekekenFilmsLaatste2Maanden (title, publication_year, aantal_keer_bekeken)
	AS SELECT M.title, M.publication_year, COUNT(W.movie_id) AS AantalKeerBekeken
	FROM WatchHistory W
	INNER JOIN Movie M
	ON W.movie_id = M.movie_id
	WHERE watch_date >= DATEADD(MONTH, -2, '2017-01-11')
	GROUP BY M.title, M.publication_year