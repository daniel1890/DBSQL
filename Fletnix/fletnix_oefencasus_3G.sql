CREATE VIEW Top100MinstBekekenFilms(title, aantalkeerbekeken)
	AS SELECT TOP(100) title, COUNT(W.movie_id) AS AantalKeerBekeken
	FROM Movie M
	LEFT OUTER JOIN WatchHistory W
	ON M.movie_id = W.movie_id
	GROUP BY title
	ORDER BY COUNT(W.movie_id)