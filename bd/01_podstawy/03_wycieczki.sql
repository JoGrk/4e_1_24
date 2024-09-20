-- 0. Wyświetl istniejące bazy danych, utwórz bazę Wycieczka
SHOW DATABASES; 
CREATE DATABASE Wycieczka;
use Wycieczka;
-- 1. W nowej bazie danych Wycieczki utwórz tabelę Przewodnicy o następujących polach


-- przewodnik - pole jednoznacznie identyfikuje wiersz, liczby powinny pojawiać się automatycznie 

-- Telefon domowy - w polu przechowywane są teksty o długości do 15 znaków
-- nazwisko - tekst o długości do 50 znaków, pole jest wymagane
-- imię - tekst o długości do 30 znaków
 CREATE TABLE przewodnicy(
    przewodnik int PRIMARY KEY auto_increment,
    telefon_domowy varchar(15),
    nazwisko varchar(50) NOT NULL,
    imie varchar(30)
 );


 

-- 2. Utwórz tabelę  Wycieczki o następujących polach:

-- kod wycieczki - teksty o długości 4 znaków, pole identyfikuje jednoznacznie daną wycieczkę
-- przewodnik - pole w którym wpisujemy numer przewodnika 
-- cena - podaj jako domyślną cenę 1000zł
-- data rozpoczęcia - pole przechowuje daty,
-- data zakończenia - pole przechowuje daty
-- przewodnik jest kluczem obcym odwołującym się do tabeli przewodnicy
CREATE TABLE Wycieczki(
    kod_wycieczki char(4) PRIMARY KEY,
    przewodnik int,
    cena int default 1000,
    data_rozpoczecia date ,
    data_zakonczenia date,
    FOREIGN KEY(przewodnik) REFERENCES przewodnicy(przewodnik)
);

-- 3. Wyświetl istniejace tabele
SHOW TABLES;

-- 4. Wyświetl opis obu tabel
DESC Przewodnicy;
DESC Wycieczki;
-- 5. Wpisz przykładowe dane (co najmniej dwie wycieczki i dwóch przewodników) - użyj różnych wersji instrukcji
INSERT INTO Przewodnicy
(nazwisko, imie)
VALUES
('Kowalski', 'Jan'),
('Pomagali', 'Ali');
INSERT INTO wycieczki
VALUES
('1312',1,1000,'2024-09-20','2024-09-27'),
('2137',2,2000,'2024-10-10','2024-10-20');
-- 6. Wyświetl dane z obu tabel
SELECT * FROM przewodnicy;
SELECT * FROM wycieczki;
-- 7. Usuń po jednym wierszu z każdej z tabel (dobierz warunek)
DELETE FROM wycieczki
WHERE przewodnik=1; 

DELETE FROM przewodnicy
WHERE przewodnik=1;