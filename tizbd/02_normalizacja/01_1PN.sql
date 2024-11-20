-- 1. Utwórz bazę firma
    CREATE DATABASE 4e_1firma;
-- 2. Utwórz tabelę Pracownicy
    CREATE TABLE pracownicy(
        imie_nazwisko varchar(255),
        jezyk varchar(50),
        adres varchar(100)
    );
-- imię nazwisko
-- język
-- adres
-- 3. wpisz dane:
INSERT INTO pracownicy
VALUES
('Jan Kowalski', 'PHP', 'os. Wł. Łokietka 3/4 Naklo nad Notecia'),
('Antoni Malinowski', 'HTML CSS PHP' , 'Chrzastowo 1'),
('Jan Malinowski', 'Java HTML', 'ul. Ogrodowa 2, Nowa Wies Wielka'),
('Andrzej Ziemianski', 'JavaScript CSS HTML','ul. Sowia 5, Nowa Wies');


-- 4. Wykonaj zapytania

-- A. Wypisz pracowników, którzy znają język PHP
SELECT imie_nazwisko
FROM pracownicy
WHERE jezyk LIKE '%PHP%';
-- B. Wypisz pracowników, którzy znają język Java
SELECT imie_nazwisko
FROM pracownicy
WHERE jezyk LIKE '%Java%' AND jezyk NOT LIKE '%JavaScript%';
-- C. Wypisz pracowników mieszkających w Nakle nad Notecią
SELECT imie_nazwisko
FROM pracownicy
WHERE adres LIKE '%Naklo nad Notecia%';
-- D. Wypisz pracowników mieszkających w Nowej Wsi
SELECT * FROM pracownicy
WHERE adres LIKE '%Nowa Wies%';
-- E. Wypisz wszystkie nazwy miejscowości pracowników
SELECT * FROMN
-- C. Wypisz imiona i nazwiska pracowników posortowane według nazwisk (ORDER BY)
-- 5. Jeśli masz problemy z wykonaniem zapytań, popraw strukturę tabeli i wpisz na nowo dane - tak, aby tych problemów już nie mieć