SELECT * FROM Cursus
SELECT * FROM Docent

-- Query die de cursus tabel update, de kolom met de naam examinator waarin de waarde 'COD' bevindt wordt geleegd en op NULL gezet.

UPDATE Cursus
SET examinator = NULL
WHERE examinator = 'COD'

-- Query die de cursus tabel update, alle kolommen die in de uren kolom staan worden vermenigvuldigd met 1.1.

UPDATE Cursus
SET uren = uren * 1.1;