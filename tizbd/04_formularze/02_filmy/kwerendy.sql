-- "Wypisz wszystkie tytuły filmów wraz z nazwiskami reżyserów"
SELECT tytul,Nazwisko
FROM filmy
    INNER JOIN rezyserzy ON filmy.RezyserID = rezyserzy.IDRezyser;

-- wypisz imiona i nazwiska reżyserów wraz z liczbą ich filmów dostępnych w bazie danych
SELECT imie,nazwisko,COUNT(IDfilm) 
FROM rezyserzy
    LEFT JOIN filmy ON filmy.RezyserID = rezyserzy.IDRezyser
GROUP BY IDRezyser;


SELECT imie, nazwisko
FROM rezyserzy;

INSERT INTO rezyserzy
(imie, nazwisko)
VALUES
('Mikolaj', 'Staszek');