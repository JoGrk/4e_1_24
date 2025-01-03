-- 1. Utwórz bazę firma
    CREATE DATABASE 4e_1_firma;
    use 4e_1_firma;
-- 2. Utwórz tabelę Pracownicy
    CREATE TABLE pracownicy(
        imie varchar(255),
        nazwisko varchar(255),
        jezyk varchar(50),
        ulica varchar(100),
        nr_domu varchar(100),
        miejscowosc varchar(100)
    );
-- imię nazwisko
-- język
-- adres
-- 3. wpisz dane:
INSERT INTO pracownicy
VALUES
('Jan', 'Kowalski', 'PHP', 'os. Wł. Łokietka', '3/4', 'Naklo nad Notecia'),

('Antoni', 'Malinowski', 'HTML' , '', '1', "Chrzastowo"),
('Antoni', 'Malinowski', 'CSS' , '', '1', "Chrzastowo"),
('Antoni', 'Malinowski', 'PHP' , '', '1', "Chrzastowo"),
('Jan', 'Malinowski', 'Java', 'ul. Ogrodowa', '2', 'Nowa Wies Wielka'),
('Jan', 'Malinowski', 'HTML', 'ul. Ogrodowa', '2', 'Nowa Wies Wielka'),
('Andrzej', 'Ziemianski', 'JavaScript','ul. Sowia', '5', 'Nowa Wies'),
('Andrzej', 'Ziemianski', 'CSS','ul. Sowia', '5', 'Nowa Wies'),
('Andrzej', 'Ziemianski', 'HTML','ul. Sowia', '5', 'Nowa Wies');


-- 4. Wykonaj zapytania

-- A. Wypisz pracowników, którzy znają język PHP
SELECT imie, nazwisko
FROM pracownicy
WHERE jezyk ='PHP';
-- B. Wypisz pracowników, którzy znają język Java
SELECT imie, nazwisko
FROM pracownicy
WHERE jezyk ='Java';
-- C. Wypisz pracowników mieszkających w Nakle nad Notecią
SELECT imie, nazwisko
FROM pracownicy
WHERE miejscowosc='Naklo nad Notecia';
-- D. Wypisz pracowników mieszkających w Nowej Wsi
SELECT DISTINCT imie, nazwisko
FROM pracownicy
WHERE miejscowosc='Nowa wies';
-- E. Wypisz wszystkie nazwy miejscowości pracowników
SELECT DISTINCT miejscowosc
FROM pracownicy;

-- F. Wypisz imiona i nazwiska pracowników posortowane według nazwisk (ORDER BY)
SELECT DISTINCT imie,nazwisko
FROM pracownicy
ORDER BY nazwisko;
-- 5. Jeśli masz problemy z wykonaniem zapytań, popraw strukturę tabeli i wpisz na nowo dane - tak, aby tych problemów już nie mieć




-- - A. Jan Malinowski nauczył się C#
INSERT INTO pracownicy
VALUES
('Jan', 'Malinowski', 'C#', 'ul. Ogrodowa', '2', 'Nowa Wies Wielka');

-- - B. Jan Malinowski nie umie JAVA'Y
DELETE FROM pracownicy
WHERE
imie ='JAN' AND nazwisko='Malinowski' AND jezyk='Java';

-- - B. Jan Kowalski jednak nie umie PHP


