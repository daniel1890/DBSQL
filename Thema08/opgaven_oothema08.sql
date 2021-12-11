-- Geef voor elke inschrijving het nummer en de naam van de student, de cursuscode en de behaalde cijfers.

SELECT S.naam, S.nr,  I.cijfer, I.cursus
FROM Inschrijving I
INNER JOIN Student S
ON I.student = S.nr;

-- Geef voor elke student het studentnummer, de studentnaam, de coursecodes en coursenamen van zijn/haar inschrijvingen en de naam van de bijbehorende cursus examinator.  Hint: Hiervoor heb je 4 tabellen nodig. 

SELECT S.nr, S.naam, C.code, C.examinator
FROM Student S
INNER JOIN Cursus C
ON S.mentor = C.examinator

-- Geef een SELECT-statement voor de volgende informatiebehoefte: Geef de naam van elke docent tezamen met de naam van de docent die hem/haar kan vervangen. Hint: Hiervoor heb je een selfjoin nodig. 

SELECT D.naam, D.vervanger
FROM Docent D
INNER JOIN Docent V
ON D.vervanger = V.vervanger
