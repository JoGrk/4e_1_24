-- a) Zwrócenie tytułów filmów, dla których gatunek to SF,
SELECT Tytul
FROM filmy
WHERE Gatunek = 'SF';
-- b) Zwrócenie wszystkich tytułów filmów wraz z nazwiskami reżyserów,
SELECT Tytul, Imie, Nazwisko
FROM filmy
    JOIN rezyserzy ON filmy.RezyserID= rezyserzy.IDRezyser ;

-- c) Zwrócenie filmów, dla których ocena w recenzji jest równa 4, 
SELECT tytul, gatunek, tresc
FROM filmy
    JOIN recenzje ON filmy.recenzjaID= recenzje.IDRecenzja;